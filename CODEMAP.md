# CODEMAP

Which file owns what, and which document answers a question. The script's
source is `../tsum-tsum-script` (its own `CODEMAP.md`).

```
tsum-tsum-catalogue/
├── README.md                what this repo is, the channel folder layout
├── LineTsumTsum/            one folder per channel, written only by the script's release tool
│   ├── Production/          "Tsum Tsum": everyone
│   └── Beta/                "Tsum Tsum - BETA": anyone who adds it (public)
│       ├── metadata.json    the entry: Name, Version, Date, Hash, File, Message (notes), MinHost, Versions (older builds still offered)
│       ├── CHANGELOG.md     what shipped in each release, newest first
│       └── TsumTsum-*.zip   the builds metadata.json names
├── build-catalogue.sh/.ps1  folds every metadata.json into catalogue.json
├── notify-discord.sh        posts each script whose Version changed to Discord
├── catalogue.json           generated, gitignored (a local preview build)
└── .github/workflows/build-catalogue.yml  builds and publishes catalogue.json to Pages
```

## Which document answers it

| Question | Document |
|:--|:--|
| What this repo is, the channel folder layout, previewing locally | `README.md` |
| Releasing a script version or publishing the catalogue (Production, Beta; Alpha is private R2, not here) | `../tools/DEPLOYMENTS.md` § Tsum Tsum script |
| How the release tool writes here | `../tsum-tsum-script/app.gap.Tsum/config.json` (`Catalogue`), `tools/release/release.js` beside it |

## Finding a name

| Name | Where |
|:--|:--|
| `catalogue.json` (`Name` "Tsum Tsum Scripts", never changes: the app installs into a folder named after it; `Updated`; `Scripts`: each `metadata.json` with `File` and every `Versions[].File` rewritten to a `github.com/<owner>/<repo>/raw/<branch>/...` URL) | `build-catalogue.sh` (`.ps1` the same on Windows) |
| The live catalogue the GAP app reads (a built-in library source) | `https://tsumtsumscripts.github.io/tsum-tsum-catalogue/catalogue.json`, plus `deploy.json` (`ref`, `deploy_id`, `at`) the Devkit reads back |
| Discord announcement (diff of the live catalogue against the new one; secret `DISCORD_WEBHOOK_URL`, none = skipped) | `notify-discord.sh` |
| The workflow: on a push to `main` touching a `metadata.json`, the build or notify scripts or itself; `workflow_dispatch` inputs `ref` (commit to publish), `announce` (Discord, default on), `deploy_id` (set by the Devkit) | `.github/workflows/build-catalogue.yml` |
| Who writes here and publishes | the GAP Devkit: a script release writes a channel folder, then the workflow is run with a pinned `ref`. See `../tools/DEPLOYMENTS.md` |

## Commands

| Command | What |
|:--|:--|
| `bash build-catalogue.sh` / `pwsh build-catalogue.ps1` | Preview `catalogue.json` locally (needs `jq` for the `.sh`) |
| (none) | Releases and publishing go through the GAP Devkit, never by hand and never by pushing here: `../tools/DEPLOYMENTS.md` |
