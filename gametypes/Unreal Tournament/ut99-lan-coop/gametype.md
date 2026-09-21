This mod is a direct adaptation of UT99's single player tournament mode, made to be playable in multiplayer LAN games.

What features are working:

- Profile creation, saving, loading
- Ladder progression
- All gametypes (the tutorials aren't perfect, but they can be completed)

What isn't working:

- The tutorials
- The ending trophy cinematics

## Requirements

This pack requires Unreal Tournament and Bonus Pack 1 or Unreal Tournament GOTYE.

## Installation

1. Extract `UT99MPLadder.u`, `UT99MPLadder.int`, and `UT99MPLadderConfig.ini` to your `UnrealTournament\System` folder.
2. Extract `DM-MPLobby.unr` to your `UnrealTournament\Maps` folder.
3. Open your `UnrealTournament.ini` file in your System folder.
4. Under `[Engine.Engine]`, put a semicolon (;) before `Console`.
5. Make a new line under the old Console line that says `Console=UT99MPLadder.UT99MPLadderUTConsole`
6. Make sure you have `bPlayersBalanceTeams` and `bBalanceTeams` under `[Botpack.TeamGamePlus]` to false.
7. Save your `UnrealTournament.ini` file.
8. Open `UT99MPLadderConfig.ini`.
9. Change all of the `NumExtraPlayers` values under `[UT99MPLadder.MPLDeathmatchPlus]`, `[UT99MPLadder.MPLEnemyBrowser]`, `[UT99MPLadder.MPLTeamBrowser]`, `[UT99MPLadder.MPLObjectiveBrowser]`, `[UT99MPLadder.MPLCTFGame]`, `[UT99MPLadder.MPLDomination]`, and `[UT99MPLadder.MPLAssault]` to however many people will be joining your game.

If only 2 people (including yourself) will be playing, leave the file as it is. If 3 people (including yourself) will be playing, set `NumExtraPlayers` to 2, and so on.

If you have OldSkool Amp'd enabled, you might have to turn it off. I don't think it causes major problems, but it wouldn't hurt.

## Starting a new game

1. Open Unreal Tournament
2. Select the Multiplayer tab and then select "Start New Multiplayer Game."
3. Set the game type to Tournament Lobby (New Game).
4. Press the Start button. Do NOT host a dedicated server, as it will not work.
5. Once the game has started, have the other players join. The number of extra players that join your game MUST match the `NumExtraPlayers` value in your `UT99MPLadder.ini` or else bots won't spawn.
6. Press your Objectives button (F3 by default) and make your character as you would in a regular single player game. Do not exit any of these menus or you'll have to make a new profile again.
7. Choose which match you want to play.
8. Complete a match either by winning or losing.

## Saving your progress and continuing

1. After completing each match, you and your fellow players will be taken to a lobby map.
2. Once in the lobby game, press your Objectives button to save your progress and continue your progress. If you don't want to keep playing, you can exit as long as you have saved.

## Loading a saved tournament

1. Open Unreal Tournament
2. Select the Multiplayer tab and then select "Start New Multiplayer Game."
3. Set the game type to Tournament Lobby (Load Game).
4. Press the Start button. Do NOT host a dedicated server, as it will not work.
5. Once the game has started, have the other players join.
6. Press your Objectives button to open the list of your saved profiles.
7. Choose whatever profile you want. If you picked the wrong one, press your Escape key to exit the menu and then press your Objectives button again to choose another profile.
8. Select and start a match as you normally would.

## Cheating

While in a Deathmatch, Assault, CTF, or Domination game, you can unlock all of the matches by opening your console (press TAB or ~), type "AdvanceAll" without quotes, and press enter.

## Known issues

1. The "You are on *TEAM*" messages don't display your team. This is because of a workaround to get bots to be on the correct teams.
2. The log will be spammed with errors and warnings until all of the bots are spawned.
3. Mutators are not supported.
4. Custom teams and maps are not supported.
5. This whole thing is a pain to install.
6. Your player name doesn't change based on what profile you load like it does in single player.
7. Some servers might not accept the custom console, so you'll have to follow step 2 in the Uninstalling section if you want to play online again.
8. Dying while in the Load Game and Transition lobbies can prevent you from saving your progress. The lobby map has no hazards and players are invincible, so just don't use the suicide command and you should be fine.
9. Other players are forced to be red in Deathmatch games
10. The tournament menu doesn't always display the loaded profile's match history.
11. Using tab or opening the console and typing the ShowObjectives command will cause a visual error and make the player unable to exit normally. This is a problem with UT's menu system.
12. Teams do not balance in team games, which means that red team will always outnumber blue team.
13. The CTF HUD doesn't show the team scores.
