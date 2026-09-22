# Tsum Tsum Script - BETA

What shipped in each release, newest first. 
_Testing build -- please report anything odd._

## 3.0b - 2026-09-22

- New "Wait for Settle" setting on the Skills tab: once the gauge fills, waits up to a chosen number of milliseconds (steps of 200) for the board to refill before firing the skill, popping bubbles into a board still moving as the Bubble Strategy allows, so it goes off on a full board rather than a half-empty one.
- Bubbles are no longer popped the moment they appear or right after a skill fires, when the burst has left nothing round them to clear; the Bubble Strategy spends them once the board has refilled.
- The score tally's count-up is tapped through whether or not round stats are being recorded, so the next round starts sooner.
- Box Buying can buy the Pick-Up Capsule: pick it under "Box to buy" and the sweep buys from the capsule while one is on sale, opening each and closing its prize, whether a tsum or an item, closes the Last Prize the final capsule hands out, and stops once the capsule is sold out.

## 2.1b2 - 2026-09-20

- The script no longer sits on the game's pause menu flipping the Gyro switch when a chore starts during a round; the chore waits for the round instead.
- Max round duration: once it stops playing a long round it now waits for the game over screen however long that takes, instead of picking the round back up after a few minutes.

## 2.1 - 2026-09-20

- The script no longer sits on the game's pause menu flipping the Gyro switch when a chore starts during a round; the chore waits for the round instead.
