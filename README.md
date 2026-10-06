# tsum-tsum-catalogue

Where Tsum Tsum script releases are published for the
[GAP](https://www.gapapp.app) app. The script's source is in
[tsum-tsum-script](https://github.com/TsumTsumScripts/tsum-tsum-script).

The app reads
<https://tsumtsumscripts.github.io/tsum-tsum-catalogue/catalogue.json>
as one of its built-in library sources. That file is never committed: the
*Build catalogue.json* workflow regenerates it from every `metadata.json`
here on each push to `main`, publishes it to GitHub Pages, and posts any
new script version to Discord.

```
LineTsumTsum/Production/
  metadata.json   the entry: newest version, notes, and older builds still offered
  CHANGELOG.md    what shipped in each release
  TsumTsum-*.zip  the builds metadata.json names
```

Only the release tool in tsum-tsum-script writes these (`npm run release`
there). To preview the result locally, run `bash build-catalogue.sh` (needs
`jq`) or `build-catalogue.ps1`.

The Discord announcement needs a `DISCORD_WEBHOOK_URL` repository secret.
Without it, the step does nothing.
