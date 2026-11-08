# Tsum Tsum - BETA

What shipped in each release, newest first. 
_Testing build -- please report anything odd._

## 6.0b25 - 2026-11-08

**Additions**
*Companion*
- Presets can be assigned to tsums in the companion app, for add-ons that use them.

## 6.0b24 - 2026-11-08

**Additions**
*Companion*
- On the JP game, the companion app shows each tsum's English name too and finds tsums by it.

**Fixes**
- The skill (or another setting) no longer switches back on its own after a Quick Bar, preset or phone change, and Play no longer starts on an old skill until GAP is restarted.

## 6.0b23 - 2026-11-08

**Fixes**
- The Tsum List now names the five newest JP tsums (Lorcana Belle, Cruella, Donald and Woody, and Sorcerer's Apprentice Mickey+) instead of leaving them blank (merged up from 5.8).

## 6.0b22 - 2026-11-07

**Fixes**
- Dapper Hat Mickey's skill no longer ends the round early; the script keeps playing through its dance.

## 6.0b21 - 2026-11-07

**Fixes**
- Auto Unlock MyTsum Level now sees a capped MyTsum on JP and raises its level cap.

## 6.0b20 - 2026-11-07

**Fixes**
- An event's free bonus item ("Make a wish upon a star!") no longer has the script tapping it and raising its popup on every round (INTL).

## 6.0b19 - 2026-11-05

**Fixes**
- When the game shows an error and returns to its title screen, the script closes the error and taps through the title instead of asking for direction.
- Chernabog's skill no longer makes the script think the round is over and stop playing.

## 6.0b18 - 2026-11-05

**Additions**
*Skills*
- KH2 Cloud skill added: waits for the stronger second charge of his gauge before tapping, and uses the first charge if the round is about to end.

## 6.0b17 - 2026-11-04

**Fixes**
- Take over in GAP Companion no longer sends a notification when the script asks for direction at the same moment.

## 6.0b16 - 2026-11-04

**Fixes**
- Round stats record base coins for Magic Wand Clarice, which came back blank.

## 6.0b15 - 2026-11-04

**Fixes**
- Pressing Play twice no longer starts the script twice, which had two copies tapping the board at once so no chains were made (merged up from 5.8).

## 6.0b14 - 2026-11-04

**Additions**
*GAP Companion*
- Presets sync both ways with GAP Companion: a preset saved, renamed or deleted on any device or on the phone reaches every device. Restoring an old backup or switching from 5.0 can bring back a deleted preset or add a "(device)" copy; nothing is lost.
*Presets*
- Rename a preset from the Save panel; workflows that use it keep working.
- New No preset in the preset list brings back your own settings.

**Fixes**
- Applying a preset now sets every preset setting, using defaults for the ones it leaves out.
- Stuck on an unfamiliar screen after restarting the game, the script now asks for help in GAP Companion; it used to never ask.

## 6.0b13 - 2026-11-04

**Additions**
*GAP Companion*
- Take over also works while the script is stopped.

**Fixes**
- MyTsum detection names look-alike tsums it used to leave unidentified, such as Anniversary Mickey and Steamboat Mickey.
- Rapunzel+'s chain is no longer cut to a few tsums after a stall, and the script now says when the game stops taking her drags.

## 6.0b12 - 2026-11-03

**Additions**
*GAP Companion*
- Take over: pause the script wherever it is, even mid-round, and direct the game from GAP Companion until you press Continue.
- Stats: This run shows coins and medals per second, and Recent rounds shows each round's medals once you have earned any.
- Round button in the run bar: Stop after round, or Time out as on the Quick Bar.

**Fixes**
- Round stats record base coins more reliably on emulators: totals of 10,000-10,999, and Daisy, Minnie and Hero Style Stitch counts that came back blank.
- On JP, closing the Quick Bar mid-round resumes the round instead of giving it up as over.

## 6.0b11 - 2026-11-03

**Fixes**
- Round stats are still recorded when GAP Companion directs the game off a screen after a round (like the JP event's page).

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
