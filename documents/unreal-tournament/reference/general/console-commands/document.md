## Introduction

This is a list of console commands and command line options, most of which are valid for the current version of the UT demo.  The upcoming version of the demo will add a few of the new ones.  The cheat codes will be changed for the full version of UT.

## UnrealTournament.exe Command Line Parameters

| Param | Description    |
| --- | --- |
| \-changevideo | Bring up the video card selection menu |
| \-conflicts | Show objects of different classes whose names conflict. |
| \-log | Runs with the log window initially visible. |
| \-noddraw | Disables DirectDraw support. |
| \-nodsound | Disables DirectSound support. |
| \-nogc | Disables garbage collection. |
| \-nohard | Disables 3d hardware support. |
| \-nok6 | Disable AMD K6-3D support. |
| \-nolog | Don't show log window. |
| \-nokni | Disables KNI (Pentium III) support |
| \-nommx | Disables MMX support. |
| \-nosound | Disables sound. |
| \-nowarn | Disables warning message boxes on the screen. |
| \-profile | When C++ is compiled with DO\_SLOW\_GUARD=1, generates an UnrealScript function profile using the timings in the most recently played level only. |
| \-safe | Runs Unreal in "safe mode", avoiding loading any device drivers which could crash if there are hardware/driver problems. |
| \-server | Runs as a dedicated server.  See ucc server |
| \-silent | Run silently, with no log window, and no display of error messages. Critical errors just cause the engine to exit silently. |
| INI=inifilename | Specify the .ini file to use for configuration. Normally UnrealTournament.ini. |
| USERINI=userinifilename | Specify the .ini file to use for user-specific configuration.   Normally User.ini |
| LOG=logfilename | Uses the specified log file instead of UnrealTournament.log. Useful when running multiple copies on the same machine. |
| MULTIHOME=12.34.56.78 | Sets the "home" ip address (in numerical format) which Unreal Tournament will bind to, for a machine with multiple IP addresses. |
| PORT=num | Sets the UDP port number for the Internet server. |
| READINI=inifilename | Sets the .ini file for reading only (not for writing); overrides the INI= option. |

## **Ucc.exe** Command Line Parameters

**UCC.exe** is the command line UnrealTournament launcher.  It launches a number of "commandlets".   **ucc help** will give you a list of available commandlets. 

### Ucc make

| Param | Description    |
| --- | --- |
| \-h | Rebuilds all .u files from their source .uc files and generate a C++ header for each package. |
| \-nobind | Don't treat UnrealScript/C++ binding errors as critical, for rebuilding scripts and avoiding the chicken-and-egg binding problem. |
| \-strict | Treat all script warnings as critical errors; useful for tracking down the call stack when debugging scripts. |

### Ucc server

Usage: ucc server URL  \[parameters\]  
Most of the parameters valid for unrealtournament.exe are valid for ucc server.  
The URL parameter is usually just a map name, but can include a number of options:

*   ?alladmin  - give all players administration access
*   ?game= -specify the game class
*   ?mutator= - specify a list of mutator classes (comma separated)

## UnrealScript Console Commands

### General console commands

| Command | Description |
| --- | --- |
| MENUCMD \<menu> \<menuitem> | Perform an UnrealTournament menu item.  For example, MENUCMD 1 0 brings up the Unreal Tournament server browser |
| SAY \<message string> | Broadcast a message to other players in the game. |
| SETNAME \<newname> | Change your name (works in network play too). |
| SUICIDE | Commit Suicide |
| TEAMSAY \<message string> | Broadcast a message to your teammates. |

### Practice session console commands/cheats.  

Most of these will change.

| Command | Description |
| --- | --- |
| ADDBOTS \<number> | Adds more bots to the game. |
| ALLAMMO | Gives you all the ammo for your current weapons. |
| FLY | Fly around (instead of walking). See WALK. |
| GHOST | Fly around and go through walls (see WALK). |
| GOD | Makes you invincible. |
| KILLALL \<class name> | Kills all actors of a certain class, for example "KILLALL WARHEADLAUNCHER". |
| KILLPAWNS | Kills all bots |
| PLAYERSONLY | Pauses all non-player actors in the game. Cool for debugging scripts, taking screenshots. |
| SLOMO \<number> | Sets the game speed, 1.0 is normal. |
| SUMMON \<class name> | Spawns an actor of the specified class (for example, SUMMON BOTPACK.WARHEADLAUNCHER) in front of the player. |
| VIEWCLASS \<class name> | Cycle through actors of this class, viewing from their locaton.  eg VIEWCLASS BOT |
| WALK | Walk around normally (see FLY, GHOST). |

### Admin console commands.  
Some of the above practice session cheats are available in network play when you're logged in as an administrator.

| Command | Description |
| --- | --- |
| ADMIN \<command> | Perform a console command on the server's console |
| ADMIN SERVERTRAVEL \<new level URL> | Causes the server to switch to a new level. |
| ADMIN SET UWeb.Webserver bEnabled True | Enable the remote admin webserver (requires a level change to take effect) |
| ADMIN SET UWeb.Webserver bEnabled False | Disable the remote admin webserver (requires a level change to take effect) |
| ADMINLOGIN password | Login as an administrator |
| ADMINLOGOUT | Drop administrator access |
| KICK \<playername> | Kick a player |
| KICKBAN \<playername> | Kick a player and ban his/her IP.  You'll need to edit your ini file or use the WWW remote admin to unban their IP |

## C++ Console Commands

### Local Commands
These only work on the local machine.

| Command | Description |
| --- | --- |
| BRIGHTNESS | Cycle through 10 screen brightness values. |
| CANCEL | Cancels an "open" command in progress that is trying to connect to a network server. |
| CDTRACK num | Play the specified CD track. |
| CPUSPEED=# | Identify your CPU speed, useful for machines which don't autodetect their speed properly. For example, CPUSPEED=266. |
| DEMOPLAY \<filename>  <br>\[?noframecap\]  <br>\[?timebased\]  <br>\[?3rdperson\] | Play a recorded demo.  noframecap plays the demo back as fast as possible. This option is assumed if timedemo 1 is enabled.  timebased gives a smoother playback if the playback machine is significantly slower than the recording machine.  3rdperson lets you fly around a first person demo as a spectator.  eg demoplay mydemo?3rdperson?timebased |
| DEMOREC \<filename> | Record a demo to \<filename> |
| DISCONNECT | Disconnect from the current server |
| ENDFULLSCREEN | Go back to playing in a window. |
| EXEC filename | Execute the console commands in the filename, default is in the System directory. |
| EXIT | Exit the game.. |
| FLUSH | Flush all caches. Regenerates all lighting, 3d hardware textures, etc.   Can be useful to clear texture corruption due to 3D hardware driver bugs |
| FOV angle | Set the field of view, for example "FOV 90" for 90 degrees. |
| GETCOLORDEPTHS | Get a list of color depths supported by your 3D hardware |
| GETCURRENTCOLORDEPTH | Get the current color depth (16 or 32) |
| GETCURRENTRES | Get the current resolution |
| GETRES | Get a list of available resolutions |
| HIDEACTORS | Hide actors during game play. |
| JUMPTO x y z | In UnrealEd, move the viewport to a certain X,Y,Z location, useful in conjunction with tester reports generated with the REPORT command. |
| MUSICORDER num | Change to a certain track in the song (0=ambient, 1=action, 2=suspense). |
| NETSPEED number | Change your desired network data rate.  Use 2600 for modem, 5000 for ISDN, 20000 for Cable/ADSL/LAN |
| OPEN url | Opens a local map (eg "dm-turbine.unr") or an Internet server (eg "200.0.1.16" or "unreal.epicgames.com"). |
| s\_occfactor | A3D 2.0 occlusion factor |
| s\_maxnodedist | A3D 2.0 maximum node distance |
| s\_reflect 0 or 1 | A3D 2.0 reflections |
| s\_occlude 0 or 1 | A3D 2.0 occlusions |
| s\_wavetracing 0 or 1 | A3D 2.0 Wavetracing |
| s\_refgain | A3D 2.0 reflection gain |
| s\_refdelay | A3D 2.0 reflection delay |
| s\_maxpoly | A3D 2.0 maximum number of polygons |
| s\_maxreflectpoly | A3D 2.0 maximum number of reflection polygons |
| s\_polysmall | A3D 2.0 smallest polygon size |
| s\_polylarge | A3D 2.0 large polygon size |
| s\_a3dsources | A3D 2.0 Sources |
| SETRES WxHxD | Set the resolution and color depth.  eg SetRes 800x600x32 |
| SERVERTRAVEL url | Change levels from the UnrealTournament Server console window. |
| STOPDEMO | Stop recording or playing back a demo. |
| PREFERENCES | Displays the Advanced Options window. |
| RECONNECT | Reconnect to the current/previous server |
| SHOT | Take a screenshot and save it in the System directory with a consecutive name like Shot0001.bmp. |
| TOGGLEFULLSCREEN | Toggles fullscreen mode on and off. |
| TYPE | Types text on the console. |

Also see the [Mesh LOD document](https://web.archive.org/web/20030205075034/http://unreal.epicgames.com/lodtechnologynotes.htm) for Mesh LOD console commands.

### Statistics

| Command | Description |
| --- | --- |
| STAT ACTOR | Shows various statistics. |
| STAT CACHE |
| STAT CLIP |
| STAT FILTER |
| STAT FPS | Show frame time in milliseconds |
| STAT GAME |
| STAT GLOBAL | Shows useful performance timings in milliseconds |
| STAT HARDWARE |
| STAT ILLUM |
| STAT LIGHT |
| STAT MESH |
| STAT NET | Show network performance statistics including ping, packet loss, bytes/second |
| STAT POLYC |
| STAT POLYV |
| STAT REJECT |
| STAT OCCLUSION |
| STAT SOFT |
| STAT SPAN |
| STAT ZONE |

### Debugging

| Command | Description |
| --- | --- |
| DEBUG CRASH | Test crashing the game by appError. |
| DEBUG EATMEM | Test allocating memory until it fills up. |
| DEBUG GPF | Test a general protection fault. |
| DEBUG RECURSE | Test crash by infinite recursion. |
| DUMPCACHE | Display the contents of the memory cache GCache. |
| DUMPNATIVES | Display a list of unused native function ids. |
| EDITACTOR CLASS=classname | During game play, edits the properties of the nearest actor belonging to that class. Cool for debugging. |
| GET \<classname> \<variable> | Gets the default value for a variable in a class |
| MARK | Mark all objects that are in memory (for garbage collection debugging in conjunction with MARKCHECK). |
| MARKCHECK | Display a list of all unmarked objects that are in memory (for garbage collection debugging in conjunction with MARK). |
| MEM | List memory usage; only works when Unreal is compiled with the memory-tracking option (it's usually not). |
| MEMSTAT | Show Windows overall memory statistics. |
| OBJ CLASSES | Prints a list of all loaded classes. |
| OBJ DEPENDENCIES PACKAGE=pkgname EXCLUDE1=otherpackage EXCLUDE2=otherpackage... | Show package dependencies |
| OBJ GARBAGE | Collect and purge garbage ("garbage" means objects which are no longer in use). |
| OBJ HASH | Show object hashing statistics. |
| OBJ LINKERS | Show a list of active linkers (each linker is responsible for loading objects from a package file). |
| OBJ LIST CLASS=objectclass INSIDE=insideclass | List all objects belonging to the class and residing inside the specified object.  If the class isn't specified, lists ALL objects.  If the inside object isn't specified, shows all objects.  Gives a summary of memory usage.  This is very useful during game play for figuring out how much memory is being used.  In UnrealEd, this statistic isn't useful because a huge amount of extra stuff is loaded which might not be used by your map. |
| OBJ REFS CLASS=objectclass NAME=objectname | Show a list of objects which reference the object you specify.  When trimming memory usage, this is useful for figuring out why some object is being loaded. |
| REPORT | Copies a report of the current gameplay situation to the clipboard.  You can then paste the resulting text into an email program, Notepad, etc. Extremely useful for beta testers, because it dumps the player's X,Y,Z location, the difficulty level, etc. |
| RMODE | Set the rendering mode. 0-9. |
| SET \<class> \<variable> \<value> | Sets the specified property of the specified class with the specified value |
| SHOWACTORS | Shows actors during gameplay. |
| SOCKETS | In network play, shows a list of network sockets (UNetConnection's) in use. |
| URL urlname | In network play, parses a URL and displays its components. |

## Unreal Tournament Key Bindings

In the Unreal Tournament key bindings (type PREFERENCES to bring up Advanced Options / Advanced / Raw Key Bindings), you can associate console commands and other special input commands with key presses and releases.  In the text box next to a key name, you can type in one or more console commands, separated by the "|" character.  For example, to bind the "S" key to the "Jump" alias, type this:

    Jump

That causes the "Jump" alias to be executed when th user presses the "S" key.  For another example, if you want to bind a chat message to a key, use this:

    Say "Come get some!"

In addition, you can bind multiple actions to a keypress like this, to make the "S" key both jump and say a message.

    Jump | Say "Come get some!"

You can also bind an action to the release of a key by using the OnRelease keyword. For example, you can make the "S" key fire when it's released:

    OnRelease Fire

Or you can make the key jump when pressed, and fire when released:

    Jump | OnRelease Fire

Keys can be bound to any of the following kinds of things:

*   Any console command in the above lists.
*   Any key alias (explained below).
*   Any special input command.

"Special input command" refers to console commands which only make sense in conjunction with the press or release of a key, or the movement of the mouse or joystick along an axis. The special input commands are:

*   BUTTON \<UnrealScript boolean variable name>, for example "BUTTON bFire": Maps a button to an UnrealScript variable stored in the Pawn class or any subclass.   This tells the input system to automatically set the variable to True when the key is held down, and False when it's not pressed.  For example, the Pawn script looks at bFire to tell whether the fire button is being held.  The setting of bFire is not some hardcoded behavior of the engine, rather it is propagated into UnrealScript code by the input system, as a result of binding a key to "BUTTON bFire".
*   TOGGLE \<UnrealScript boolean variable name>, for example "TOGGLE bLook": Like the BUTTON command, but simply tells the input system to toggle the boolean variable's value when the key is pressed.
*   AXIS \<UnrealScript floating point variable name> \<SPEED=some number>, for example "Axis aStrafe Speed=-300.0". Maps an analog input axis movement to an UnrealScript variable, scaling it by some factor.  The current axis keys listed in the Advanced Options menu are: MouseX, MouseY, MouseW (Intellimouse wheel), JoyX, JoyY, JoyZ, JoyR (joystick rudder), JoyU, JoyV (joystick alternate axis for example the Panther XL trackball). Supported PlayerPawn axes are aBaseX, aBaseY (base movements which are translated to rotating, strafing, looking, and forward movement based on context), aMouseX, aMouseY, aForward, aTurn, aStrafe, aUp (not used), aLookUp, aExtra0-aExtra4 (not used). To see how the game code processes movement, see the PlayerPawn class's PlayerInput and PlayerTick functions.

In addition to the Advance Options menu, you can also bind keys from the console using the following command:

	SET INPUT <keyname> <binding>

For example:

	SET INPUT X Fire
	SET INPUT Enter Fire

## Unreal Tournament Key Aliases

Key aliases are listed in Advanced Options / Advanced / Input Aliases.  Aliases provide a convenient way to map one word (for example, "Jump") to a complex series of console commands that carry out a particular action.  For example, the "Fire" alias is defined as: "Fire | Button bFire".  This has the effect of calling the UnrealScript "PlayerPawn.Fire" function (aliases are not recursive), and then causing the input button bJump to be set to True as long as the key is held.

