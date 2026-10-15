# Tsum Tsum - BETA

What shipped in each release, newest first. 
_Testing build -- please report anything odd._

## 5.0b9 - 2026-10-15

**Additions**
*Boxes*
- Buy open capsule box until sold out: open a capsule in the store yourself (such as the JP one on the store's second page), press Now, and it is bought one at a time until it is gone.

## 5.0b8 - 2026-10-14

**Fixes**
- Sending hearts on a slow connection waits out the game's loading and timeout error instead of skipping the rest of the ranking.

## 5.0b7 - 2026-10-14

**Additions**
*Starter tool*
- On Windows the starter logs each run to starter-log.txt and stays open on an error, so a window that closed straight away can be diagnosed.
- The starter page has a Stop button, so the tool no longer has to be closed with Ctrl+C or by closing its window.

**Fixes**
- Sending hearts on the Japanese game no longer stalls about 5 seconds after every heart.

## 5.0b6 - 2026-10-13

**Fixes**
- Sending hearts through the ranking is about 15% faster.

## 5.0b5 - 2026-10-13

**Fixes**
- Bonus items no longer get scrambled when an event (JP) gives a free item that cannot be turned off.
- Cinderella's skill clears far more: its strokes are drawn slowly enough for the game to follow, stay on the board, and fill her skill time at every level.

## 5.0b4 - 2026-10-11

**Additions**
*Debug*
- Copy debug info button: copies your device details and every setting, to paste when asking for help.

**Fixes**
- Receiving mail one by one no longer crashes the game after a couple of minutes on low-memory emulators.

## 5.0b3 - 2026-10-09

**Additions**
*Presets*
- Pasting a preset export into the Code box saves its presets (a single line also applies it).

## 5.0b2 - 2026-10-09

**Additions**
*Quick Bar and settings*
- The Aa button opens Appearance: pick the style (Accessible or Felt), theme (Dark, Light or Device) and size (XS to L); Accessible now starts at Small.

**Fixes**
- Quick Bar dropdown labels (Preset, Bubble, Then) are no longer cut off at the top.

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

- Round stats keep score and coins when the rank-up panel appears, and base coins read more reliably.
- Resuming after a pause presses Continue instead of sometimes Try Again.
- Auto Unlock MyTsum Level raises a capped single-tsum party.
- Disney Villains (Set) no longer re-fires its skill with no chains.
- Receiving hearts one by one no longer spins on the ad row.
- Select My Tsum closes the "MyTsum has been changed." dialog.
