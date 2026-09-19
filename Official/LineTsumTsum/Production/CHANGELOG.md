# Tsum Tsum Script

What shipped in each release, newest first. 
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
