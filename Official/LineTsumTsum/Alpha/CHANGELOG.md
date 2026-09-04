# Tsum Tsum Script - ALPHA

What shipped in each release, newest first. 
_USE WITH CAUTION_

## 0.10 - 2026-09-04

- Lorcana Card setting added: plays the Lorcana Tsums' transformation, tapping the card when it appears and clearing the ink stones their skill leaves behind.
- \*NOT RECOMMENDED\* Lorcana Aurora skill added, chaining every bubble on the board into one drag the moment they settle once she has transformed.
- Picking a skill that needs a setting now switches that setting on for you.
- Boards where red, green and yellow tsums sit together are read properly now, so chains get made where the script used to find none.
- Sending hearts no longer stalls on the Gift a Heart screen and skips the friend.
- Box Buying finds the limited-time Select Box now, instead of saying the store is not selling it.
- The "Burst bubbles" skill is now called "Burst + clear bubbles", and clears the whole board after the skill instead of only the bottom third.
- Chores start in a fixed order rather than the order of their wait settings, and a sweep asked for with a Now button goes before the next round instead of after it.

## 0.9 - 2026-09-03

- Box Buying chore added: buys Premium Box+, Premium, Select or Happiness boxes from the Tsum Tsum Store on a schedule, one or ten at a time, and stops when the box sells out or the Coins run low. Rubies are never spent.
- Settings now has a Chores tab, so the jobs the script does between rounds are in one place instead of at the bottom of Gameplay.
- A long skill animation can no longer be mistaken for the end of a round: the script always waits for the round to actually be over. The Handle Long Skill Animations switch is gone, because there was never a reason to turn it off.
- Settings codes made before this version are refused — copy a fresh one from a device on 0.9.
- A settings code is now shown as a QR as well as text, so someone else can take your setup by photographing the screen instead of being sent the line.
- Record Sender is gone. It counted hearts per friend into a file nothing could show you any more, and the running heart totals it used to carry now survive a restart on their own.

## 0.8 - 2026-09-02

- Fixed the level cap sweep walking the whole collection in the order the player had it in, raising nothing: the tap that picks Level Lock is now checked and taken again if the dialog was still opening when it landed.
- Fixed a round played with an event card recording no score or coins: the event's result screen is now tapped away whatever the event looks like, its page closed, and the card reveal and gift screens it puts up at milestones dismissed, instead of giving up on the score page.

## 0.7 - 2026-09-01

- Formal Beast skill improved: he keeps the two halves of his gauge level by shortening chains rather than skipping them, and links much longer chains while his mode is up, so playing for the double payout no longer costs the round its pace.
- Fixed the script opening the Card screen over and over on the home and friends pages instead of getting on with the round.
- Unlock Level every hours rebuilt. Has a Now button that runs one sweep straight away whatever the schedule says -- ahead of everything but a round in progress, and starting the script if it is stopped. Puts the collection back in the order it was in once the sweep is done.
- Fixed Link MyTsum first almost never finding MyTsum on the board: it was reading the colour off the skill button's gauge instead of the Tsum, and now knows what each Tsum looks like on a board.
- Fixed Stop letting a tap the paused script was still waiting to make go off on whatever screen was open by then: once stopped, nothing the script had queued reaches the game.

## 0.6 - 2026-08-31

- Coronation Day Elsa skill added: her window freezes as much of the board as it can, then sets the whole pile off in one burst. Elsa reads "Skill Level" as how long her freeze window stays open, 5 seconds at level 1 up to 10 at level 6, and ignores your "Max chain" and "Chains per board scan" settings.
- Rapunzel+ skill added: her skill draws one chain through tsums of any colour, as long as "Skill Level" allows — 9 tsums at level 1 up to 24 at level 6, ignoring your "Max chain" setting during the skill.
- "Delay between rounds" setting added: rest a set number of minutes after each round. The Quick Bar counts the rest down and starts the next round on a tap, and the rest can be changed mid-run. Hearts and the mailbox carry on during it.

## 0.5 - 2026-08-30

- A Quick Bar along the bottom edge of the screen, below the game's own buttons so it can be left up all run, changes skill, skill level, chain settings and the +Coin and 5>4 items without stopping the run, and shows this run's average coins per round
- Pausing now pauses the round as well, so nothing runs down while you change something
- With "Debug logs" on, the script now records what it is about to do next, so a run that gets stuck can be read back step by step
- Each round's stats row now records the settings that round was played under, so a Quick Bar change shows up from the next round rather than on rounds already finished
- Opening the settings panel now pauses the run instead of ending it: close it again and the script carries on where it was, or press Play to restart on the settings you just changed

## 0.4 - 2026-08-29

- Round stats save several seconds sooner, and no longer blank a score or coin figure whose digits include a 5
- Tuned Captain Lightyear 120 skill a bit to hopefully perform better than before.

## 0.3 - 2026-08-28

- Round stats now record the medals a round earned
- A round that finishes slowly no longer loses its score in the stats file
- "URL to Tsum Monitor" has been removed

## 0.2 - 2026-08-26

- Longer chains, with a new "Link reach" setting
- New skill: Formal Suit Beast
- Better timing for Cpt. Lightyear
- "Clear Bubbles" is now a three-way "Bubble Strategy"
- Settings changes now apply mid-run
- Settings now shows what will run, and when
- New "Share settings": copy your setup as a code, or paste someone else's
- Auto Send Hearts now sweeps your whole ranking
- Rank-up and record panels no longer hide your score
- New "Record round stats": every round you play is logged to a spreadsheet
- Round stats name the tsum played, split by day, and can be shared from the app
- The floating bar names the tsum being played
