## Command Line Parameters

*   \-alladmin: Enable all players administrative access to the server.
*   \-conflicts: Show objects of different classes whose names conflict.
*   \-editor: Runs Unreal for editing.
*   \-firstrun: Re-asks the "First Run" questions in Unreal.
*   \-log: Runs with the log window initially visible.
*   \-nobind: Don't treat UnrealScript/C++ binding errors as critical, for rebuilding scripts and avoiding the chicken-and-egg binding problem.
*   \-noddraw: Disables DirectDraw support.
*   \-nodsound: Disables DirectSound support.
*   \-nogc: Disables garbage collection.
*   \-nohard: Disables 3d hardware support.
*   \-nok6: Disable AMD K6-3D support.
*   \-nolog: Don't show log window.
*   \-nommx: Disables MMX support.
*   \-noreplace: Don't automatically replace textures, sounds, and music if they are not found.
*   \-nosound: Disables sound.
*   \-nowarn: Disables warning message boxes on the screen.
*   \-profile: When C++ is compiled with DO\_SLOW\_GUARD=1, generates an UnrealScript function profile using the timings in the most recently played level only.
*   \-make: Rebuilds all .u files from their source .uc files.
*   \-make -h: Rebuilds all .u files from their source .uc files and generate a C++ header for each package.
*   \-safe: Runs Unreal in "safe mode", avoiding loading any device drivers which could crash if there are hardware/driver problems.
*   \-server: Runs as a dedicated server.
*   \-showdep: Causes script compiler to log dependency information when recompiling scripts.
*   \-silent: Run silently, with no log window, and no display of error messages. Critical errors just cause the engine to exit silently.
*   \-strict: Treat all script warnings as critical errors; useful for tracking down the call stack when debugging scripts.
*   INI=inifilename: Sets the .ini file to use for configuration, normally Unreal.ini.
*   LOG=logfilename: Uses the specified log file instead of Unreal.log. Useful when running multiple copies on the same machine.
*   MULTIHOME=12.34.56.78: Sets the "home" ip address (in numerical format) for Unreal of a machine with multiple network cards.
*   PORT=num: Sets the UDP port number for the Internet server.
*   READINI=inifilename: Sets the .ini file for reading only (not for writing); overrides the INI= option.

## C++ Console Commands (Only works on the local machine)

*   ADMIN: Sends a console command to the server you're connected to. You must be an administrator in order to use this.
*   BRIGHTNESS: Cycle through 10 screen brightness values.
*   CHAT: Brings up a prompt to type chat text.
*   CANCEL: Cancels an "open" command in progress that is trying to connect to a network server.
*   CDTRACK num: Play the specified CD track.
*   CONSOLE FULL: Make the console fullscreen.
*   CONSOLE HIDE: Hide the console.
*   CONSOLE SHOW: Show the console.
*   CPUSPEED=#: Identify your CPU speed, useful for machines which don't autodetect their speed properly. For example, CPUSPEED=266.
*   DEBUG CRASH: Test crashing the game by appError.
*   DEBUG EATMEM: Test allocating memory until it fills up.
*   DEBUG GPF: Test a general protection fault.
*   DEBUG RECURSE: Test crash by infinite recursion.
*   DUMPCACHE: Display the contents of the memory cache GCache.
*   DUMPNATIVES: Display a list of unused native function ids.
*   EDITACTOR CLASS=classname: During game play, edits the properties of the nearest actor belonging to that class. Cool for debugging.
*   ENDFULLSCREEN: Go back to playing in a window.
*   EXEC filename: Execute the console commands in the filename, default is in the System directory.
*   EXIT: Exit the program.
*   FLUSH: Flush all caches. Regenerates all lighting, 3d hardware textures, etc.
*   FLY: Fly around (instead of walking). See WALK.
*   FOV angle: Set the field of view, for example "FOV 90" for 90 degrees.
*   GHOST: Fly around and go through walls (see WALK).
*   HIDEACTORS: Hide actors during game play.
*   JUMPTO x y z: In UnrealEd, move the viewport to a certain X,Y,Z location, useful in conjunction with tester reports generated with the REPORT command.
*   LOADGAME num: Load a game in position 0-9.
*   MARK: Mark all objects that are in memory (for garbage collection debugging in conjunction with MARKCHECK).
*   MARKCHECK: Display a list of all unmarked objects that are in memory (for garbage collection debugging in conjunction with MARK).
*   MEM: List memory usage; only works when Unreal is compiled with the memory-tracking option (it's usually not).
*   MEMSTAT: Show Windows overall memory statistics.
*   MUSICORDER num: Change to a certain track in the song (0=ambient, 1=action, 2=suspense).
*   OBJ CLASSES: Prints a list of all loaded classes.
*   OBJ DEPENDENCIES PACKAGE=pkgname EXCLUDE1=otherpackage EXCLUDE2=otherpackage...: !!
*   OBJ GARBAGE: Collect and purge garbage ("garbage" means objects which are no longer in use).
*   OBJ HASH: Show object hashing statistics.
*   OBJ LINKERS: Show a list of active linkers (each linker is responsible for loading objects from a package file).
*   OBJ LIST CLASS=objectclass INSIDE=insideclass: List all objects belonging to the class and residing inside the specified object.  If the class isn't specified, lists ALL objects.  If the inside object isn't specified, shows all objects.  Gives a summary of memory usage.  This is very useful during game play for figuring out how much memory is being used.  In UnrealEd, this statistic isn't useful because a huge amount of extra stuff is loaded which might not be used by your map.
*   OBJ REFS CLASS=objectclass NAME=objectname: Show a list of objects which reference the object you specify.  When trimming memory usage, this is useful for figuring out why some object is being loaded.
*   OPEN url: Opens a local map (i.e. "unreal.unr") or an Internet server (i.e. "200.0.1.16" or "unreal.epicgames.com").
*   PREFERENCES: Displays the preferences in a window.
*   REPORT: Copies a report of the current gameplay situation to the clipboard.  You can then paste the resulting text into an email program, Notepad, etc. Extremely useful for beta testers, because it dumps the player's X,Y,Z location, the difficulty level, etc.
*   RMODE: Set the rendering mode. 0-9.
*   SAVEGAME num: Save the game in a specified position, 0-9.
*   SHOT: Take a screenshot and save it in the System directory with a consecutive name like Shot0001.bmp.
*   SHOWACTORS: Shows actors during gameplay.
*   SOCKETS: In network play, shows a list of network sockets (UNetConnection's) in use.
*   STAT ACTOR: Shows various statistics.
*   STAT CACHE
*   STAT CLIP
*   STAT FILTER
*   STAT FPS
*   STAT GAME
*   STAT GLOBAL
*   STAT HARDWARE
*   STAT ILLUM
*   STAT LIGHT
*   STAT MESH
*   STAT POLYC
*   STAT POLYV
*   STAT REJECT
*   STAT OCCLUSION
*   STAT SOFT
*   STAT SPAN
*   STAT ZONE
*   TOGGLEFULLSCREEN: Toggles fullscreen mode on and off.
*   TYPE: Types text on the console.
*   URL urlname: In network play, parses a URL and displays its components.
*   VIEWUP: Sizes the view up.
*   VIEWDOWN: Sizes the view down.
*   WALK: Walk around normally (see FLY, GHOST).

## UnrealScript console commands (Can be used by remote administrators)

*   ADDBOTS <number>: Adds more bots to the game.
*   ALLAMMO: Gives you all the ammo for your current weapons.
*   GOD: Makes you invincible.
*   INVISIBLE: Makes you invisible.
*   KILLALL \<class name>: Kills all actors of a certain class, for example "KILLALL UNREALI.BRUTE".
*   KILLPAWNS: Kills all monsters.
*   PLAYERSONLY: Pauses all non-player actors in the game. Cool for debugging scripts, taking screenshots.
*   SAY \<message string>: Broadcast a message to other players in the game.
*   SLOMO \<number>: Sets the game speed, 1.0 is normal.
*   SETNAME \<newname>: Change your name (works in network play too).
*   SETTEAM \<newname>: Change your team (works in network play only when the rules allow).
*   SUMMON \<class name>: Spawns an actor of the specified class (for example, SUMMON UNREALI.BRUTE) in front of the player.
*   SWITCHCOOPLEVEL \<new level URL>: Causes the server (or local machine, in a single-player game) to switch to a new level with coop-style weapon carrying between levels.
*   SWITCHLEVEL \<new level URL>: Causes the server (or local machine, in a single-player game) to switch to a new level.

## Console configuration commands

*   GET \<classname> <variablename>

Gets a configurable class parameter.  \<classname> may be a partial classname, such as "playerpawn", or a qualified classname such as "engine.playerpawn".  The class must be loaded in memory, otherwise GET returns an empty string.  \<variablename> must be the name of a variable that is designated as configurable (either in UnrealScript using the "config" keyword or in C++ using CPF\_Config).  This returns the value of the configured variable, converted to a string.  The value returned by GET reflects the class's default value (for scripted classes, this is the default value that was set for the class using its property sheet).  At any time, zero or more instances of objects belonging to \<classname> may be in memory, and may have modified values of \<variablename>, and they don't affect the value returned by "GET".

*   SET \<classname> <variablename> <value>

Sets the default value of a class's variable.  If the class is designated as configurable (using the "config" keyword in UnrealScript or CLASS\_Config in C++), and so is the variable, this function updates the Unreal.ini file to reflect the new default value. If any instances of objects belonging to \<classname> are in memory, all of those objects are updated.  When an object's config variables are updated, they are notified as follows:

1.  The object's PreEditChange() function is called, basically saying "Get ready to be modified!"
2.  The object's configurable variables are updated with the newly configured values.
3.  The object's PostEditChange() function is called, saying "You've been modified, so validate and update yourself".

This procedure enables objects to validate their configurable properties and update themselves.  For example, the audio subsystem's PostEditChange() function clamps the sound volume to a safe range of 0.0 - 1.0 (because the SET command enables users to set it to ridiculous values) and then updates the actual volume of the sound effects that are playing.

## Unreal Key Bindings

In the Unreal key bindings (under Advanced Options / Advanced / Raw Key Bindings), you can associate console commands and other special input commands with key presses and releases.  In the text box next to a key name, you can type in one or more console commands, separated by the "|" character.  For example, to bind the "S" key to the "Jump" alias, type this:

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

## Unreal Key Aliases

Key aliases are listed in Advanced Options / Advanced / Input Aliases.  Aliases provide a convenient way to map one word (for example, "Jump") to a complex series of console commands that carry out a particular action.  For example, the "Fire" alias is defined as: "Fire | Button bFire".  This has the effect of calling the UnrealScript "PlayerPawn.Fire" function (aliases are not recursive), and then causing the input button bJump to be set to True as long as the key is held.

