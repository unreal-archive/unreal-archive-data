# Unreal Tournament 3 Patch 5 (v2.1)

This was the last official patch produced by Epic Games, and is installed by
default when you install Unreal Tournament 3 via Steam.

Note that this patch includes all fixes from previous patches. The patch is
also required for the Titan Pack to work.

Here is the full list of fixes:

#### UI:
 - Disabled wrap for options lists on PC.
 - Split out player and bot counts on mixed servers in server browser.
 - No longer require double clicking on main menu.
 - Fixed problem with vote menu, where list positions and scrollbar get reset after the menu updates.
 - Fixed issue with 'no password' connection error not asking for a password, when in online play.
 - Fixed issue with dialog boxes, where button positions are not updated correctly after resolution or message length changes.
 - Made the Instant Action and Host Game menus properly recover the saved mutator list, when the Mutator menu is not opened.
 - Fixed an incorrect call to WorldInfo.TravelFailed, and fixed the 'Incorrect Password' dialog not asking for a password.

#### Game:
 - No longer disable achievements for mods that don't contain code (maps and custom characters).
 - Fixed issues with weapons respawning with Duel and with WeaponsRespawn mutator.
 - Reduced visibility of DM beacons in darkmatch.
 - Fixed greed exploit with redeemer.
 - Updated russian localization. Thanks Michael Sokolkov.
 - Removed os helper workaround for Windows 2003 server, now that we have a better fix.
 - Fixed low gore issue with Titans.
 - Fix for wrong team shader in rare cases.
 - Fixed dropflag command not working. Also fixes a CTF exploit.
 - Fixed excessive link beam decals for listen servers.
 - Fixed warfare orb not showing up on minimap on second and subsequent rounds on map where teams switch sides.
 - Reduced damage to nodes/cores from dead Titan explosion.
 - Reduced damage Titans do to nodes/core with weapons.
 - Titan melee doesn't knock down spawn protected players.

#### Server Administration:
 - Fixed problem where maplist entries contain unwanted whitespace, and move invalid maplist entries to a separate 'BadMaps' list, instead of just deleting them.
 - Fixed bug where the advertised game was wrong after switching gametypes, but only for the startup gametype.
 - Fixed bug with password being removed from URL, during non-seamless travel on the same server.
 - Fixed bug where the current game profiles mutators would be carried over into other gametypes.
 - Added 'MapReplayLimit' to UTMapList; this overrides the same value in UTMapListManager, unless set to -1.
 - Added code to trim down the size of server details results when they become too large, fixes problem where servers would not be advertised.
 - Adjusted vote code to end vote rounds early, when all players have voted, and to switch map immediately instead of respecting the 'EndTimeDelay' and 'RestartWait' settings.
 - In endgame votes, forcibly extend the first vote round by 16 seconds (i.e. the time it takes for the vote menu to popup).
 - Added admin-only buttons to the vote menu, which allow admins to force a winning vote.
 - Fixed non-seamless travel client timeout disconnects.
 - Now consider server "pure" with same rules as achievements (custom maps, characters, and Epic mutators + webadmin allowed).
 - Adjusted mutator voting to properly account for mutators in the game profile settings (both added and excluded mutators).

#### Mod support:
 - Fixed problem with cooking with -mod and ModShaderCache.
 - Fixed map makers unable to cook when using Titan Pack assets.
 - May need to delete GlobalPersistentCookerData.upk from My Games\Unreal Tournament 3\UTGame\Published\CookedPC.
 - Added mutator hook for blocking team changes.

#### Level specific:
 - Fixed WAR-Confrontation raptor exploit.
 - Possible fix for darkmatch memory leak.
 - Added refshadercache to patch, so titan content will have shaders compiled.
 - Fix for reported rare WAR-Floodgate crash.
