Battle Team/Freezetag Arena (BTFA) contains 4 game types where only the most skilled players
will win the match. You not only have to kill, you also have to survive to win this.

With Battle Team Arena (BTA) you can die only once. Once all members of a team are eliminated
the other team gets a point and wins the round. Then a new round starts. You have to win a
configurable number of rounds to win the game.

With Battle Freezetag Arena (BFA) instead of getting killed you can get frozen. Once all
members of a team are frozen or dead the other team gets a point and wins the round. Then a
new round starts. You have to win a configurable number of rounds to win the game.

Battle Instagib Arena is identical to BTA, but every player gets a Instagib rifle.

Battle Insta Freeze Arena is identical to BFA, but every player gets a Instagib rifle and thaw
speed is doubled.

## Freezetag features

- You get frozen from enemy fire and you can die from the environment (e.g. lava or falling)
- If you are frozen and someone pushes you into goo or lava you thaw very fast
- If you are frozen you slowly thaw
- If you stand close to a frozen team mate they thaw faster
- If you stand close to a living team mate with higher health than you, you get health
- You get 2 points for thawing a team mate
- Enhanced bot and squad AI that is Freezetag aware

## General features

- 5 admin configurable versions of the Impact Hammer, from standard through reduced self
  damage to ultra boost
- 3 in game setting dialogs (F12) for players and admins, most settings work in real time
- Configurable hit sounds, skins, and messages and sounds for various game events
- Detailed stats in the HUD if you press F3
- Configurable reverse friendly fire
- You can see the health of team mates in the floating nametags
- While you are dead (or frozen) you can use primary fire to watch team mates
- FOV can be up to 120, or more if the admin allows that
- All players start with 100 health, 100 armor and all weapons, and all pickups are removed
- Configurable anti camping, a warning after 10 seconds, after 15 seconds you start losing
  health
- Configurable challenge mode, handicapping the team that is ahead on rounds
- Allows all map types (things like power nodes, flag bases are all removed from the map)
- 3 dimensional radar allowing you to locate all your team mates
- Round timer, after 120 seconds the round is over and everyone starts losing health

## Installation

Store the .u and .upk file(s) in your `..\UTGame\Published\CookedPC\` directory and the .ini
file(s) in your `..\UTGame\Config\` directory.

For Battle Freezetag Arena servers add `?GameMode=4?game=BattleTeamArena.BattleFreezetagArena`
to the command line; for Battle Team Arena use `BattleTeamArena.BattleTeamArena`, and for the
instagib variants `BattleTeamArena.BattleInstagibArena`.

## Licence

Released under the GPL v3, with full UnrealScript source included in each package.

## Release history

Ten releases between February 2008 and June 2009, starting with three Battle Team Arena
previews, gaining Freezetag in V4 and the two instagib game types in V7. V10 is the last, and
carried a single change: "Applied fix made by Shambler for compatibility with new version of
UT3."
