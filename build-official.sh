#!/usr/bin/env bash
#
# Regenerates official.json by scanning every metadata.json under this
# repo and copying its contents into the "Scripts" array. Each entry's
# "File" field -- and every "File" inside its optional "Versions" list of
# still-installable older builds -- is rewritten into the raw GitHub
# download URL for that file, derived from the repo's own "origin" remote
# and current branch.
#
# All metadata.json files are read once into memory, the array is built
# up there, and official.json is (re)written once at the end.
#
# Requires: jq (https://jqlang.org)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$SCRIPT_DIR"
OFFICIAL_JSON="$REPO_ROOT/official.json"

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is required but was not found on PATH." >&2
  echo "Install it, e.g. 'brew install jq' (macOS) or 'apt install jq' (Linux)." >&2
  exit 1
fi

remote_url="$(git -C "$REPO_ROOT" config --get remote.origin.url || true)"
if [ -z "$remote_url" ]; then
  echo "Error: could not read the 'origin' remote URL from git." >&2
  exit 1
fi

# Normalizes any of the common remote URL shapes down to "owner/repo":
#   git@github.com:owner/repo.git
#   ssh://git@github.com/owner/repo.git
#   https://github.com/owner/repo.git
owner_repo="$(printf '%s' "$remote_url" \
  | sed -E 's#^git@([^:]+):#https://\1/#' \
  | sed -E 's#^ssh://git@#https://#' \
  | sed -E 's#\.git/?$##' \
  | sed -E 's#^https?://[^/]+/##')"

branch="$(git -C "$REPO_ROOT" branch --show-current 2>/dev/null || true)"
[ -z "$branch" ] && branch="${GITHUB_REF_NAME:-}"
if [ -z "$branch" ]; then
  echo "Error: could not determine the current git branch (detached HEAD?)." >&2
  echo "Check out a branch, or set GITHUB_REF_NAME." >&2
  exit 1
fi

# Percent-encodes each "/"-separated path segment (so spaces etc. survive
# as a URL) without encoding the "/" separators themselves.
url_encode_path() {
  local path="$1" IFS='/' seg enc out=""
  local -a segs
  segs=($path)
  for seg in "${segs[@]}"; do
    enc="$(printf '%s' "$seg" | jq -Rr @uri)"
    out="${out:+$out/}$enc"
  done
  printf '%s' "$out"
}

# Collapses "." and ".." segments in a slash-separated path. Pure bash
# (no external calls, no bash-4-only features) so it also runs under the
# bash 3.2 that ships by default on macOS.
normalize_path() {
  local path="$1" part n result="" p
  local -a parts=()
  local IFS='/'
  for part in $path; do
    case "$part" in
      '' | '.') continue ;;
      '..')
        n=${#parts[@]}
        if [ "$n" -gt 0 ] && [ "${parts[$((n-1))]}" != '..' ]; then
          unset "parts[$((n-1))]"
          parts=("${parts[@]}")
        else
          parts+=("..")
        fi
        ;;
      *) parts+=("$part") ;;
    esac
  done
  for p in "${parts[@]}"; do
    result="$result/$p"
  done
  printf '%s' "${result#/}"
}

# The download URL for a path a metadata.json names, resolved relative to the
# directory that metadata.json sits in. Used for the entry's own "File" and for
# every older build listed in "Versions".
raw_url_for() {
  local meta_dir="$1" file="$2" rel
  if [ "$meta_dir" = "." ]; then
    rel="$file"
  else
    rel="$(normalize_path "$meta_dir/$file")"
  fi
  printf 'https://github.com/%s/raw/%s/%s' "$owner_repo" "$branch" "$(url_encode_path "$rel")"
}

entries=()
while IFS= read -r meta; do
  [ -z "$meta" ] && continue
  rel_meta="${meta#"$REPO_ROOT"/}"
  meta_dir="$(dirname "$rel_meta")"

  content="$(cat "$meta")"
  raw_url="$(raw_url_for "$meta_dir" "$(printf '%s' "$content" | jq -r '.File')")"

  # "Versions" lists the builds still installable, newest first. Each gets the
  # same rewrite as the entry's own File, in the same order, so the app can
  # download an older version by URL exactly as it does the newest.
  #
  # `tr -d '\r'` because jq writes CRLF on Windows, and unlike command
  # substitution a read loop keeps that CR -- which url_encode_path then
  # faithfully turns into a %0D on the end of every download URL.
  version_urls=()
  while IFS= read -r version_file; do
    [ -z "$version_file" ] && continue
    version_urls+=("$(raw_url_for "$meta_dir" "$version_file")")
  done < <(printf '%s' "$content" | jq -r '.Versions // [] | .[] | .File' | tr -d '\r')

  if [ "${#version_urls[@]}" -eq 0 ]; then
    urls_json='[]'
  else
    urls_json="$(printf '%s\n' "${version_urls[@]}" | jq -R . | jq -s -c .)"
  fi

  # An entry with no history keeps no empty "Versions" key: a catalogue that
  # predates histories has to stay byte-identical to what it produced before.
  entry="$(printf '%s' "$content" | jq -c --arg f "$raw_url" --argjson vs "$urls_json" '
    .File = $f
    | .Versions = ((.Versions // []) | to_entries | map(.value + {File: $vs[.key]}))
    | if (.Versions | length) == 0 then del(.Versions) else . end
  ')"
  entries+=("$entry")
done < <(find "$REPO_ROOT" -type d -name .git -prune -o -type f -name 'metadata.json' -print | sort)

name="Official GAP"
if [ -f "$OFFICIAL_JSON" ]; then
  existing_name="$(jq -r '.Name // empty' "$OFFICIAL_JSON" 2>/dev/null || true)"
  [ -n "$existing_name" ] && name="$existing_name"
fi

updated="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

if [ "${#entries[@]}" -eq 0 ]; then
  jq -n --arg name "$name" --arg updated "$updated" '{Name: $name, Updated: $updated, Scripts: []}' > "$OFFICIAL_JSON"
else
  printf '%s\n' "${entries[@]}" | jq -s --arg name "$name" --arg updated "$updated" '{Name: $name, Updated: $updated, Scripts: .}' > "$OFFICIAL_JSON"
fi

echo "Wrote ${#entries[@]} script(s) to $OFFICIAL_JSON"
