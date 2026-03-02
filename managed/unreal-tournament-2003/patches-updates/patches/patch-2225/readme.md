## FULL CHANGE LIST from version 2199 (UT2003)

### Gameplay:

- Allow several different default characters. Change the default character by adding the following line to the `[xGame.xPawn]` section of your
  user.ini file: PlacedCharacterName="aname" where aname can be Gorge (theDefault), Sapphire, Malcolm. Mokara, Rapier, Brutalis, or Roc.
- Fixed no instigator bug with goop and grenades if killer was blown up before making kill.
- Added new mutator "DelayedSpawn". This mutator delays the initial spawning of superweapons and super powerups (like UDamage, superhealth,
  and supershield).
- Fixed sporadic problem with giving assist credit to players not involved in flag capture in CTF.
- Fixed sporadic problem with pawns not animating on clients.
- Fix adding in an extra bot when you've chosen custom bots and are spectating.
- Custom bots stay on the teams they were put on, and ignore team balancing in standalone games.
- The player who changes the color of the DDOM point scores the 5 points, not the last player.
- Fixed bug where could sometimes translocate into static meshes.
- Spectators can only chat with spectators if bPartitionSpectators config option is true. This option is false by default, and can be made
  true by adding bPartitionSpectators=true to the `[Engine.BroadCastHandler]` section of your UT2003.ini file.
- Support for new brighter teamskins (set by bright skins option in the Game Rules tab). You must have BrightSkins patch downloaded for this
  to work. (brightskins is client-side only)
- Fixed displaying name of player who returned flag in flag return message.
- Announce name of scorer in bombing run.
- "use map bot count" always adds at least 3 bots for team games.
- No time limits in LMS or Invasion.
- Fixed joining LMS server as spectator after match has started not limited to only spectator slots.
- Added configurable GameInfo property LateEntryLives. Defaults to 1. This is how many lives another player can have lost and you can still
  join, for a maxlives game like LastManStanding.
- Fixed IronDeity shield spawning.
- Fixed CTF-DoubleDammage camouflage mesh.
- Fixed weapon throwing on listen server clients.
- Projectiles can affect dead bodies in net games.
- Improved scoreboard support for long names.
- Server side control for turning off weapon viewshake by adding the following line to the `[engine.gameinfo]` section of your UT2003.ini
  file: bWeaponShouldViewShake=false
- New configurable property to prevent shield stacking of small shields. To disable shieldstacking, add the following line to the
  UnrealGame.DeathMatch] section of your UT2003.ini file: bNeverShieldStack=true
- Zoom supershockrifle firing through multiple people now configurable (true by default). To change, add the following lines to your
  UT2003.ini (server side): `[XWeapons.ZoomSuperShockBeamFire]` bAllowMultiHit=false
- No superweapons in mutant.
- Fixed auto-slope. Since this wasn't functioning before, you may have it turned on accidentally.
- Added configurable property to control screen flash brightness, with values between 0 and 1 (1 is the default). To modify this property,
  add the following line to the `[Engine.PlayerController]` section of your user.ini file. ScreenFlashScaling=+1.0
- Added new mutator "UTClassic" ,with its own server browser icon. Modifies the weapons to feel more like the original UT's weapons: All
  weapons do more damage. Slower weapon switching. Shieldgun charges faster, slightly longer range, less self damage for impact jumping
  Minigun firing modes switched, no lockdown effect Shockrifle regular fire slower, does more damage. Combos take less ammo. Slowed down
  rocket firing rate. Sniper rifle faster firing, no secondary hit damage. Bio charged up damage relatively lower (countered general weapon
  damage increase). Flak alt fires up a little more. Translauncher more ammo, recharges faster, transbeacon fired up more FOV and eyeheight
  adjusted
- Added configurable properties to UTClassic to control double jumping. These are all enabled by default. To disable, add the following
  section to your UT2003.ini file: `[UTClassic.MutUTClassic]` bCanDoubleJump=true bCanWallDodge=true bCanDodgeDoubleJump=true
- Setting bCanDoubleJump to false turns off all double jumping. Setting bCanWallDodge=false turns off wall dodging. Setting
  bCanDodgeDoubleJump=false turns off doublejumping after dodging.

### Weapons:

- Added option for visible centered weapons.
- Added option to have smaller first person weapons. Off by default. This option is found in the Settings|Player menu, or can be changed in
  the user.ini by adding bSmallWeapons=true to the `[Engine.PlayerController]` section.
- Fixed inaccurate replication of remaining translocator charge, causing players not to be able to fire when they seemed to still have
  charge.
- All projectiles and shock beam centered with hidden weapons.
- Fixed shieldgun autofire misfires.
- Added more weapon not firing debugging. If your weapon stops firing, type getweaponstats at the console. Then, continue trying to fire
  your weapon, so more stats can be gotten. Both client and server must be upgraded to this patch.
- Fixed shield gun fire effect when weapon hidden.
- Fixed transbeacon leaving flare behind when crushed by mover.
- Telefragging always gibs.
- Ion painter warms up a little faster.
- Added configurable property to have translocator aim up more like original UT. This client-side option can be enabled by adding the
  following line to the `[xGame.xPlayer]` section of your user.ini file: bClassicTrans=true
- Fixed lightning gun muzzleflash positioning in third person.
- Improved redeemer guiding.
- Sniper rifle zoomed visible area expanded.
- Custom weapon crosshairs: You can specify custom crosshairs and crosshair colors for each weapon. To do this, add the following lines to
  the appropriate weapon section in your User.ini file:

  ```CustomCrosshair=7
  CustomCrosshairColor=(R=255,G=255,B=255,A=255)
  CustomCrosshairScale=1.0```

  > Where CustomCrosshair can have any value between 0 and 13, and the Crosshair color is in 8 bit RGBA format. You can also use your own custom textures (after importing them into a utx) by adding CustomCrosshairTextureName="package.texture" (where package is the name of the UTX package, and texture is the name of the texture in the package.

### HUD/Scoreboard:

- 4 digit fph

### AI:

- Fixed bot auto skill adjustment.
- Added custom bot AI configuration menu.
- Bots don't try to link with you if you are linking with them.
- Only use bots with upl menu strings "SP", "DUP", or "UNLOCK".
- Performance improvement when trying to find path to dropped flags or bombs. Also added NotReachableBy() event to Decoration, so flags and
  other game objects can be notified if they aren't reachable.
- Improved bot AI for mutant game.
- Fixed low-skill AI problems in DOM-Junkyard.
- Fixed bots don't change weapon at end of match, and always play victory animation if winner.

### Performance/Engine fixes:

- Fixed xEmitter memory leak.
- Improved bPreloadAllSkins for team games.
- Set bShouldPreload (in `[Engine.LevelInfo]` section of UT2003.ini) to true on initial configuration for systems with over 512 MB of
  memory.
  This makes these systems preload all skins, reducing hitches in network play.
- No CD check!
- Fix for name table corruption crash (which caused the reproduceable crash reported when AccessControlClass=XAdmin.AccessControlIni in
  ut2003.ini, as well as other intermittent crashes)

### Networking/Servers:

- Fixed occasional crash when switching levels for servers with bots.
- Vampire mutator shows up in server settings.
- Dynamic netspeed adjust to deal with connections with variable effective bandwidth. Can be turned off in the settings|network menu.
- Fixed distance fog based network relevancy culling.
- Fixed addnamedbot exec function. This is used by web admin, so adding bots through web admin now works correctly as well.
- Fixed client upstream bandwidth not always capped properly by server.
- Added -nocheat parameter to commandline to disable cheat prevention.
- Added ability to disable the security fix in networking (for testing purposes) `[IpDrv.TcpNetDriver]` DisableKSecFix=True
- Only allow netspeed changes from console once every 15 seconds.
- Server version displayed in server browser and ingame server info (F2).
- Fixed ghost players on server.
- Fixed Invasion not ending if server side demo recording.
- Fixed redirected download file size and percentage indicator.
- Fix for players falling of ledges client-side only (so the client thought they were in a different place than they actually were
- New Mutator function OverrideDownload giving servers the chance to override a redirect URL on a per-user basis, eg to give priority
  redirect access to your clanmates.
- To customize bots without using the custom bot config menu, add a `[UnrealGame.CustomBotConfig]` section to your UT2003.ini. Then add
  lines
  like this one to the section:

  ```ConfigArray= CharacterName="Gorge",PlayerName="The_Reaper",FavoriteWeapo n="xWeapons.RocketLauncher",
  Aggressiveness=0.400000,Accuracy=0.000000,CombatStyle=0.400000,StrafingAbility=0.765789,Tactics=0.000000,ReactionTime=0.000000,bJumpy=True)```

  > Where CharacterName = the bot character you are modifying PlayerName = the name to override the character name with All the AI settings range from 0 to 1, with 0.5 as the default value.

- Fixed server browser having hidden filtering options still enabled when filters looked cleared.
- Fixed disconnected/kicked players taking a long time to have their connection closed.
- More networking improvements, particularly for higher ping clients.

### Spectating:

- Moved "now viewing" in spectator mode to right side of HUD.
- Show proper HUD color in first person view when spectating in network games.
- Fixed link gun alt-fire obscuring view in spectate behindview 0
- Show proper score in DM network games in top left hand corner of HUD /behindview 0
- Fixed spectator showing up on scoreboard on server with no players.
- Show flag messages in first person view when spectating another player.
- Fixed invasion spectating when join as spectator.

### Mod support:

- Fixed adding multiple CustonKeyBinding bug.
- Exposed many internal karma simulation constants for mod developers to tweak:
  Gamma (Relaxation Rate), Epsilon (Constraint Compliance), Penetration Offset and Scale,
  Contact Softness, Max Contact Penetration, Max Karma Timestep, Max Karma Speed and Max Ragdoll Speed.
  > Use KSet/GetSimParams inside Actor to modify them. NOTE: Changes to these take affect until you quit the game!
- Use %20 in URL redirects for files with spaces.
- UMOD installer AddIni fix.
- Added bNeverSever property for DamageType.
- Added PreventSever() to gamerules.
- Weapon config menu uses actor skin if different from default weapon skin.
- User logs now save to \UserLogs
- Added force feedback support for devices other than mice (thanks Jason Fleming of Immersion).
    * Gamepads, sticks, wheels and mice usable as force feedback devices.
    * Wheels (1-axis) devices can play 2-axis effects, rather than failing (IFC23.DLL).
    * Feedback device not initialized if all feedback settings disabled at startup.
    * Shutdown feedback system by unchecking all feedback settings in menu.
    * Start feedback system when first feedback setting checked in menu.
- Added unique sunlight actor icon (for editor).
- The Loading Map screen is now configurable for mods (GameEngine.LoadingClass).
- Added -USERLOGO=, .BMP must be in \Help
- Added ReplicationViewer and ReplicationViewTarget to LevelInfo. These are valid during replication, showing for what viewer replication is
  currently occuring. Useful for creating more complex replication conditions.
- Fixed not being able to do same taunt or othe AnimAction twice in a row.
- Fixed invisibility on pawns with more than 2 skins on their mesh (up to 4 skins now supported - they must all be referenced in the skins
  array).
- Added PokeTerrain function to TerrainInfo.
  > PokeTerrain( vector WorldLocation, int Radius, int MaxDepth ) All values are in world units. It pushes a squashed sphere into the
  terrain at
  the location specified. Negative MaxDepth values will raise the terrain at the specified location.
  > Note that you should perform a trace first and ensure a TerrainInfo is returned. Call the function at the trace's hit location. Static
  projectors such as tree shadows have their data precomputed and the shadow will not move if you dig a hole in terrain beneath them. Sorry!

### WebAdmin:

- Added check to prevent webserver from being spawned on client.
- Addressed some cleanup issues with QueryHandlers.
- Fixed bug with special characters in game settings (&, , etc.)
- Added reverse sorting to player listing.
- Fixed bug with sorted lists that caused new items that were added to be dropped under certain circumstances.
- Fixed bug that only allowed a managed group to be removed from a user if the user was a member of that group.
- Fixed bug with IP Policies not reflecting whether policy was "Accept" or "Deny" policy.
- Fixed bug with webadmin not allowing IP addresses containing wildcards
  to be added to the banned IP list
- Fixed bug that allowed IP addresses with more than 4 octets to be added to the banned IP list.
- Fixed links in webadmin remaining active if admin does not have any privileges applicable to that Query Handler.
- Addressed webadmin textboxes not allowing values longer than the width of the textbox.
- Added support for custom skins for webadmin (documentation coming soon).
- Added fix to prevent admin privileges from "leaking" across threads (very very rare).
- Added support for creating outgoing connections from within webadmin (to easily include remote content in webadmin).
- Fixed bug with giving users privilege to change bot skill level.
- Updated bot page so that you can add bots with stats enabled if there are still bots in the game.
- Implemented "Kick Bots", "Change WebAdmin Skin", and "Game Status" privileges.
- Added Game Status readout to Current Game page.

### D3D/OpenGL:

- Fixed fallback materials for DM-Rustatorium and DOM-Junkyard.
- Fixed OpenGL bug causing degrading performance after level changes with the NV_VAR/ APPLE_VAR codepath (thanks to Thomas Fortier @ ATI for
  pointing it out).
- Fixed gamma for Editor if running on DX9 system.
- Fixed bug in D3DDrv which caused it to never release the D3D device.
- Added "nogamma" commandline option.
- Fixed "firstcoloredmips X" for DXT textures.

### Sound/Music:

- Updated DefOpenAL32.dll
- Add MusicSkip console command to skip tracks in OGGPlayer.
- Fixed possible problems with OGGPlayer.
- Add "Play List" button to player setup.
- Fixed audio spatialization (thanks to Daniel Peacock @ Creative for the fix).
- Fixed sound precaching bug.

## Between 2186 and 2199:

### Linux-specific:

- DE bonus maps that took 20% server CPU when idle no longer do so.
- Fixed botmatch benchmarking scripts.
- Added a "umodunpack" commandlet to ucc, to extract ut2mod files.
  ```Usage:

  to extract:
  ./ucc-bin umodunpack -x file.ut2mod -nohomedir

  to list contents of file.
  ./ucc-bin umodunpack -l file.ut2mod -nohomedir

  This hasn't been well-tested and is fairly inflexible right now.
  Feedback is welcome.```

### GamePlay:

- fixed crash joining old version servers running levels with sharks (like
  DM-Oceanic)
- fixed voice menu options text bug
- more webadmin fixes
- Fixed the Preferred Team setting in multiplayer does not remain set after
  the user exits the Player Settings menu.
- fixed switchtolastweapon not working properly with link, lightning, and
  painter
- fixed skyline tower shoot
- Ambient weapon sounds (like minigun) aren't affected by level ambient
  sound volume changes.
- fixed translocator trail effect sometimes not working at start of game
- fixed blue translocator trail
- enabled weather effects on DE bonus pack maps
- made weapon ammo bars more visible on HUD
- terrain collision bug fix (this fixes the holes on CTF-Citadel and
  BR-Anubis)
- fixed Geothermal red flag base pipe hole
- fixed personal weapon stats for zoom instagib.
- fixed BR ball getting stuck in BR-TwinTombs
- fixed shark skin in multiplayer (DM-Oceanic)
- allow players to join chosen team even if its filled with bots
- fixed switchtolastweapon not working properly with link, lightning, and
  painter
- Made minigun and link "lock-down" effect configurable (server-side). To
  change the effect,
  you will need to add the following lines to your UT2003.ini file, in the
  ```[xGame.xDeathmatch] section:

  MinigunLockDownFactor=1.0
  LinkLockDownFactor=1.0```

  > The default is 1.0.  A value of 0 = no momentum imparted, so no lockdown.
  > This is visible in the game rules (in the server browser, or when pressing
  > F2).

- added ability to turn off translocator switching back to previous weapon
  if fire is pressed while alt-fire still held down.
  To change, add the following section to your user.ini file:
  ```[XWeapons.Translauncher]
  bPrevWeaponSwitch=false```

### Spectating:

- Added setspectatespeed exec function, which allows you to change the speed
  at which spectator moves on the fly. Default speed is 600.
- improved spectating switching between viewed players
- switching between viewed players doesn't lose behindview setting
- added player names and beacons to spectator view. Can be hidden by adding
  the line bHideSpectatorBeacons=true to the `[Engine.PlayerController]` section
  of your UT2003.ini.
- don't show "now viewing" at resolutions < 640x480
- added viewed player name to first person HUD.

### Mod support:

- Fixed AddIni command for updating ini files by patches and umods.
- fixed a problem with ReviewJumpSpots on some levels.   (ReviewJumpSpots is
  used to verify that bots can use the Jumpspots as they are currently placed
  and flagged).
- Modified Speech Binder and Controls config to be more flexible

### Networking/Servers:

- reduced cheat protection false positives
- stats work for servers with bots (bots not included in stats)
- fixed: tournament mode can be configured from ut2003.ini
- removed log spam when players join using model not on server
- fixed bots balancing servers
- Fixed performance issue with ElecFields on dedicated servers
- Fixed challenge/response mechanism to prevent fake players
- String memory allocation server crash fix.
- Remove \'s before returning player and server name in GameSpy query
- Disable echo replies in GameSpy query
- Fixed nametable overflow crash for hacked package files
- Fixed unreal:// URL overflow crash
- Limit number of successful connections from a single IP per minute.
  Configured by these settings (default values):
    ```
      [IpDrv.TcpNetDriver]
      MaxConnPerIPPerMinute=5
      LogMaxConnPerIPPerMin=False
    ```

### Webadmin:

- Removed config keyword from QueryHandlers variable declaration
- Added server name to browser title bar in webadmin
- Fixed CurrentGame maplist select not auto-selecting the currently playing
  map in webadmin
- Fixed mutator sorting on Mutators page in webadmin
- Added more support for skinning webadmin
- Fixed sorting on Player List page
- Fixed Player List page display for specs
- Added support for banning/unbanning by ID to webadmin (hash appears in
  Player List & Banned IPs)
- Fixed display problem with mutators that do not have configured groups
- Added checks to IPPlayer page for invalid IP addresses in ban list
- Completed localization support for webadmin
- Added security level listing to Rules/Settings pages (master admin will
  see associated security level for each setting)

### Demo Recording:

- fixed ability to fire while viewing client-side demos
- fixed ping on scoreboard of client-side demos
- fixed client-side demo playback speed problem
- fixed various weapon effects (bullet hits, link beam) with client-side
  demos
- fixed client-side demo playback jerkiness

### Menus/Interface:

- fixed problem with changing weapon bindings key for shock rifle and bio
  rifle from menus
- added icons to server browser, showing if servers are passworded, have
  stats support, are latest version, are running any mutators, or are running
  instagib.
- Properly disconnect from server when getting back to the main menu
- Fixed the Password entry dialog to convert " ", "?" and "\" to "_"
- Fixed stats dialogue to auto-select "enable stats" when you first
  connect to a stats server

### Other:

- Fix for longer loading times experienced by some users with 2186
- Karma Physics: Make SSE do the same thing on AMD and Intel processors.
- Fix bug with sphere-convex contact generation (eg. driving on blocking
  volumes)

## Between 2166 and 2186:

### Linux-specific:

- Eight mouse buttons (plus the mousewheel) should now be supported.
- New Karma libs to fix optimization crashbug.
- Unicode input now disabled by default to fix some input issues.

### GamePlay:

- now support left handed weapons
- fixed hidden weapons appearing occasionally on respawn
- spectators don't show up on DM scoreboard at end of match
- FPH doesn't change after match ends
- shock combos now work after going through static meshes, and at all angles.
- Fixed when entering a painzone you take double the damage/second in the first
  second and the correct amount thereafter.
- added exec function SwitchToLastWeapon (bound to E by default)
- fixed megaspeed DMMutator game option.
- improved bombing run AI (better AI reset between scores)
- fix for CTF flag can't be picked up
- fixed showing flag icon on scoreboard even if holder not relevant
- fixed throwing out minigun screwing up assault rifle
- added server option bBrightSkins to `[UnrealGame.DMMutator]` (and in the game rules menu). Setting it to true makes player skins brighter.
- fixed rocketlauncher can lock onto invasion monsters (bonuspack)
- change weapon sound pitch when berserk
- added bPreloadAllSkins config option to UT2003.ini, in the `[UnrealGame.UnrealMPGameInfo]` section. Its false by default.
  If true, all skins and character models referenced in .upl files are preloaded. Only set this option to true if you have
  a lot of system RAM (512 MB or more). This option reduces the hitch experienced when new players join a multiplayer game during gameplay.
- only allow restartgame() to be called once.
- added a GetWeaponStats exec function, which writes weapon info to the log for tracking down weapon problems
- Fixed VoiceMenu Acknowledgements to use the abbreviated versions if available
- other clients hear rockets being loaded
- fixed local stats for instagib
- fixed domination hud for spectators
- added the exec command "specviewgoal" that will attempt to show
  the current goal (be it the flag/ball/dom point or the guy holding
  it).
- made flak shell more visible
- dropflag works in net games

### Mod support:

- GameRules.NetDamage() always called in team games, and GameRules.ScoreKill() not called twice
- momentum is passed as an out (by reference) parameter in GameInfo.ReduceDamage() and GameRules.NetDamage()
- moved teammate momentum reduction to TeamGame.ReduceDamage()
- added ClientReceiveCombo() to xPlayer, to allow replication of mutator combos.
- Mod authors can now add keys to the config menu. See XInterface.GUIUserKeyBinding for info "how to".
- added support for pushing skins and meshes down from the server, with the PlayerRecordClass

> Use PlayerRecordClass to push down player skins and meshes from the server.
> For example, if the Reaper clan was running a server, and had their own clan skin in ReaperSkin.utx, here's what they'd need to do:

> Create a new ReaperMod.u file, with the class Reaper in it. The package name must be the class name with "mod" appended. Reaper is a
> subclass of PlayerRecordClass, with
> all the default properties set appropriately to setup up the character. Clan members will need to have a .upl file with the same character
> definition.

> The server will need to have both ReaperSkin and ReaperMod in its serverpackages.

### Networking:

- improved cheat protection
- spectating improvements
- single pass through actor list for first pass relevancy determination for all connections. Improves server CPU utilization by 20% to 30%
  for servers with large numbers of players
- hide passwords in URL
- added bAdminCanPause configurable property to GameInfo. It's true by default. To change it to false, add
  bAdminCanPause=false to the `[Engine.GameInfo]` section of your UT2003.ini file.
- fixed precision problems with ping calculation
- fixed adminsay bringing up MOTD on clients
- fixed bots not properly losing player enemies when players log out of net games.
- Fixed LAN broadcast bug which caused problems in the LAN tab when
  multiple UT2003 servers were run on the same machine
- TcpLink/UdpLink eventReceivedBinary fix.
- Fixed Bug in CheckIPPolicy
- fixed port swapping bug.
- maxspectators can be passed on command line
- Fix for Admin's Managed Groups
- Fixed Admin names showing multiple times when in multiple groups
- Added several game options to Web Admin
- Fixed Web Admin SetPlayInfo so that it won't be called twice on DMMutator
- Fixed MutatorFillPlayInfo so that it chains. Do not override MutatorFillPlayInfo, just override FillPlayInfo
- Fixed MD5 package protection so that it would stop resetting all RevisionLevels to 0 on loadup
- Fixed Web Admin Friendly Fire defaults
- Fixed Kick Command in AdminINI
- Changed the seperator character for the in-game admin menu from | to ESC
- Made Extended Console stop complaining when a MusicManagerClass wasn't defined.
- Fixed UTServerAdmin so it would pass PreQuery and PostQuery calls to mods
- fixed banning someone in internet games bans all spectators

### Demo Recording:

- Fixed occasional (!Closing) crash on playback
- fixed shock beam on client-side demos
- When recording demos on a client, listen server or single player, the
  demo file only records demo frames at the frame rate specified in
  NetServerMaxTickRate in the `[Engine.DemoRecDriver]` section of
  UT2003.ini. This does not effect the frame rate, only the rate at which
  frames are written to the demo recording file. This solves the problem
  of slow demo playback of client-side demos on machines which are not as
  fast as the recording machine.
- fixed bug where ?timedemo was accidentaly including the precaching time

### Menus/Interface:

- LowSoundQuality option is saved properly.
- maps listed alphabetically
- Added Map name to loading screen
- fixed bug where menu mouse resolution was dependent on direction
- added "MouseX/YMultiplier" to scale raw mouse input in `[WinDrv.WindowsClient]` in your UT2003.ini
- added support for up to 8 mouse buttons
- Fixed some Accessed None spam in the UI
- fixed 'half op" status for IRC client
- display channel topic for IRC client
- For custom game types, have seperate 'Custom' tab with combo box in the server browser.

### OpenGL

- fixed bug which caused game to reverted to D3DDrv after patching
- added code to disable specular if neither ATI_texture_env_combine3 nor
  NV_texture_env_combine4 are exposed (Linux DRI drivers)
- worked around fog related driver bug in older ATI drivers
- added code to switch back to desktop resolution at exit (Win98)

### D3D

- fixed bug related to OverrideDesktopRefreshRate option
- added workaround for HW bug on certain older NVIDIA cards
- changed code to handle D3DERR_DEVICELOST on initial device creation

### Sound

- updated DefOpenAL32.DLL with latest version from Creative

### Other:

- fixed big memory leak caused by garbage collection problem with certain levels (occurred on level change)
- fixed occasional crash which occurred during garbage collection on level changes, or when joining a server
- fixed sporadic karma physics crash
- performance improvement: frame rate based culldistance for player shadows
- Benchmarked botmatches require ?attractcam=true to be appended on the command line
  after ?quickstart=true to work like before

## Between 2126 and 2136:

- fixed instagib leak
- improved sound positioning/attenuation
- fixed suicide spamming lagging servers
- fixed AI slowdown when can't reach player's location
- really fixed redeemer lag problem
- Fixed down arrow key not working in Linux client (this broke in 2126).

### Linux-specific:

- No more "qhull warning" messages and other harmless Karma spam via stdio.
- "ucc compress" is no longer confused by "-nohomedir" argument.
- WebAdmin should work correctly with 2.4 kernels now.
- Systems without a hostname/IP address should no longer crash when
  clicking "create profile" in Single Player mode.
- Fixed race condition in Vorbis streaming code.
- "LANServerPort" and "LANPort" ini options can be set to -1 to not bind a
  port at all.
- Fixed bug in file management routines that caused the annoying (and
  inaccurate) "Error saving ../Saves/MyPlayerName.usx" messages. Should fix
  the map autodownloader, too.
- '(' can now be entered in the console.
- Fixed autoupdate script.
- Fixed unusual condition in startup script caused by bleeding edge versions
  of "ls". No, really.
- ip_passthru.pl script now MUCH more efficient, eats less CPU, etc.
- Other small tweaks and fixes.

### Gameplay:

- suicides count against team score in TDM
- fixed attenuation flak chunk damage over distance
- reduced minigun spin up time slightly
- made shock beam effect thicker
- always keep dynamic light for shock projectile, even in low detail mode
- translocation destination adjustment bug fix
- "kdraw collision" disabled in MP
- player dies before ball gets through hoop should still get credit for throw
- fixed redeemer point blank shots
- double tap time invariant to gamespeed
- get rid of 03_2 use (duplicate of "three" sound)
- fixed problems with overtime not ending on first score in some situations
- fixed transloc camera sometimes taking two taps
- fixed 4 rocket bug
- fixed instagib really is instaGIB
- fixed 10 seconds before can speak again
- fixed killz in CTF-December, CTF-Face3, CTF-Citadel, and BR-IceFields
- clamped max view bob
- fixed tokara forest switching to CTF
- fix for balllauncher switchaway bug
- fixed problem with teammates grabbing the flag right when you score
- fixed No Adrenaline mutator not allowing other mutators to work
- fixed getting correct bots on configured bot games with no bots on one
  team
- fixed falling damage bug
- straightened lightning bolt (purely visual change to make it easier to see
  where you're shooting)
- fixed shieldgun impact charging effect fps slowdown
- Fix bug where ragdolls didn't turn skeletal when they fall into lava
  volume.
- If there is no momentum on death, add a small random one. Reduces
  ragdolls just falling to their knees.
- added mouse acceleration for improved fine aiming control. Can be turned
  on by adding the following line to the [Engine.PlayerInput] section in
  user.ini:
  MouseAccelThreshold=+100.0
- added "now viewing" message when spectating
- Fixed: At end of match it says "You've lost the match" while spectating
- assault grenade faster minimum muzzle velocity
- fixed water footstep sounds sometimes not playing when touching
  fluidsurfaceinfo
- no behindview cheat in net games
- Simplified using custom ragdolls. 'Ragdoll=xxxx' in the .upl file now
  overrides the species ragdoll asset for the character. This approach is
  compatible with the cheat protection.
- Fix screwed-up vehicle camera.
- increased skeletal mesh pool vertex buffer lifetime from 500 to
  1000 frames
- rocket smoke trail whiter
- rocket launcher max ammo now 30
- improved instagib beams
- no shooting through people in classic instagib (just like it was in UT),
  you can still shoot through them in zoom instagib
- fixed replicating blood spurts when hit

### HUD/Menus:

- typed messages stay up on HUD longer
- don't limit chat when game is paused
- fixed joystick support in menus
- added joystick hat support
- made sure "showlog" leaves fullscreen first
- new HUD options in menus:
  Number of console messages shown
  Console message font size
  Ability to turn on and off various pieces of the HUD
  Ability to scale the HUD
- Cut and Paste in Console and server browser/edit boxes.
- Change IForce to TouchSense Mouse Settings
- Added Min/Max players to Map Selection
- Added Author Name to Map Selection for Non-Epic maps
- Add Description field for Mod Authors and hooked it to the scrolly
- Added Announcer volume control to menus
- 'Speech' binder menu in Settings.
- Mouse wheel support on speech menu. On by default, but the ut2003.ini
  option bSpeechMenuUseMouseWheel turns it off.
- Letter key support in Speech Menu. The ut2003.ini option
  bSpeechMenuUseLetters turns this on, and you can specify what keys it
  uses in the .ini file as well.
- Fix [ALL] being at the bottom of the speech menu player list.
- added joystick hat support
- made sure "showlog" leaves fullscreen first
- fix for particle "priming"
- enabled "preferences" and made it leave fullscreen
- added support for Asian language keyboard input via IME
- fix for particle "priming"
- enabled "preferences" and made it leave fullscreen
- added support for Asian language keyboard input via IME
- added "TOGGLEREFRAST"
- 'Add IP' and 'Add Buddy' dialog's focus the edit box by default.
- can change crosshair color

### AI:

- bots supporting player will grab nearby pickups
- fixed bots rotating to acquire targets too fast
- added ReactionTime parameter for bots
- fixed bots stuck in corners wanting to go to paths above
- bots go after adrenaline more

### Editor:

- fixed editor crash when rebuild paths with new pickupbase
- UnrealEd works on Win98

### Networking:

- added option to cap framerate in netplay (on by default). This improves
  client smoothness by keeping client physics updates more in sync with
  server. Its controlled in your UT2003.ini file in the [Engine.LevelInfo]
  section by bCapFramerate.
- improved ping measurement shown in scoreboard
- F6 bound to "stat net" again
- improved client movement on jumppads
- Buddy list wildcards
- Master server cheat protection MD5 support
- Removed server connect() 10054 warning
- servers no longer don't reconnect to master server on authentication failure
- Show server ip in server browser
- Remove ICMP logspam by default
- IRC client under 'Chat' tab in Server Browser.
- Added 'Server Browser' button in-game so you can view servers/chat
  without leaving game.
- Remove spurious qhull-related warnings at the console eg. when running
  a server.
- Removed a lot of server log spam
- added AdminSay function which works from log window
- overtime ends if no one left on server
- stats compatible with minplayers > 0 (stats start when number of bots
  drops to 0)
- fixed bug allowing bots to be added by admins in stats enabled games
- dedicated servers don't need to load skins/meshes/voices
- server CPU improvements (don't find actor channel reference twice)
- fixed server memory leak

### Compatibility:

- fixed CD check problems on some machines

### D3D

- fix for SiS 315 and other TnL cards only exposing one vertex stream
- better debug output for certain fatal failures
- better handling of running out of memory in default pool
- possible fix for UD3DRenderDevice::Unlock crash
- fix for "CreateVertexBuffer failed (D3DERR_INVALIDCALL)" crash
- made code respect D3DTEXOPCAPS_MODULATEALPHA_ADDCOLOR caps bit
- fixed case that led to an invalid stage setup in certain scenarios
- more Voodoo 3/5 & G400 workarounds (never sending more than 2
  texcoords)
- better error message for UnSetRes
- changed error message for crash inside D3D8::DrawIndexedPrimitive
- now tries system memory pool if allocation in default pool fails even
  after evicting all managed resources
- made FAuxRenderTarget destructor flush rendering resources
- added AvoidHitches" option to the D3D renderer which might
  be useful for people with 64 MByte cards that play on high detail settings.
  It significantly reduces the occurrence of substantial hitches, but slightly
  reduces average framerate.

### OpenGL

- replaced 8x8 dummy texture with 1x1 texture
- increased VARSize from 20 to 32
- added code to correctly fill in GMachineVideo
- implemented DesiredRefreshRate
- implemented ReduceMouseLag
- friendly error message when trying to run the Editor
- implemented missing case where neither NV_texture_env_combine4 nor
  ATI_texture_env_combine3 are exposed
- changed VAR code to try smaller VAR ranges before giving up

