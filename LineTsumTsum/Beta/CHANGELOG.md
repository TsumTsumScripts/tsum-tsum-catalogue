# Tsum Tsum - BETA

What shipped in each release, newest first. 
_Testing build -- please report anything odd._

## 6.0b10 - 2026-11-03

**Fixes**
- A screen after a round that taps cannot clear (like the JP event's page) now asks GAP Companion for help in about 10 seconds instead of a minute.

## 6.0b9 - 2026-11-02

**Additions**
*Skills*
- Magic Wand Change skill improved by popping its heart bubble as soon as it appears.

**Fixes**
- Round stats record base coins for Magic Wand Daisy when her coins have a 0 in them.

## 6.0b8 - 2026-11-02

**Fixes**
- Round stats record base coins for Hero Style Stitch too.

## 6.0b7 - 2026-11-02

**Fixes**
- Round stats record base coins for the Change tsums on MuMu too.
- Auto Unlock MyTsum Level no longer checks the wrong tsum while a Level Up glow covers yours.

## 6.0b6 - 2026-11-02

**Additions**
*Chains*
- Maximum Chain Number can be set to 0 for no limit: the script links the longest chain it finds. Stepping down from 3 goes to 0, and up from 0 goes back to 3, on the settings page, the Quick Bar and GAP Companion.
*Skills*
- Magic Wand Change skill added: plays as a burst and taps the locket as soon as it appears, so the round no longer stops there.

**Fixes**
- Round stats now record base coins for the Change tsums, whose game screen has its own colours.
- Auto Unlock MyTsum Level now notices when a Change tsum, or a MyTsum whose ears or bow stick out, is level locked.

## 6.0b5 - 2026-10-29

**Additions**
*Quick Bar*
- Time out button on page two: stops playing the current round and lets it run out; its time stops counting at the tap, so coins per second stay fair. Works while the script is running.
- Last round can now be tapped while the script is running, not only when paused. It and Time out sit at the end of page two's bottom row.

## 6.0b4 - 2026-10-28

**Fixes**
- Sending hearts no longer keeps dragging at the bottom of the friend list.
- Tiara Minnie+ no longer stands still for 6-9 seconds when her skill trigger turns out to be false.

## 6.0b3 - 2026-10-25

**Fixes**
- When the game crashes mid-round, Auto launch now reopens it instead of the run stopping.
- Long runs no longer earn fewer coins hour by hour (play slowed until the script restarted).

## 6.0b2 - 2026-10-24

**Fixes**
- Receiving mail one by one no longer restarts the game over and over on emulators with little free memory (merged up from 5.6).

## 6.0b1 - 2026-10-24

**Additions**
*Play*
- Faster play: shorter taps, quicker large Tsum detection, and less waiting between chains, between rounds, and while sending hearts and opening mail.
*Skills*
- Colorful Mickey (Set) skill added (Beta).
- Auto Set Skill Level added: takes the skill level from your Tsum List for the selected MyTsum, warns before the run if the list is missing or a week old, and follows tsum changes made during a pause.
- Rapunzel+ skill improved: bubbles no longer pop around her activation, her chain no longer runs into dead ends or tsums still clearing, draws faster, and starts from a lantern when one is on the board.
- Cinderella skill improved: her strokes steer round tsums still clearing from the last one.
*GAP Companion*
- Your phone is notified when a run stops after its round (with that round's score and coins) and when a chore started with Now is done.
- Chore Now buttons work with the script stopped: it starts, does that chore, then stops again.
- A screen the script doesn't know can wait for your direction from your phone instead of being escaped, and the Debug tab's "Direct from phone" pauses the script so you can direct the device.
- Workflows can restart the device, every time or only when the script has slowed down, and carry on at the next step.
- Some GAP Companion features now come as add-ons, sent to the accounts that have them.
*Quick Bar*
- Copy code can now be tapped while the script is running.
*Platform*
- Requires General Automation Platform 4.0 or newer.

**Fixes**
- Game startup taps straight through the opening video and TAP TO START to the home screen, whatever the month's title art.
- A round interrupted by another app picks up where it left off, pressing Continue on the pause menu.
- A ready skill no longer waits a few seconds while effects cover the Pause and Fan buttons.
- Villains Set uses its skill as soon as the gauge is full.
- Bonus items no longer all flip on and off before a round.
- Sending hearts no longer stops partway down the friend list, including at a run of look-alike friends or friends with low scores.
- Receiving mail one by one no longer gets stuck on the new-tsum card after opening a tsum box.
- No longer gets stuck on the coloring event's mission tip after a round.
- Box Buying finds the Select Box in the Japanese game, where it can be the last of three boxes shown.
- GAP Companion no longer asks for directions on loading or startup screens, or when the game restarts itself for an update.
- Starting from GAP Companion no longer resets your settings to the defaults after a script update.
