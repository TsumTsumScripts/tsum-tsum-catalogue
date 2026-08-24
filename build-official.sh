#!/usr/bin/env bash
#
# Regenerates official.json by scanning every metadata.json under this
# repo and copying its contents into the "Scripts" array. Each entry's
# "File" field is rewritten into the raw GitHub download URL for that
# file, derived from the repo's own "origin" remote and current branch.
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

entries=()
while IFS= read -r meta; do
  [ -z "$meta" ] && continue
  rel_meta="${meta#"$REPO_ROOT"/}"
  meta_dir="$(dirname "$rel_meta")"

  content="$(cat "$meta")"
  original_file="$(printf '%s' "$content" | jq -r '.File')"

  if [ "$meta_dir" = "." ]; then
    rel_file="$original_file"
  else
    rel_file="$(normalize_path "$meta_dir/$original_file")"
  fi

  raw_url="https://github.com/$owner_repo/raw/$branch/$(url_encode_path "$rel_file")"

  entry="$(printf '%s' "$content" | jq -c --arg f "$raw_url" '.File = $f')"
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
