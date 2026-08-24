#!/usr/bin/env bash
#
# Regenerates official.json by scanning every metadata.json under this
# repo and copying its contents into the "Scripts" array. Each entry's
# "File" field is rewritten from a path relative to its own metadata.json
# into a path relative to official.json.
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
    new_file="$original_file"
  else
    new_file="$(normalize_path "$meta_dir/$original_file")"
  fi

  updated="$(printf '%s' "$content" | jq -c --arg f "$new_file" '.File = $f')"
  entries+=("$updated")
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
