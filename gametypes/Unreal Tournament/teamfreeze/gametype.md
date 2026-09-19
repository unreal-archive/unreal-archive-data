This is a team based gametype that modifies the way frags are scored. After dealing a killing blow to an enemy player, that player will be 'frozen'... In the frozen state, the player cannot move or shoot until he is released by a fellow teammate.. Frozen teammates are released by touching them and remaining still for 3 seconds. If the entire enemy team is frozen then they will spontaneosly shatter (!gib!).. The player killing the last enemy unit will score all those kills, and their team score will go up by one.. Upon shattering the enemy team, all frozen teammates will then be unfrozen.

This gametype variant will hopefully encourage teammates to work together in order to freeze enemies and unfree each other quickly. The 3 second unfreeze time adds an element of strategy, since the teammate doing the unfreezing must remain motionless for those 3 seconds, making him easy prey to the enemy team..

## Starting TeamFreeze

UT TeamFreeze is a gametype modification, so a single player botmatch is started by starting a Practice Session and selecting TeamFreeze from the gametype combo box. Once TeamFreeze is selected, you can select from a Deathmatch level and the team frag limit, which will indicate the victory conditions.

## Hud Display

Below each team's score counter is an indicator of how many teammates are frozen along with how many teammates there are.. If the indicator reads "2/4" then 2 of your teammates are frozen out of 4.

## BotPlay

Standard Bot intelligence has been tweaked so that they understand the rules of TeamFreeze. Bots will guage wether or not it should take the risk of unfreeing teammates based on how many of it's teammates are already frozen.

## Network Play

This gametype should work fine in multiplay.. Only tested with a server and a single client though..

## New for Version 120

- Improved bot response to being shot at while trying to free teammates. Now they'll bolt and take appropriate countermeasures.
- Force human players to respawn in multiplayer mode, to prevent nonentrants from holding up the game.
- Changed HUD messaging to better indicate frozen status
- Fixed frozen bots still being able to dodge
- Fixed some bots respawning with no weapons
- Fixed bots sometimes getting freed without losing invulnerability

## New for Version 110

- New HUD messages to better inform you when you've been frozen or have been freed
- Added sound effects to also let you know when you've been frozen or freed
- Modified teammate freeing mechanism to require you to stand next to them for 3 seconds in order to free them. Version 100's instant unfreezing proved to be much too chaotic for bots when in arena type maps.
- Changed rules so that upon shattering the enemy team, all frozen teammates are unfrozen, leveling the playing field again..
- Modified Bot behaviour to accomodate the 3 second unfreeze time
- Fixed problem with dying in lava, acid, etc.. will respawn instead of remaining frozen in an unreachable place..

## Acknowledgements

I originally got the idea for this mod from the ModCentral forums.. someone had posted the idea, but wasn't going to develop it.. Thanks to Doolittle, author of Quake2 FreezeTag.. Got the idea for a 3 second unfreeze time when I saw his webpage..
