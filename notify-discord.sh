#!/usr/bin/env bash
#
# Announces new releases on Discord. Compares the official.json that was
# live before a deploy against the one just published and, for every
# script whose "Version" changed (or that is new), posts one message to
# the webhook with that script's "Message" -- its release notes -- as an
# embed. A deploy that changed no Version (e.g. only site/ was touched)
# posts nothing.
#
# Usage: notify-discord.sh OLD_OFFICIAL_JSON NEW_OFFICIAL_JSON [SITE_URL]
#
# The webhook URL is read from $DISCORD_WEBHOOK_URL, never from the repo:
# anyone holding it can post to the channel.
#
# Requires: jq (https://jqlang.org), curl

set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 OLD_OFFICIAL_JSON NEW_OFFICIAL_JSON [SITE_URL]" >&2
  exit 1
fi

old_json="$1"
new_json="$2"
site_url="${3:-}"

if [ -z "${DISCORD_WEBHOOK_URL:-}" ]; then
  echo "DISCORD_WEBHOOK_URL is not set; skipping the Discord announcement."
  exit 0
fi

# One compact embed per line, for each script whose Version differs from
# the one live before. Discord caps an embed's title at 256 characters and
# its description at 4096, so both are trimmed to fit.
embeds="$(jq -c --slurpfile old "$old_json" --arg url "$site_url" '
  ($old[0].Scripts // [] | map({key: .Name, value: .Version}) | from_entries) as $live
  | .Scripts[]
  | select($live[.Name] != .Version)
  | {
      title: ("\(.Name) \(.Version)" | .[:256]),
      description: ((.Message // "") | if length > 4096 then .[:4093] + "..." else . end),
      color: 5793266
    }
  + (if $url != "" then {url: $url} else {} end)
  + (if .MinHost then {footer: {text: "Requires GAP \(.MinHost) or newer"}} else {} end)
' "$new_json")"

if [ -z "$embeds" ]; then
  echo "No script versions changed; nothing to announce."
  exit 0
fi

sent=0
while IFS= read -r embed; do
  # Discord allows about 5 webhook posts per 2 seconds; stay well under it.
  [ "$sent" -gt 0 ] && sleep 1
  printf '%s' "$embed" | jq -c '{embeds: [.]}' \
    | curl -fsS -o /dev/null -H 'Content-Type: application/json' --data-binary @- "$DISCORD_WEBHOOK_URL"
  echo "Announced: $(printf '%s' "$embed" | jq -r .title)"
  sent=$((sent + 1))
done <<< "$embeds"
