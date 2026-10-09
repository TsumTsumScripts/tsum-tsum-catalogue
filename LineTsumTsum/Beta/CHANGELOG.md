# Tsum Tsum - BETA

What shipped in each release, newest first. 
_Testing build -- please report anything odd._

## 5.0b1 - 2026-10-09

**Additions**
*Skills*
- Disney Villains (Set) plays properly, with score and coins recorded.
- Nightmare Before Christmas (Set) rerolls Oogie Boogie's dice only under 7 and tracks shrinking tsums better.
- Gaston, Coronation Day Elsa and Delay Skill ReActivation are out of Beta.
- Large tsums are recognised and chained.
*Bubbles*
- Bottom-row bubbles are popped faster, and Mid Chain strategies no longer let them pile up.
- New Save One and Save One Mid Chain strategies.
*Run control*
- Stop after games: turn off Auto Play, pause or stop after a set number of rounds.
- Quick Bar "Last round" button, and an Auto Play toggle replacing Report.
- Auto Play Game moved to the Round tab; app restart frequency is in minutes, under Device (a saved value in hours is converted).
*Quick Bar and settings*
- Redesigned in the website's playful felt look, with cream and midnight themes, tighter rows that show more at once, and a Code button that copies the settings code.
- Quick Bar shows average medals per round; tap the readout to copy the run's figures.
*Tsum List*
- Export every Tsum you own to a CSV (Chores > Tsum List > Now), favourites marked.
- It and Unlock Level jump straight to the collection's first page.
*Starter tool*
- The starter tool is now a page in your browser: start the service, install the app, restart adb, and export logs and stats as one zip, with Tsum Tsum Stats built in.
- After installing GAP, the starter asks GAP to add the Tsum Tsum library to its Sources (tap Add on the device); an "Add the Tsum Tsum library" button asks again.
- The starter keeps itself and Tsum Tsum Stats up to date: Stats updates on each start, and the page's Updates section checks for both and installs either with one click, restarting in place.
*Platform and data*
- Requires General Automation Platform 3.1 or newer.
- Each device keeps its own folder, so emulators sharing storage stop overwriting each other's files.
- Share round stats (Beta): sends your round stats to a server set in GAP's Library.
- Receiving hearts one by one always skips the ad mail; Skip first person is gone.

**Fixes**
- Chains no longer break in a round's last seconds.
- Round stats keep score and coins when the rank-up panel appears, and base coins read more reliably.
- Resuming after a pause presses Continue instead of sometimes Try Again.
- Auto Unlock MyTsum Level raises a capped single-tsum party.
- Disney Villains (Set) no longer re-fires its skill with no chains.
- Receiving hearts one by one no longer spins on the ad row.
- Select My Tsum closes the "MyTsum has been changed." dialog.
