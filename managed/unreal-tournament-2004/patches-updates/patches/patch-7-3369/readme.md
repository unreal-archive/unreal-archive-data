# Unreal Tournament 2004 Patch 3369 (Patch 7)

This was the last official patch produced by Epic Games, and is installed by 
default when you install Unreal Tournament 2004 via Steam.

## Unreal Tournament Patch 7 Release Notes

This patch is completely compatible with the retail version - servers and clients of any flavor can connect with each other.
This patch will not overwrite your ut2004.ini and user.ini files, except to update settings as necessary.  This patch 
includes all changes made in Patches 1, 2, 3, 4, 5,and 6.

This patch should be installed *after* installing the Epic ECE Bonus Pack, as it updates some of the game code included 
with the bonus pack.

Thanks to John Barrett for a number of fixes.

#### General Gameplay:

- Fixed DriverLeft() not be called when driver dies in vehicle without vehicle being destroyed.  This fixes the vehicle not resetting, and fixes effects like the engine sound not being turned off.
- Fixed some vehicle weapon effects staying around when bots stopped firing them.
- Fixed spider mine layer incorrectly reducing mine count when a fired spider mine immediately explodes.
- Fixed manta and raptor spinning sometimes when player enters
- SPMA camera explodes if it hits water.
- Don't allow SPMA camera view to go outside world.
- Invasion HUD radar uses the viewed pawn's rotation rather than the spectator's rotation.
- Fixed low gravity not working properly in second and successive rounds of onslaught.
- Moved announcements for assault energycore to ASOBJ_EnergyCore_Spawn, and made them editable by level designers.
- Fixed spawning multiple energycores in Assault.
- Can now throw linkgun with 1 ammo left.
- Fixed exploit where shieldgun could be used to protect against lava or slime volume damage.
- Fixed CTF Flags not returning exploit
- Fixed stats tracking when a player switches between a spectator and active player (or vice-versa)
	
#### Networking:
- Various networking serialization optimizations.
- Fixed issues where players would not properly be sent to the Spectating state on clients.
- Fix for eyeheight getting screwed up on client
- Server optimization - players don't do line of sight checks with each other
- Don't replicate pawn.ViewPitch to netowner
- Fixed CTF flag not properly attaching to vehicles on net clients.
- Made CD key hashes sent by clients more secure.
- Fixed various exploits.
- Merged Michiel Hendrick's HTTP redirect code improvements.
- Merged Fix for Map Vote Bug that cut off some chat text
- Merged Fix for Map Vote Bug that caused the window to open twice
- Prevent crash exploit (which was fixed) from being propagated to unpatched clients.

#### Engine:

- Return rather than asserting in UCanvas::WrappedPrint() if no valid font.
- Fixed `-Mod=` to support proper exporting of headers
- Convert '|' to 'I' in player names.
- Fixed cut and paste error in MidGamePanel.uc that could cause crashes on level changes. (thanks Wormbo)
- Fix and optimization for projector rendering.
- Various changes to support 64 bit version.
- Scripted texture changes so they don't render upside down on OpenGLDrv.
- Fixed weather effects on OpenGLDrv.


## Here is the full change list for Patch 6:

#### General Gameplay:

- Fixed stuttering/snagging/sinking into static meshes in some places on clients in net games
- Improved getting out of water
- Fixed FaceClassic teleporter exploit
- The Cicada hud indicators should now show up in all game modes.
- Fixed SPMA causing damage at world origin.
- Fixed not being able to exit raptor when it's on the ground
- Fixed (for assault) the energy core always showing on the HUD even if it not the current objective (thanks AngelMapper)

#### Networking:

- Server performance improvements
- Cheating detection improvements, with shorter time for master server ban detection
- Integration of UTAN bans with UT2004 master server. Admins can opt out by adding `bIgnoreUTANBans=true` to `[IpDrv.MasterServerUplink]`
- Fixed potential garbage collection crash when changing levels during network games
- Improved caching of server data for when you can't connect to the master server.
- UTV updated (netspeed fix).
- Better Client->Server->MS Error Messages

#### Demo Recording:

- Added code to insure StopDemo is executed before a map change or game exit
- Remove 8x from the demo playback menu.  The engine has problems with that speed.
- Fixed bug in Demo Playback menu that caused the Play/Pause button to be out of sync
- Added Demo playback jog keys to the console.  
    - Left Cursor slows down playback (1/4x -> 1/2x)
    - Right cursor speeds ups playback (2x -> 4x)
    - Up/Down cursor resets to 1x
    - Disable by settings `bDemoJogKeys=false` in `[XInterface.ExtendedConsole]`

#### Engine:

- Improved level loading speed, especially on network clients
- Fixed calling `SetBase(NULL)` on all attached actors when an actor is destroyed

#### Editor:

- Fix for importing static meshes

#### Menus:

- Model select page now properly selects the current character when you open it.
- Korean localization updates.
- VCTF now appears in server browser, even if you don't already have any VCTF maps installed.
- Added code to sync the Stream (MP3) volume with normal music volume.


## Here is the full change list for Patch 5:

#### Onslaught related:

- Added a gunner indicator for the Cicada.
- Onslaught low skill bot AI tweaks
- Max lifespan for shot down ONSMortarCamera
- Fixed regular dust showing when Manta jumps over water
- Fixed Cicada staying above StallZ if driver switches to gunner position
- Fixed SPMA engine sound volume
- Tweaked powercore destruction and electricity sounds
- Improved artillery explosion effect
- Don't call destroyed powercore "green powercore" in scoreboard (after round ends)

#### General Gameplay:

- Fixed Berserk combo (properly turns client side weapon changes on and off)
- Fixed quadjump mutator in multiplay (was only allowing regular double jump on first jump)
- Fixed gamespeed mutator "sticking" in instant action games
- Don't let Cicada passengers carry flag (for VCTF)
- Added OnslaughtBP.UCL to patch so bonus pack mutators will show up
- Fixed problem with landing view shake sometimes not working at very low frame rates
- Fixed bug where not all actors got NotifyTeamChanged() when client team changed
- Assault objective announcements can come from packages other than AssaultAnnouncer
- IonCannonKillVolume bug fixes
- Don't allow players to change teams if team sizes are equal if bPlayersBalanceTeams is true
- Fixed team balancing code bug
- Fixed footstep sounds playing while in vehicle where driver isn't visible if enter while running
- Removed obsolete weapon debugging code
- Localization fixes for Italian, French, German, and Spanish
- No log or console message when player enters or leaves team. public, or local channels
- Fixed Dom.xml for bot voice command in DDOM
- Fixed F3/F8 stats now shows all players in list
- Don't limit suiciding to 10 second interval in standalone games

#### Demo recording:

- Fixed client-side demo recording of vehicles

#### Networking:

- Fix for clients unable to connect with "Incompatible Games Files" message
- Fixed WebAdmin play list and mid game menu to report the proper ping.
- Fixed resetting initial position of saved move when moves are combined
- Increased min idle kick time to 30 seconds
- Never idle kick player if only human in game
- Moved gamespeed option in URL parsing to after mutator spawning, so gamespeed can be set from URL
- More speedhack detection tweaks (less false positives)
- Server CPU use improvements relative to last patch
- Consider CPU saturation in determining whether to do extra work on server to reduce bandwidth use for low 
  bandwidth clients
- Don't allow clients <3320 to connect to servers with OnslaughtBP.
- Fixed server crash when using bonus vehicles mutator.
- Fix for client-side crash caused by DynamicLoadObject problem uncovered by interaction of AntiTCC with 
  certain other mutators.
- Fix for annoying server browser bug (not showing correct initial game type).
- Fix for team VOIP channels in large games
	
#### Menus:

- Fixed map list menu problems with bonus vehicles and custom link setups.

#### Editor:

- Fixed Unrealed working with Windows 98 (See note below)

#### Mod Author Related:

- New script profiling tool.
- Added (slow) full dangling reference checking option.  
  Logs dangling references which could cause a crash during gameplay or on GC.  Use only for testing, as it 
  is very slow, by adding `bSlowRefChecking=true` to the `[Engine.Engine]` section of `UT2004.ini`.  I'd recommend 
  running a dedicated server with bots with this option enabled, connect to it to start the match, and let the
  bots do the testing for you.
- Fixed spider physics view direction setting bug
- Added `RotateSoundThreshold` to `ONSWeapon` to allow mod authors control over when `RotateSound` is played
- Moved `BaseMutator.ModifyLogin()` to the beginning of `GameInfo.Login()`.
- Fix for `UParticleEmitter::UpdateParticles` crash in `SkeletalMeshGet`


### IMPORTANT NOTE REGARDING UNREALED and Windows 98

> If you plan on using UnrealED with Windows 98, you will need to download an install the MSVCP60.DLL library.  This
> file can be found at the following url:
> 
> http://www.dll-files.com/dllindex/dll-files.shtml?msvcp60
> 
> Without that file, the editor will not run.


## Here is the full change list for Patch 4:

#### Onslaught related:

- Fixed accessed none in mid-game GUI code
- New, optimized Goliath shot hit effect
- Fixed Raptor camera from clipping into the world
- fixed collision hole in Goliath
- vehicle splash rings
- fixed daredevil message to only show the stats that made you a daredevil
- Manta water spray effect
- If two nodes are an equal number of links away from the enemy powercore, the autospawn system will now select the one physically closer to the core instead of randomly picking one.
- Optimized some effects to improve client performance

#### Onslaught AI:

- greatly improved AI control of flying vehicles
- fixed bot getting out of vehicle and instantly killed causing AI problems
- bots in mantas and scorpions may jump out if about to be hit by avril
- Improved Leviathan AI
- improve Raptor firemode selection AI
- bots like jumppads more in Onslaught
- improved AI initial node rush
- bots better at comboing with PRV side gun
- improve AI vehicle route following (less backing up)
- high skill bots jump out of mantas that have web projectile stuck to them
- fixed occasional bot in vehicle getting stuck on inventoryspot
- fixed bot avril locks when bot can't see target
- fixed bots trying to heal node from too far away
- fixed defenders staying in vehicle too long when node unpowered
- PowerCores now block paths through them (need to rebuild paths for this to work)
- bot Mantas more aggressive against foot enemies
- bots smarter about navigationpoints blocked by vehicles
- move as close as possible in vehicle if no path to dest (until currentpath isn't useable)
- bots pick best side of vehicle to get out
- Entering a vehicle turns off a pawn's and a pawn's weapon's AmbientSounds
- bots keep manning tanks (and other "important" vehicles) when possible
- bots do multiple dodges toward road pathnodes
- improved bots staying focused on enemy attacking power core
- if bot can't get out of vehicle turret, he tries to switch to driving vehicle if there's no driver
- bots understand they can't shoot through powernode shields
- bots don't toss spidermines into powernode shields
- fixed bots in vehicles trying to use teleporters
- improved bot use of handbraking for steering

#### General game play:

- removed log warnings when damagetype is none
- fix for getplayerstart log spam in invasion
- Fixed the single player not going to the SP_Main menu after showing the intro
- fixed script warnings
- Only allow suicides once every 10 seconds
- fixed Xan torso w/ invisibility
- have "?" portrait show up if no valid portrait on HUD

#### Demo Recording:

- Added a hack so that demorecdrivers always convince the server that it's UTX files are Gen=1
(fixes CTF flags not showing in demos recorded on dedicated server installs)

#### Networking:

- UT2K4 works with WinXP SP2 firewall
- speed hack detection improvements (less problems for people with just bad connections)
- Fixed Linux server crash when Master Server drops connection unexpectedly. (in 3270.1)
- increased default ConnectionTimeout to 30 seconds
- fixed cases where non-replicated emitters were being spawned server side (performance improvement)
- Fix for server travel crash bug.
- fixed destroyed vehicles disappearing so much on saturated connections
- Properly handle the FailCode command coming from the server.  This was what would cause a client to appear "locked solid" when 2 clients were trying to join the last slot.
- "Only Official Maps" toggle in server browser now becomes disabled when mods are loaded.
- Fixed the server browser Filters description overlap.
- Fixed Classic Translocator Setting in net games.
- The "Press F10 to" Connection Message makes it's return.
- Fixed vehicles looking flipped over on clients when they aren't
- Servers recover if connection to master server fails during receive
- Fixed HandleStream crash on server with some user Assault levels on connections with packet loss
- Server performance improvement (don't copy structs in NEQ replication comparisons)

#### Editor:

- added per layer detail settings for terrain deco layers
- fixed particle editor crash

#### Engine/General:

- fix for `processhitwall` crash
- fixed script assignment bug (assignment of deleted actors resulted in no change from the current value).
- loading time speedup.


## Here is the full change list for Patch 3:

#### Onslaught related:
 
 - Onslaught Map window clearly shows what team you are on
 - The green vehicle crosshair no longer off centered from the main crosshair.
 - Drivers don't take drowning damage while driving vehicle
 - Made Vehicle.tick() functionality native (for performance).  
 - Added LockWarningInterval property to Vehicle.
 - Fixed vehicles taking water damage when their driver gets out while they are in the water
 - Fixed Onslaught Vehicles so their reset time is reset to at least 10 seconds when healed
 - fixed AVRiL fired by bot sometimes changing to target vehicle bot is getting into.
 - reduced bot accuracy with the Onslaught turret
 - limited how far Scorpion web projectiles can fall before dissipating, to prevent them being used for spamming
 - Fixed link projectiles not doing extra damage to vehicles when linked up
 - Fixed bots teleport looping in Onslaught

G#### eneral Game play:
 
 - Fixed low skill bots using lifts
 - CTF defender AI improvements (pursuing flag)
 - Optimized splash effects
 - Junkyard magnet now works again
 - Fixed AS-Junkyard exploit
 - Don't preload skins with `botuse=0`
 - Only precache Epic skins unless `xDeathMatch.bCustomPreload` is `true`
 - Various script warning fixes
 - SkipMatch cheat gives you credits as well
 - MutNoSuperWeapons no longer in "arena" group.
 - Fixed CTF-TwinTombs wrong team playerstart

#### Menus:
 
 - "Movie" tab is no longer empty in other languages
 - Fixed some script warnings in UT2K4Tab_OnslaughtMap
 - Fixed alignment bug in the Filters menu
 - Fixed manually adding a favorite server overwriting the selected favorite.
 - Fixed various options in the filters menu not being set to read only.

#### Demo Recording:

 - Fixed Onslaught turrets so that their weaponmesh doesn't get hidden in demo playback
 - Fixed Onslaught 2nd/3rd weapon orientation craziness during demo play back
 - Fixed behindview resetting when preview another player in 3rd person during demo playback
 - Fixed the Onslaught mini-map so it appears in demo playback (but not 100% functional)
 - Fixed Auto-Demo Recording

#### Server Admin:

 - Fixed setting spaces in MOTD via webadmin

#### Networking:

 - Fixed "weapon not firing" bug, caused by reliable bunches from client getting queued up on server under certain packet loss conditions.
 - Improved low net bandwith (modem) client net performance:
	  - improved vehicle turret replication at low net bandwidths
	  - improved old pawn replication at low net bandwidths
	  - Added `bWasSaturated` flag to `PlayerController` - set on server side when connection was saturated the previous tick
	  - if connection saturated and low bandwidth, use terrain traces for determining relevancy
 	  - Lowered `netpriority` and `netupdatefrequency` for `onsweaponpawns`
 - Made super shock beams not `bNetTemporary` (so you always see your shots even w/ packet loss)
 - Added `MaxClientFrameRate` configurable property to LevelInfo.  Add `MaxClientFrameRate=xx` to the `[Engine.LevelInfo]` section 
   of your `UT2004.ini` to change this property.  It only works if your netspeed is above 10000 (LAN games, or as negotiated between 
   server and client - increase the servers MaxInternetClientRate above 10000 to use this feature in internet games).  Increasing 
   this value will increase upstream bandwidth use, possibly causing problems for ADSL and cable modem users with low bandwidth 
   upstream pipes, and will also increase server CPU utilization.
 - Improved server performance by removing some expensive (and never tripped) checks
 - Fixed speaking beacon to be green if have link out
 - Fixed network jitter at low game speeds (gamespeed mutator)
 - Speed hack checks enabled when flying redeemer
 - Colored names exploit fixed again
 - Fixed Web Response exploit
 - Fixed server crash exploit
 - Improved handling of packet loss of initial actor replication bunch

#### Mod Author Related:

 - Fixed compile error/warnings with `-mod=` to point to the right directory.
 - Made manifest transient, so it doesn't prevent saving games
 - Fix for bInstantRotation weapons so they support having the same yaw and pitch bone.
 - Added 2 commands to the security actor to return all aliases and bindings, and added example code to XPlayer showing how to use them.
 - Pawns using `PHYS_Spider` play walking anims
 - Added dumpframes command for dumping raw frames as a movie. In the console, type "`dumpframes start`" to begin the process, and
   "`dumpframes stop`" to end the process.  It should be using the current screenshot mask.
 - Adjusted Scripted textures to use the character 'Q' for height, not char #0

#### Editor:

 - Integrated particle system editor (under the tools menu).

#### Engine/General:

 - Fixed NaNs in model render data (caused rendering issues on some hardware).
 - Fixed crash bug in `USkeletalMesh::GetCollisionBoundingBox()`
 - 64-bit fix.
 - Fixed corrupt maps crashing upon .UCL generation
 - `MoveActor()` performance optimization (avoid going through attachment list if possible)
 - Don't write "xx moved without proper hashing" warning to client logs.
 - fixed rare (mod only) karma physics crash


## Here is the full change list for Patch 2:

#### Onslaught related:

- Added `bSmoothKarmaStateUpdates` to `Actor` to control whether Karma interpolates between states
- Added `bRepulseWater` to `KRepulsors` and enabled this for Hovercraft
- Added `bFlyingKarma` to Pawn to indicate `PHYS_Karma` is active but pawn rotation should still be handled like `PHYS_Flying`
- `SVehicleFactories` now store a reference to their marker as `MyMarker`
- Added `bCanHover` to `Vehicle` to indicate a vehicle that can use `HoverPathNodes` to fly over water.
- Added water damage support to Vehicle so that vehicles will take damage when under water.
- Karma now collides correctly with inverted terrain - courtesy James Golding ;-)
- Increased the extra linear dampening for Karma in water from 0.8 to 2.5 and angular dampening from 0.1 to 0.4
- Moved `RepulsorsShouldHit` function to `ONSVehicle` where it should be.
- Added support for PowerCores and PowerNodes triggering events when created and destroyed.
- Cleaned up PowerCore energy beam effect when PowerCores are not present in the map.
- Added `bDriverCannotLeaveVehicle` flag in `ONSVehicle` for vehicles you can't get out of but instead will try to flip you upright when you press USE if the vehicle is flipped.
- Added `bNeverActivate` to `ONSVehicleFactory` that can be set by mods that want to use Onslaught maps but not factories.
- Fixed a bug in `ONSWeapon` that used the primary fire projectile class for alt-fire instead of the alt-fire version.
- Moved daredevil code server-side to avoid horrible cheating and the ability to mod/mutate features based on daredevil tricks.
- Reversable vehicle factories will work correctly when sides are swapped.
- Fixed midgame menu popping up when watching an Onslaught demo if the viewed player dies
- Fixed camera rotation being changed when switching between first and third person view in a manta
- Fixed target/ion painter ammo issues
- Fixed bug in stunt mutator where vehicles would be accelerated in their local downward Z when holding the jump warmup while in air.
- Onslaught turrets cannot damage PowerCores or PowerNodes
- Onslaught vehicles take a very small amount of damage over time when on fire and there is no driver
- Fixed players always spawning at own PowerCore after sides are swapped. 
- Fixed problem where bots weren't spawning at the nodes they are defending.

#### General Game play:

- More script warning fixes
- Fixed armor loop in `GameInfo.ReduceDamage()` properly handling armor getting destroyed while absorbing damage
- Invasion monsters never use default character mesh
- Fixed `CTFSquadAI.FindHidePathFor()`
- Make sure always add armor using `Pawn.AddShieldStrength()`
- Fixed `ShieldAbsorb()` armor damage absorption to produce consistent results in all situations
- Fixed spawning of physicsvolume entry and exit actors, as well as splash sounds, and made them client side.
- Added `WaterSplash`, used for projectiles and pawns
- Added `SplashEffect` property and `CheckForSplash()` function to `WeaponAttachment`, so instant hit weapons can cause splashes
- Added `BulletSplash`, used for trace weapons 
- Landing sounds no longer stomp on splash sounds
- Added `WaterRing` - spawned while pawn is walking in water, or center of pawn enters water (new `PawnEntryActor` property in `PhysicsVolume`)
- Fixed pawn visible rotation lagging too far behind actual rotation (because of head/torso twist support)
- Fixed bots going after nearby dropped inventory that they couldn't pick up
- Fixed some dynamic uploads (which could cause occasional hitching during gameplay)
- Fixed getting proper ammo count when picking up dropped weapon and already have ammo but no weapon of that type
- Fixed `SquadLeader` getting set to none if everyone in squad is in a turret
- HUD weapon bar bShowMissingWeaponInfo now config, so is properly saved
- Fixed `CTFSquadAI` finding flagholder when holder is in vehicle
- Fixed "Use Map Defaults" for bots can result in uneven teams in some maps
- [USE] will only bring up the mid-game menu in ONS games
- Fix for custom models crashing the single player game.
- Fixed `TracerProjectile` location setting after near miss sound effect
- Fixed BR bomb trail position in multiplayer
- Added Instagib CTF as standalone gametype
- Allow chatting when the game is paused.
- No longer catch own weapon when thrown while running forward
- Fixed weapons checking if they were out of ammo when they weren't the active weapon (which was causing undesired switching to best weapon)

#### Menus:

- Server browser filters have been reworked to be easier to use.
- Localized "New News" message 
- Added localized IRC channels for French and German. 
- Added a flashing messages when there is new community news.
- Movie Panel.

#### Networking Related:

- Various Web Admin style fixes
- Don't load non-default voicepacks on dedicated server
- Fixed server enforcement of `maxresponsetime`, and make sure clients don't trip it accidentally
- Fixed speedhack detection false positives
- Increased `NetPriority` of controlled `ONSWeaponPawns`
- Fixed client-side game time getting screwed up
- Improved jumping/dodging/etc. not getting lost when there's significant packet loss
- Fixed Cheat protect to view most voicepacks as ok
- Fixed *hopefully* the ServerBrowser locking packages and tripping cheat protection.
- Don't spawn `votinghandler` and `votingreplicationinfos` for servers which don't have voting enabled (slight performance improvement for those servers)
- `TeamInfo` and `SquadAI` have lower `netupdatefrequency` (for server performance).  Set `NetUpdateTime` whenever a replicated property is updated to get it replicated immediately.
- Make sure that mutators are properly reported to master server
- Made `ServerShortTimeout()` replicated function reliable
- `MasterServerUplink` now caches calls to `GetServerInfo` and `GetServerDetails`. 
- Onslaught server performance improvements:
	- vehicle packed state struct updates don't set `bNetDirty`
	- don't update vehicle `SoundPitch` on dedicated servers
	- improved `WebProjectile` net performance
	- added `bIsAwake` and `bHasBeenAwake` flags to `ONSVehicle`, used for packed state replication
	- Fixed replication conditions for a bunch of vehicle/projectile properties, changed from `bNetDirty` to `bNetInitial`
- Fixed `NetworkStatusMessages` once and for all
- Reenabled temp. MD5 database generation for loaded packages on a server
- Fixed "flying player" exploit.
- Fixed keeping high translocator trajectory persistent across online level changes.

#### Mod Author Related:

- Fix for the `UCL` not exporting bug.
- Fix for `.INT` files in mod hierarchy, Removed Temp MD5 Warning Message.
- Call `PostRender2D()` on own pawn as well (mod authors can decide not to render custom beacon)
- Added `LevelInfo` native function `GetPhysicsVolume()` - returns the physics volume at a specified location
- Added actor property `bTraceWater`.  If `true`, `trace()` by this actor returns collisions with water volumes
- Added support for strafing while on ladders, if the LadderVolume property `bAllowLadderStrafing` is set true (still false by default)
- Fix for log files and `-MOD=` switch
- Fix for cache manager exporting ucl files when it shouldn't
- Fixed `LoadDecoText`
- Use `CrouchedPct` instead of `WalkingPct` for crouched pawns
- Vehicle function `NumPassengers()` now simulated so it can be called on clients
- Made `Destroy()` function call in ONSVehicle state code indirect (for debugger)
- Fixed localization for mod support
- Now support multiple music directories
- Save Games fixed, with the following limitations:
  - ragdolls aren't serialized
  - animations aren't serialized (but uses simanim to save channel 0)
  - must run UT2004 with `-makenames` option, or set bSupportSaveGames true in LevelInfo
  - added Actor events `PreSaveGame()` and `PostLoadSavedGame()`
- Render hud `overlays[]` on `DM_Low` clients also

#### Editor:

3D Buzz Editor Enhancements (Thanks to our friends at www.3dbuzz.com !  Check out their UT2004 mod author video tutorials at 
http://sv3.3dbuzz.com/vbforum/unr_main.php )
	  - Maximize Viewports fixed
	  - Static Mesh Create From Selected added
	  - Splitter bar between Viewport and props in SM viewer fixed.
	  - Button to snap view to frame the current mesh added
	  - Option to auto-snap view on mesh change
	  - Added realtime preview to the SM browser.
	  - New Array tool for quickly adding actors.

#### Engine/General:
- Fogging is based on camera position rather than pawn head position (important for third person camera while pawn is submerged)
- Removed `D3D9Drv.dll` and `default.ini` from patch
- Fixed bug reporting address for Italian, Spanish, and French localized versions.
- Fixed "Intersect Function" crash from first patch.
- Fixed mousewheel input on Win64.
- Removed some pre-release debugging that was still enabled


## Here is the full change list for Patch 1:

#### Onslaught related:

- Teams will now swap sides after each Onslaught round by default. This is configurable in the game settings menu.
- Fixed flying Leviathan exploit where Leviathan can be based on another vehicle.
- Fixed Leviathan pushing exploits by limiting the Leviathans max speed.
- Fixed Tank pushing exploits by limiting max speed unless falling.
- Node location names show up correctly in network games.
- Fixed terrains with a negative scale not showing PowerNodes.
- RadarMap can no longer be moved off-screen using the HUD configuration menu.
- Fixed possibility of ion cannon volume in ONS-Severance killing someone entering it without giving them warnings first 
- Fixed bots getting stuck next to a vehicle because they didn't think they were close enough to enter
- fixed players getting out of vehicles into water

#### Invasion related:

- Fixed Invasion ammo not replenishing at end of wave
- Fixed Invasion's `ScoreKill()` not notifying `GameRules` when monster kills a player 
 
#### General Game play:

- fixed which anim is played during sniper zoom (removes log warnings)
- fixed redeemer reticle being affected by HUD opacity setting
- fixed skaarj playing taunt anims
- make sure no wrap around on multikill numbers
- call `takefallingdamage()` on wall dodge to prevent it being used as an exploit for avoiding damage on long falls
(can still use wall dodging anywhere you could before, you just take damage if you are falling too fast).
- fixed miscellaneous game code log spam.
- UTClassic Rocket fix for delay before can fire again after loading up 6 rockets
- fixed zoom instagib beam positioning
- improved hidden lightning gun beam positioning
- fixed bioammo positioning
- force correct default character, even if PRI hasn't been replicated yet
- force same character as player is using - players using bForceDefaultCharacter must use a valid forced character as their own model
- improved team balancing in network games

#### Single Player:

- added profile fix to unlock chars (where due) for "old" profiles

#### Map and Kick Voting:

- Fixed incorrect map voting gameconfig at startup 
- Reenabled map, kick voting.
- Removed Voting filter combos on server filters page.
- Added "None" selection in the map voting web admin config.
- Edit only 1 line at a time in map voting web admin config.
- Cleaned up/ fixed map voting menus
- `DefaultMapListLoader` loads prefixes from `GameConfig` settings by default.
- Added `UseMapList` property to `PlayInfo` 
- Disabled the `MapListLoaderType` `PlayInfo` property 
  (disables `MapListConfigPage` - makes it simpler to configure)
- Fixed wrong map types showing for default selected game type in voting
  menu. Only happens if GameConfg.GameClass is not set with the same case.
- Implemented exec ShowVoteMenu
- Map voting defaults to ONLY server startup gametype and maps if not   
  configured. (Auto-detect configuration)
- Added extra check for invalid gametype/maps votes.
	 - Sort maps in MC ListBox on map voting page by name by default
	 - Changed to descending sort order in vote count MC ListBox

#### Menus

- Fixed weapon custom crosshair menu problems, whiched caused you to sometimes lose crosshairs entirely. 
- Fixed correctly displaying VOIP key bindings in control config menu.
- allow mouse sensitivity settings as low as 0.25 in menus
- made blue player text brighter in server browser player list box
- fixed menu range for idle kick timer
- Add `bFixedMouseSize` to lock the size of the cursor
- Fixed `GUIPage` closing issue (Thank Wormbo)
- Fixed Sorting issue with Map Lists
- Fixed issues with the OwnageMap page and older clients.

#### Demo Recording

- Demo->AVI menu uses proper resolution settings 
- Fixed auto demo recording
- fixed DIVx demo movies being recorded at too high a frame rate

#### Networking Related

- Fixed bug in `UT2K4NetworkStatusMsg` causing incorrect status message to be displayed
- Don't display join/leave messages for standard voice channels	
- Listen servers pinged last?
- Security updates 
- Server browser news page now supports clickable hyperlinks.
- If master server doesn't respond, still pings official servers
- Fixed projectiles don't have dynamic light on clients connected to dedicated servers 
- give client correct kick message when kicked for idling
- improved and enabled speedhack detection
- send message to client warning about speed hack detection
- servers won't send more than 8 packets out to client before getting a response (DOS attack blunting)
- fixed netmode conditions for preloading player skins
- improved character skin precaching speed (less unnecessary skin precaching)

#### Server Admin Related

- Optimized webadmin initialization, noticable improvement in the time between map changes (if webadmin enabled)
- Fixed interface-related bug in gametype drop down
- In the Defaults - Map page, fixed bug with adding/removing multiple maps at the same time
- Webadmin no longer overwrites custom URL parmeters that have been manually added to maplist entries
- Fixed webadmin bots page layout & accessed nones
- Fixed bugs in SortedStringArray sorting (affects bots / admins / groups pages in webadmin)
- New map & mutator packages no longer require server restart to appear in webadmin mutator/map lists.
- fixed webadmin and menu idle kick time range
- added `MaxTimeMargin`, `MinTimeMargin`, `TimeMarginSlack` configurable properties for tweaking speedhack detection to `[Engine.LevelInfo]` section of `UT2004.ini`
- admins don't get kicked for idling
- To prevent DDOS attacks by UT2004 servers against subnets, added `LimitConnPerIPRangePerMinute` property to `[IpDrv.TcpNetDriver]`.
- `pkg_official` packages can be downloaded, and guid must be matched for them
- Added `bKickLiveIdlers` to `[Engine.LevelInfo]`.  If set true, players with pawns can also be kicked for idling.

#### Mod Author Related

- Impersonator support integrated (see http://www.oc3ent.com/home.htm for details).  Provides support lip synching to spoken phrases, with UnrealEd integration.  
  Tools and examples to come soon!
- Reorganized placement of webadmin functions to be more linear, easier to follow
- Added more comments to webadmin code
- Fixed crash in `BatchExport` commandlet when attempting to export `.uc` for packages which contain purely native classes
- Properties marked as `'noexport'` will no longer be ignored when batchexporting `.uc`'s
- Added `Vehicle.Bulldog` to `CacheManager` default packages (`cacheexempt`), and marked Bulldog cache exempt so that it isn't exported to `.ucl` file
- Fixed bug in classname matching which caused two classes that began with the same name  (such as `ClassBase` & `ClassBaseDerived`) to be interpreted as the same class
- Automatically export to `.ucl` file when package is compiled.
- Automatically export to `.ucl` file when map is saved.
- Custom webadmin skins no longer required to provide every `.inc file that webadmin uses
- Webadmin now searches main `/ServerAdmin` directory for `.inc` & `.htm` files that cannot be found in skin path
- `GUIController` now correctly cleans up custom styles that use the same keyname as default styles
- if `.upl` files exist in mod directory, ignores the `.upl` files in the system directory.
- `INT` files no longer have to be in `UT2004\System\`.
- UCC no longer gives an error when using `-mod=` switch with '`dumpint`' and '`exportcache`'.
- Can specify a `Paths=` for music (`.ogg`) and karma data (`.ka`) files, so they can be included in the mod's directory structure.
- Config variables properly save to `UT2004\ModName\System\Whatever.ini` instead of `UT2004\System\Whatever.ini`.
- No longer get "`ERROR: Could not open whatever.u for reading!`" in `UT2004.log` for mod packages.
- Gracefully handle lack of tooltips in mod menus.
- fixed `USoundExporterWAV` to not try to export procedural sounds and sound groups
- Added `AddToPackageMap()` native function to Actor. This function adds `PackageName` to the `packagemap` (as if it was in `GameEngine`'s `ServerPackages` list), 
  or, if omitted, adds the package of the actor it was called on. This function is only valid during initialization (between `GameInfo::InitGame()` and 
  `GameInfo::SetInitialState()`) If called outside of that window, or anytime on a client, the function returns without doing anything.
- Fixed `bAddToServerPackages` mutator flag 
- Mutator config menus:
	-Fixed handling of arrays
	-Support for advanced and multiplayer only options 
- Fixed config class properties not being saved to .ini properly
- fixed `BroadcastHandler` `AcceptBroadcastText()` parameter
- Added `IconFlashMaterial` to `Ammunition`, to allow mod ammunition classes to work right on HUD.
- `AdrenalinePickup` amount no longer hard coded
- Added support for a mod based `\KarmaData` directory

#### Editor:

- Fixed bug with disappearing actors after lighting rebuild
- Sped up ALAudio initialization in editor by not precaching sounds

#### Engine/General

- fixed memory leak in caching system
- fixed crash in `GUIToolTip::Draw()`
- fixed bug in cache loading for crosshairs (custom crosshairs now appear correctly in menus)
- removed temporary sanity checks in projector code and pathfinding code (small performance improvement)
- gracefully handle negative delta time
- properly set `GCurrentTime` in UTV
- fixed resource induced memory leak in `PixoResource`
- more debugging to track down infrequent `FALVoiceModule::Decode` crash
- `bForceSkelUpdate` no longer true by default for pawns (still true by default for vehicles). Performance improvement (especially for servers),
  but mod authors relying on this feature may need to change the value for their pawns.
- fixed memory leak in swiming physics code
- many spelling/grammar error fixes
- friendly error messages for file loading problems caused by overheating or corrupt installs
- don't crash if non-Emitter has `DT_Particle`
- removed some VOIP log spam
- fixed installing korean version on Windows 98
- CD/DVD not required to play

#### Linux

- fixed `CacheRecords.ucl` handling on Linux
- Various client and server crash fixes

#### Mac
- fixed Mac clients reporting incorrect MD5s for packages and tripping security checks.
- Make MacOS version prevent user from ejecting the game DVD while game is running.

