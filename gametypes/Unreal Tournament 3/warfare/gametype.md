This is the early beta for Warfare++: 128 player Unreal Tournament 3.

This will allow you to play Unreal Tournament 3's Warfare mode with up to 128 players.

To install, unzip the content with a program such as WinZip or Winrar and copy into the My Documents / My Games / Unreal Tournament 3
folder (it will not over-write any existing files).

You will need to make one edit to one of your configuration files to allow the UT3 menu to accept the full 128 players. Locate your My
Documents\My Games\Unreal Tournament 3\UTGame\Config directory, and open UTGame.ini. On the first few lines, in the Engine.GameInfo block,
find MaxPlayers and set it to 128. The find the NumBots_Common and NumBots_DM data providers, and change their range data settings to
MaxValue=128.

Note that this is a very early release, and is not polished in any manner.

Known issues:

- The full 128 players may not always spawn in the first round you play in Instant Action.
- After long play sessions on middle or lower end machines, the game may start flickering and breaking down. Restarting the game fixes
  this (this is a UT3 bug, but is more common with more players).

