# Tsum Tsum Script - BETA

What shipped in each release, newest first. 
_Testing build -- please report anything odd._

## 2.0b3 - 2026-09-16

- Skip Ruby now works like Skip Medals: rubies are left in the mailbox and the mail under them is still taken, instead of the chore stopping at the first ruby.
- "Hold bubbles last fever seconds" setting added: leaves bubbles alone while a fever is about to end, so they are there to pop into the first chains after it and start the next fever sooner.
- Bubbles are popped once tsums have refilled around them, so one a burst skill leaves is no longer spent on the empty space it left.
- Round stats: a medal count with a 0 in it is no longer left blank.

## 2.0-beta2 - 2026-09-15

- Debug tab: a Detect MyTsum button reads which tsum the pre-round screen shows selected, without playing a round.
- The selected tsum is named as the running game prints it: in English on the international game, in Japanese on the Japan game.
- Auto launch finds the Japan game on its own: whichever build is installed is the one started, so nothing has to be set for it. The stats CSV gains a `build` column.

## 2.0 - 2026-09-14

- Version bump from 1.0 to 2.0
- Coronation Day Elsa skill promoted to Beta.
- Coronation Elsa Legacy skill added: the 1.0 version of the freeze window, offered beside the current one on Beta builds so the two can be compared.
- The JP game's Magical Time offer is now recognised and cancelled like the EN one.
- Box Buying no longer stalls on the "You got a Patch!" popup a purchase can come with: it is closed like the reveal card and the sweep goes on.
- Box Buying handles the store refusing a 10-Time purchase on a nearly empty box ("You can't use 10-Time Purchases"): the sweep ends there instead of retrying into it, and the new "Ten, then one until sold out" size carries on singly to empty the box. "Buy ten at a time" became the "Boxes per purchase" dropdown.
- Rounds turn over faster: the score tally's count-up is tapped through instead of waited out.
