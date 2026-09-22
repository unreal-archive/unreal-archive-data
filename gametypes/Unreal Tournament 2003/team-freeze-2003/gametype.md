Team Freeze is a teamplay gametype in which players are frozen instead of killed. A frozen
player cannot move or shoot, but they can cycle the list of teammates via the
"FreezeCam". There are really only two ways for a player to be freed: A teammate stands
next to him/her for 3 seconds, or the entire team is frozen, resulting in a "shatter."
Shatters occur when all players on a given team are frozen.

Frozen players can be knocked around with rocket blasts and won't suffer damage, however
falling, burning, or crushing damage can cause death, allowing the player to respawn into
the existing match.

Scoring works as follows: Freezes/Thaws = 1 point for player. Shatter = 1 point for team.

Bots have a pretty good understanding of Team Freeze gameplay and will attempt to defrost
a teammate based on team survival.

This mod is still very much in beta. Give it time.

## Recent changes

- Modifications specific to the 2166 source release.
- Fixed the online crashing bug associated with being frozen while in mid-air.
- Modified freeze animation code.
- Complete re-write of the freeze-rules class.
- Added an "unfreezing" status bar showing the status of a player whom you are attempting
  to defrost. The status bar is identical to the Double Damage status bar.
- Fixed the moving while frozen bug.
- Fixed the inventory/weapon bug.
- Fixed the infinite recursion crash bug.

## Known bugs

Bugs? They're undiscovered features!

- Bots may not always "freeze" completely.
- Sometimes bots don't fully recovery their animation rate when thawed out and may appear
  to "skate" during network games.
- The freeze effects like fog and icechips aren't working yet in network games (but they
  are visible for your character).
- Sometimes the freeze shaders will "blink" when playing online.
- The Team Freeze modification primarily affects the player's health/death. Mutators that
  also modify health, death, gibs, etc, may cause severe problems. You've been warned.

## Construction

- Editor(s) used: WOTgreal v2.712
- Base: 2166
- Construction Time: approx. 60 hours ++

## Acknowledgements

Original concept by Darrell "Doolittle" Bircsak.

The original "Team Freeze," is an Unreal Tournament port of Doolittle's mod, by Jagnon.

Special thanks to Paul "DJPaul" Gibbs. Thanks to E. "ee" Elverskog for his help with the
freeze shader. Thanks to Jeff "Ezeikeil" Giles for his suggestions on state programming.
Thanks Pfhoenix of #unrealscript for hos thoughts and suggestions with the client-side
animation. Special acknowledgement to Daniel "RageMachine" Nalbach, the esteemed Team
Freeze beta tester. Thanks to one who is only known as "OrionNE" for volunteering his iron
and pipe as the Team Freeze Test Server. Recognization is also due to the unrealscript
coders on #unrealscript at irc.enterthegame.com; and contributers to the Unreal Wiki. A
note of thanks to Wormbo, for being Wormbo.

And last, but furthest from the least: the biggest, the warmest, and of course the most
sincerest gratitude to the lovely and talented Aleya for her awesome Team Freeze
webdesign.

## Manual installation

Copy the following files to the UT2003 directories:

```
[Drive]:\UT2003\Sounds\TeamFreezeEffects.uax
[Drive]:\UT2003\Textures\TeamFreezeMat.utx
[Drive]:\UT2003\System\TeamFreeze.u
[Drive]:\UT2003\System\TeamFreeze.int
```
