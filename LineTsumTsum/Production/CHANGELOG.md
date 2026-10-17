# Tsum Tsum

What shipped in each release, newest first. 
## 5.3 - 2026-10-17

**Additions**
*Settings*
- Buy Open Capsule and Export Tsum List are out of beta.

## 5.2 - 2026-10-17

**Fixes**
- Page history no longer saves screenshots unless "Debug game" is on.

## 5.1 - 2026-10-17

**Additions**
*Skills*
- Disney Villains (Set) skill is out of beta.

## 5.0 - 2026-10-17

**Additions**
*Skills*
- Large tsums are recognised and chained.
- Nightmare Before Christmas (Set) improved: Oogie Boogie's dice are rerolled only under 7, and shrinking tsums are tracked better.
*Bubbles*
- Bottom-row bubbles are popped faster, and Mid Chain strategies no longer let them pile up.
- New Save One and Save One Mid Chain strategies.
*Run control*
- Game Region setting: choose whether the International or Japanese Tsum Tsum is launched when both are installed.
- Quick Bar "Last round" button, and an Auto Play toggle replacing Report.
- Auto Play Game moved to the Round tab; app restart frequency is in minutes, under Device (a saved value in hours is converted).
*Quick Bar and settings*
- New Accessible style, now the default: larger text and buttons, high contrast and a light Quick Bar. The felt look from the website is the other style, with cream and midnight themes.
- The Aa button opens Appearance: style, theme (Dark, Light or Device) and size (XS to L).
- A Code button copies the settings code, and Copy with settings list is now on by default.
- Pasting a preset export into the Code box saves its presets (a single line also applies it).
- Tap the Quick Bar readout to copy the run's figures.
- Copy debug info button: copies your device details and every setting, to paste when asking for help.
*Starter tool*
- The starter tool is now a page in your browser: start the service, install the app, restart adb, and export logs and stats as one zip, with Tsum Tsum Stats built in.
- It asks GAP to add the Tsum Tsum library to its Sources, keeps itself and Tsum Tsum Stats up to date, and has a Stop button.
- On Windows it logs each run to starter-log.txt and stays open on an error.
*Platform and data*
- Requires General Automation Platform 3.3 or newer.
- Each device keeps its own folder, so emulators sharing storage stop overwriting each other's files.
- Receiving hearts one by one always skips the ad mail; Skip first person is gone.
- Unlock Level jumps straight to the collection's first page.

**Fixes**
- Chains no longer break in a round's last seconds.
- Cinderella's skill now works with GAP.
- Resuming after a pause presses Continue instead of sometimes Try Again.
- Auto Unlock MyTsum Level raises a capped single-tsum party.
- Sending hearts is about 15% faster, no longer stalls after every heart on the Japanese game, and waits out a slow connection instead of skipping the rest of the ranking.
- Receiving hearts one by one no longer spins on the ad row, and no longer crashes the game on low-memory emulators such as MuMu Player.
- Bonus items no longer get scrambled when an event (JP) gives a free item that cannot be turned off.
- Box Buying no longer stalls on the JP build when a maxed-out Pick-Up Capsule pays out a Premium Ticket.
- Auto launch no longer waits 30 seconds for a game that is already open on MuMu (Android 15).
- Quick Bar dropdown labels (Preset, Bubble, Then) are no longer cut off at the top.
- The starter finds GAP again after its rename to General Automation Platform, and on Windows choosing a device no longer fails with "Write-NextStep is not recognized".

## 4.0 - 2026-10-04

- Nightmare Before Christmas (Set) skill added.
- Stop after games setting added (General, and the Quick Bar's second page): after a set number of rounds, turn off Auto Play, pause or stop the script.
- Settings page reorganized: Skills, Round (chain limits and bonuses) and Hearts are the first three tabs, the run settings moved to General, and setting descriptions are shorter.
- Japanese (日本語) added as a language for the settings page, Quick Bar and log.
- Copy with settings list option added: a copied settings code can carry a short list of its skill type and the settings changed from default.
- Quick Bar gained a second page, switched by the dots beside Report: heart sending and one-by-one receiving, Unlock now, Copy settings code and the other bonus items; the coin readout can switch to round/run times.
- Round stats no longer lose the score and coins when the rank-up panel appears after a round, and base coins read more reliably.

## 3.2 - 2026-10-01

- Disney Villains (Set) rounds now record score and coins in the stats file, and work with Auto Unlock MyTsum Level.

## 3.1 - 2026-10-01

- Sending hearts through the ranking is faster, and hearts sent without a "Heart sent!" popup are now counted.
- Disney Villains (Set) now plays properly.

## 3.0 - 2026-09-28

- Wait for Settle setting added: once the gauge fills, waits up to 0.0-3.0s for the board to refill before firing the skill, so it goes off on a full board.
- Delay Skill ReActivation setting added: holds a full gauge for a set time after each activation so a skill with a duration is not wasted.
- Bubbles are no longer popped the moment they appear or right after a skill fires; the Bubble Strategy spends them once the board has refilled.
- The next round starts about 3 seconds sooner after the score tally, with its count-up skipped whether or not round stats are on.
- Box Buying can buy the Pick-Up Capsule, and no longer stalls on a box's reveal card while the Quick Bar is up.
- Gaston and Coronation Elsa skills are now available.
- Fixed Unlock Level and Box Buying repeating back to back instead of waiting their set hours, and Unlock Level missing capped Tsums when the collection opened past its first page.

## 2.0 - 2026-09-19

- Version bump from 1.0 to 2.0
- "Auto Unlock MyTsum Level" setting added: when the level-up screen after a round shows "Raise level cap!" on your MyTsum, the script buys that one raise from the Tsum list and plays on.
- "Hold bubbles last fever seconds" setting added: leaves bubbles alone while a fever is about to end, so they are there to pop into the first chains after it and start the next fever sooner.
- Bubbles are popped once tsums have refilled around them, so one a burst skill leaves is no longer spent on the empty space it left.
- Skip Ruby now works like Skip Medals: rubies are left in the mailbox and the mail under them is still taken, instead of the chore stopping at the first ruby.
- Box Buying no longer stalls on the "You got a Patch!" popup a purchase can come with: it is closed like the reveal card and the sweep goes on.
- Box Buying handles the store refusing a 10-Time purchase on a nearly empty box ("You can't use 10-Time Purchases"): the sweep ends there instead of retrying into it, and the new "Ten, then one until sold out" size carries on singly to empty the box. "Buy ten at a time" became the "Boxes per purchase" dropdown.
- Auto launch finds the Japan game on its own: whichever build is installed is the one started, so nothing has to be set for it. The stats CSV gains a `build` column.
- The selected tsum is named as the running game prints it: in English on the international game, in Japanese on the Japan game.
- The JP game's Magical Time offer is now recognised and cancelled like the EN one.
- Debug tab: a Detect MyTsum button reads which tsum the pre-round screen shows selected, without playing a round.
- Rounds turn over faster: the score tally's count-up is tapped through instead of waited out.
- Round stats: a medal count with a 0 in it is no longer left blank.

## 1.0 - 2026-09-12

- Version bump from 0.13 to 1.0
