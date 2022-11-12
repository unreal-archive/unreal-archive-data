# Unreal Tournament Patch 436 

This was the last official patch produced by Epic Games, and is installed by 
default when you install Unreal Tournament via Steam.

## Unreal Tournament version 436 Release Notes

Version 436 clients are network compatible with all previous public releases of UT (versions 400, 402, 405b, 413, 420, 425, 428, and 432).
Version 436 servers support only 432 and above clients.

- fixed joystick button handling code (thanks Chris Carollo).
- hack fix for bad playerstart in CTF-Coret.
- fixed crash for servers with more than 255 characters worth of server packages.
- fixed problems with single player ladder than cropped up in 432.
- Server now report to clients whether or not they are password protected.
- Fixed incompatibility in `ChallengeHUD` that caused problem for some mods.
- In the editor, the "TextureLock" option should work 100% now.
- Fixed the editor crash that some people were getting when docking a browser and getting a crash when trying to restart the editor.
- Rewrote `UEditorEngine::polySelectMatchingBrush` because SHIFT+B was crashing at random times in the editor. Should be stable now.
- Brush clipping was merging faces on the resulting brush in the editor.
- May have fixed the random "WinMain/message pump" crash in the editor.
- Pre-432 spectators not allowed to join 436 servers (because of incompatibility). 

## Unreal Tournament version 432 Release Notes

Version 432 is completely network compatible with all previous public releases of UT (versions 400, 402, 405b, 413, 420, 425, and 428).

- faster server browser initial pinging of servers.  Added a new default property to `[UBrowserServerPing]`, `MaxSimBroadbandPing`, which defines the max number of servers to simultaneously ping if your netspeed > 6000.
- team scoreboard holds more players (no more names dropping off the bottom for 32 player games).
- fixed grenade smoke in OpenGL
- fixed some D3D compatibility issues
- faster server ping response for servers with mutators.
- admins lose cheats and die when they log out as admins.
- fixed bug causing player team choice to be overriden (also cause maxteamsize not to work when 2)
- fixed thrown weapons sinking into ground in net play
- fixed listen server crashing with too many serverpackages
- fixed server still sending data on disconnect
- fixed server not allowing custom skins because of skin cheat fix
- servers are now prioritized by version on the master server
- improved map decompression time.
- slight improvement to server CPU utilization.
- prevent message spamming in net play.
- centered admin messages - if logged in as an admin, start your message with a # to have it centered.
- voice autotaunts not printed in net games.
- fix for CTF AI.
- limit translocator firing rate (max 2/sec)  to prevent translocator spamming bind cheats.
- suicides are counted as deaths.
- admin spectators can use # to center print messages.
- disallow setting of actor properties using the "set" command on clients.  Prevents a whole class of cheats.
- faster menu loading with mods.
modmakers to make a small change to the way they add items to the Mod menu. Previously, mod menu items were created with an .int file entry something like this:
```
Object=(Name=ChaosUT.ChaosUTModMenuItem,Class=Class,MetaClass=UMenu.UMenuModMenuItem)
```
To make your mod load quicker when UT starts up, you need to add a Description field on the end.
```
Object=(Name=ChaosUT.ChaosUTModMenuItem,Class=Class,MetaClass=UMenu.UMenuModMenuItem,Description="ChaosUT Config,Configure ChaosUT")
```

The stuff after the comma is the text that appears on the help bar at the
bottom of the screen.  If you don't make the change to your int file, your
mod will still work with the next UT patch, but it won't load any faster -
so please make the change for the next release of your mod.

### Editor enhancements

_**2D Shaper**_

The 2D shaper can now handle multiple shapes, like the old one did.  But
the coolest thing is that it can now handle bezier segments (*you can have as
many as you want*).  You select a side, turn it into a bezier segment
and you get 2 control points that you can use to control the shape of the
segment.  The segment has multiple detail levels so you can control how
smooth the curves are.  It also allows you to create whatever kind of shape
you want, and it will triangulate the shape automatically when the time comes to
create a brush from it.

The file format has changed, so any shapes you've currently saved won't be
usable in this new one ... so print them out or something.  :P

**_Movers_**

When you right click a mover there is a new menu option called
"Show Polys". What this will do is add the movers polygons into the
current BSP.  You can then change the texturing, surface flags, etc of
those polys and those changes will be reflected on the mover itself.  So
you don't have to recreate movers anymore to change the way they look.  The
only drawback to this is that the polys it stuffs into the BSP -- they're just
temporary, but you will have to rebuild your map to get rid of them.  But I
think that's a more than reasonable trade off.  :)

**_Modes_**

"Brush Clipping" has been made into it's own mode ("**MODE BRUSHCLIP**").  
This allowed several good things to happen ..

-  You can place clipping markers anywhere you want to now.  On top of
brushes, actors, etc ...
-  Placing clipping markers will no longer deselect the currently selected
brushes
-  Many bugs have been fixed, including the ever nasty "*can't clip
a brush that you've vertex manipulated*"
    - NOTE : *this mainly applies to any NEW brushes you create
after getting this version.  Old brushes may work OK if you transform them
permanently before trying the clip though ...
*-  If you attempt to clip a brush and it doesn't work properly, undo
the clip,  transform the brush permanently and try again.  This will
make it work 99% of the time.

"Vertex Editing" is also it's own mode now ("**MODE VERTEXEDIT**"). 
Mainly for ease of use reasons.  It's also got all of the dragging
weirdness worked out of it.  It will still crash if you drag vertices on
top of other vertices on the same brush.  This is by design.  It will
be handled in a future version through an option to weld vertices.

**_Misc_**
Some of these might be repeats from above, so if you see any that are, just
pretend you didn't see them ...

* Actor grouping (like vis groups in Worldcraft)
* made all browsers dockable inside of a master browser window (individually configured)
  * you can have a mix using this system ... have some browsers docked, others floating
* added ability in texture browser to rename textures
* all browser windows will fill in a default filename when saving packages or exporting items
* 2D shape editor
  * you can build shapes however you want - no more worrying about triangles
  * shapes will auto-triangulate when you create a brush
  * now supports multiple shapes
  * supports bezier segments
  * had problems with beziers on the left hand side of the shape
  * would have problems with tons of polys in the shape
  * now has the ability to scale shapes up or down
  * brush pivot point should now be in the correct place after creating a brush
* "Radii view" will now work in the 3D window by rendering the collision cylinder as an 8-sided wire cylinder
* "Radii view" will also show the radius of things like lights in the 3D window
* made the "snap vertex" graphic on the bottom bar larger
* various vertex editing fixes/improvements
* Brush Clipping
  * changed the marker to a little push pin
  * clip markers are now numbered as you add them in - like QER
  * clip markers have a circle drawn around them that doesn't scale with zoom distance
    * you can select clip markers by clicking the circle as well as the actor itself
* fixed MeshBrowser not playing individual animations
* changed vertex editing color to always be white
* may have fixed the way the tabs would overlap each in the "surface properties" and "build options" dialogs
* turned the mesh viewer into a regular browser window - it can be docked and is treated the same as the other browser windows
* cleaned up the UI on all the browsers - things are much more consistent and cleaner now
* when an image is loaded into the 2D shaper, the lines should be dark gray instead of black
  * the image also shifts around when you move the origin.  It shouldn't - lock it at the origin.
* box selection mode will no longer occasionally leave the box sitting there until you move the camera again
* fixed the "can't clip brush after using vertex manipulation on it" bug. 
  If something goofy DOES happen with the brush clipping it can be fixed 99% of the time by transforming the brush permanently, and trying the clip again.
* CTRL+E hotkey for "Save As"
* SHIFT+LCLICK on a BSP surface will select the brush that belongs to it. 
  This works like QER.  The brushes wireframe will render on top of the
  brushes surfaces.  You can move the brush around, rotate it, etc without
  ever going into wireframe mode.
* opening/importing lots of filenames, in any browser, will work now
* adjusted the label text in the texture browser so that it's much more readable (smaller font, white, always centered properly)
* Added a button to the toolbar to do a complete build based on whatever the current build settings are
* made the font in mesh viewer render much brighter
* Brush Builders
  * added the "add to first step" field back into linear and curved staircases
  * group browser should have the ability to select/deselect the actors in the selected groups
  * texture browser can now be put into "variable size" mode in which it packs the textures in as close together as it can while preventing their labels from wrapping.  The scaling is adjustable.  This works very much like the QER/Worldcraft texture browers.  The old display mode IS still available.
* new Brush Builder : **Volumetric**.  Creates sets of intersecting sheets for torches, chains, etc...
* added an option to the rebuild dialog to only build visible actors - so working on a subsection of a level is much quicker
* added button to build dialog for "Create New Path Network" option 
  This option will delete all current pathnodes and create a new network on it's
  own.  This is sometimes good for a first pass which you can then tweak later.
* made the skybox visible when viewport is put into realtime preview mode
* double clicking a classname in the actor browser will bring up the script editor
* added MRU (*most recently used*) lists to all browsers
* added a dialog to replace one texture with another over the entire level
* changed master browser to use tabs to show the list of docked browsers instead of a combobox
* UnrealScript editor
  * fixed find dialog to work 100%
* added zoom buttons to the 2D shape editor
* dialogs will now warn you when you are writing over an existing file

## Unreal Tournament version 428 Release Notes

Version 428 is completely network compatible with all previous public releases of UT (versions 400, 402, 405b, 413, 420, and 425).

### Bug fixes

- fixed 425's D3D problems
- improved client prediction of other players on slopes
- fixed 'killall bot' working on servers even if not admin
- fixed Unrealed2 problems with DirectInput (by disabling DirectInput when using Unrealed2).
- fixed picked up weapons occasionally looping firing anim.
- fixed another case where server would keep sending data to client after disconnect.
- fixed Unrealed2 mesh viewer problem.
- fixed Owner being passed to new actor in Mutator.ReplaceWith().
- fixed creeping ping problem with Win2K. 
- fix for occasional accidental port changes on servers using NGStats:

These ini files are used:

```
[IpServer.UdpServerQuery]
OldQueryPortNumber=0
bRestartServerOnPortSwap=True
```

`OldQueryPortNumber` will get saved to the current value of the query port
number.  If the port number changes, the server will quit - and restart automatically 
if you are using an appropriate batch file (see http:\\unreal.epicgames.com\utservers.htm).

Setting `OldQueryPortNumber` to 0 will cause it to save the current port
number again, so you should set this value to 0 when you want to change
the port number deliberately (ie you're running a second server on the
same machine).


## Unreal Tournament version 425 Release Notes

Version 425 is completely network compatible with all previous public releases of UT (versions 400, 402, 405b, 413, and 420).

Note that with the new version, when you are connecting to a passworded server, you will see a "Connection Failed" message, and then successfully connect. 
The client first tries to connect without using a password, and then tries again with the password.

### Bug fixes

- fixed another mixed skin cheat
- fixed creeping pings problem - especially prevalent with passworded servers 
- fixed problems with passwords with spaces
- improved server CPU utilization
- improved prioritization of network traffic for low bandwidth users
- fixed `ActorLineCheck()` crash again - no really this time
- fixed clearing base on client in netplay - thanks Mongo
- fixed suicide spamming
- Last Man Standing now can have time limit
- fixed spriteballexplosion sounds playing client side
- faster translocation effect in software mode
- fixed collision bug which cropped up in 420 (overlord)
- fixed D3D 32 bit zbuffer allocation
- lowered NGStats thread priority on dedicated servers, so NGStats doesn't hold up level changes.
- Added bExternalBatcher configuration option to `[Engine.GameInfo]`.  If true, the game doesn't try to run the NGStats world log batch process.
- The `Use32BitZBuffer` switch in the advanced Direct3D options, which is disabled by default, will force the use of a 32-bit Z buffer even in 16-bit color display modes.

This can be used to fix flickering world surfaces and similar visual corruption when running in 16-bit mode on several cards, like the Matrox G400

### Editor:

* Forced code to compile to oldest possible version of `COMCTL32.DLL` ... should eliminate surface properties dialog not showing up, and actor browser being empty
* Editor is now able to handle pathnames with spaces in them
* fixed "Can't find 'ini:Engine.Engine.EditorEngine' in configuration file" error - code now uses `unrealtournament.ini` instead of `unreal.ini`
* added "reset" menu to main brush menu
* when importing textures, the texture browser would jump back the first package/group instead of to the newly created ones
* GUI updated with changes to get it closer to final design
* Editor viewports can now be put into "Direct3D" rendering mode (right click on viewport toolbar and select from menu options)
* importing textures/sounds will now allow for empty group names
* exporting all/changed scripts will now work correctly
* controls on bottom bar are left justified now, instead of right
* the surface properties dialog will now show the complete name of the texture that appears on the selected poly (package/group/name)
* when creating a new texture, the browser will now select the correct package/group and automatically call up the new texture for editing.
* 2D shape editor now has the ability to "extrude to bevel" and "extrude to point"
* edit controls can accept formulas again (precede formula with an `=` sign. i.e. `=256+128`)
* the "add special" dialog will now remember it's settings if you close it, and re-open it.  It will also stay on the screen until you manually close it.
* music browser will now properly import/export files
* added a new button on left hand bar for changing camera speed
* the combobox on the bottom bar will now keep an MRU list of recently entered commands
* editor shouldn't crash or give weird messages when shutting down anymore
* on the alignment tab, the scaling combobox is now able to have values typed directly into it
* on the alignment tab, there are seperate "apply" buttons for each set of scaling values (one for the edit controls and one for the combobox)
* the left hand toolbar now has sections so you can hide/show the commands you want
* the left hand toolbar will now allow scrolling if the screen gets too small to hold all the buttons
* at the bottom of the lefthand toolbar is a section for user defined buttons.  These are defined through the unrealed.ini file.
* texture browser will no longer crash if it is resized to be smaller than the width of one texture


## Unreal Tournament version 420 Release Notes

Version 420 is completely network compatible with all previous public releases of UT (versions 400, 402, 405b, and 413).

### Bug fixes

- fixed `actorlinecheck()` crash
- fixed `findrandomdest()`
- fixed D3D driver - combined best performance with widest compatibility of previous iterations, improved Voodoo 4 D3D support
- fixed installer problem with certain directory structures
- fixed security holes with `ServerRestartGame()` `SwitchLevel()` and `SwitchCoopLevel()`
- removed ability to use bad skins
- fixed `ADDINI` for editing .ini files for patch and umod installation

### New features (thanks to Legend)

- New editor! (see editor notes below) - note that the editor is still called `unrealed.exe`
- various other under the covers features and fixes merged in by Mark Poesch of Legend

NEW EDITOR NOTES:

> NOTE
> 
> Something to be aware of is that this version replaces the old UnrealEd.exe ...  
> It is STRONGLY recommended that you make a backup of your system directory so you
> can still run the old editor should you need to do something that the new editor 
> doesn't, or that is broken in the new editor.

The editor included with this patch is the current version of the C++ UnrealEd.  You'll find it as "unrealed.exe".  This is an *EXPERIMENTAL* version ...  If you want to use it, you can, but be aware that certain things are broken or lacking.  If you click on something and it doesn't work, it's probably not implemented yet.

A quick list that I know of ...

- Vertex editing will sometimes do weird things with drag distances and brush clipping
- Finding/Replacing text in the UnrealScript editor is broken
- Clicking on tabs in some windows doesn't seem to work right.  The wrong tab will come up or no tab at all.  To fix it, click on the first tab, and then each one in order until you get to the one you wanted.

This version has a mix of the old and new UI ... so if it looks weird, that's why.  :)

If you want to send me feedback on this version ... requests for features you want, things you like, things you don't, etc., send them to unrealed2@epicgames.com ... I may or may not respond depending on the volume of email I get ... so don't get offended if I don't.  ;)

A quick rundown of the new features and how to use them follows.  Thanks to Scott Dalton at Legend for his help in compiling the majority of this!  Bear in mind, the editor is still very heavily under development and these features -should- work ... but you'll run into weird situations and stuff.  Be prepared.

**Configurable Viewports**

To add new viewports go to the View -> Viewport -> New Viewport menu option.  Up to 8 editing viewports are allowed, and the size and positioning will be saved upon exiting the editor. Floating Browsers are equally resizable and all viewports can be used with dual monitor support.

You can also use the "Config" option to choose from preset configurations.  In this release, this is your best bet.

There are also options for having viewports as "floating" or "fixed".  "Floating" means you have a caption bar and resizing bars.  "Fixed" means ... you don't!

**Drag Box Selection**

A group of brushes/actors can be selected in any 2d viewport using this dragbox command.  Hold Control and Alt and left-click-drag the mouse to create a red drag box.  Any brush or actor whose pivot point is within this box will be selected.

**Brush Clipping**

Brush clipping creates a 2d or 3d clipping plane using 2 or 3 definition points to establish the position and angle.  Certain commands will need to be bound to keys to properly use this feature.  This feature can be used both on the active brush and on previously placed brushes.  NOTE : Brushes MUST be transformed permanently in order to be clipped properly.

To place clipping points hold control and right-click within a 2d editing viewport.  This will place one control point.  Click again to place a second point.  With 2 points, you can perform a 2d clip.  A red line will be drawn between the points indicating the plane of the clip, with the normal of the clip (the red perpendicular line to the clip plane) indicating the part of the brush that will be clipped away (destroyed) by the clip.  Focus must be in the desired 2d viewport for the 2d clipping to work correctly.  

3d clipping works in the same way, but an additional point must be added.  These points must then be aligned using either 2d or 3d viewports to create the proper 3d plane.  

Adding a 4th clipping point will reset the clipper and destroy all clip markers.

There are UI controls for brush clipping, but if you are more comfortable using hot keys, you can bind -

`BRUSHCLIP`  - performs the brush clipping operation
`BRUSHCLIP FLIP`  - flips the normal of the cutting plane
`BRUSHCLIP SPLIT`  - retains the clipped off portion as a second brush (will not work on the builder brush)
`BRUSHCLIP DELETE` - removes all current clipping points from the world

**Multiple Vertex Editing**

This command allows multiple vertices to be selected and moved.  This allows face/edge manipulation and other vertex editing operations.  Some caution must be exercised with multiple vertex editing (as with single vertex manipulation which is still available) to avoid creating invalid shapes by moving a vertex from a 4+ vertex face off plane with the other vertices on that face.  These situations are easily avoidable if you understand what you are doing, but if you are confused by that concept, you may be better off avoiding this feature.

To use multiple vertex editing, turn on the "Vertex Editing" button under "Modes" on the button bar.  This will highlight the vertices on the selected brush/es.  (Note : you can change the color of the vertices to your preference by changing your editor Advanced Options->Editor->Color->C_BrushVertex Color.  It is best to set it to something bright like pure white.)  Multiple vertices may then be selected, as other actors would be, by using control and clicking or by using Drag Box Selection.  Selected vertices may then be dragged to the desired position in any 2d viewport.

The following commands may be bound to keyboard keys for vertex editing -

`MODE SHOWVERTICES -1` : This will toggle "Vertex Editing" button on and off.

**New Brush Factory Options**

Several new brush factory options are available.  These can be combined with other new features (Read - Vertex editing) to create new shapes.  

**Tessellated Cube Builder**

Under Cube options, turning Tessellated to True will create the cube out of triangles instead of quads.  As triangles can be freely vertex edited into a variety of shapes, this is handy for quickly creating simple rock-like structures or the like.

**Terrain Builder**

This is *NOT* in any way related to Epic's new terrain engine under development.  This will create a cube with a single highly tessellated face.  The desired number of width and depth segments can be defined within the builder.  This brush may then be edited via multiple vertex editing to create terrain or other similar brushes.

**UnrealScript Editing Support**

To quickly switch between open scripts by using a listbox - double click the name to switch to a new script.  Exporting packages works from a multiple selection listbox in the actor browser - select the packages you want, and with one mouse click, they are all saved to disk (easier than saving each on separately using a that old combobox).

**Misc/Convenience Features**

There are a variety of small features which have been added for editing convenience.  

**Actor Search/Align**

To search for actors, select "Search for Actors" under the edit menu.  You can search by name, tag, or event.  Double clicking on an actor in the search window will center all viewports on that actor.  Alternatively, you can bind a key using the command "CAMERA ALIGN" ... this will align all viewport cameras on the selected actor.  This is VERY nice for finding an area in one view, clicking something there, and aligning all views on it.  Fast navigation.

**Texture Relative Scaling**

Textures may be scaled by either absolute or relative values.  To turn on relative scaling, click on the "relative?" checkbox.

**Texture Browser Filter**

To use a text-string filter on textures in the browser, simply enter the string to filter in the "Filter" dialog at the bottom of the window

**Light Color Selection**

To select a light color using the standard windows color picker, click on the "color" button the actor�s LightColor preferences.

**Light Brightness Scaling**

Selected lights can be scaled by absolute or relative values.  To use this option, select "Scale Lights" under the edit window.  Good for lightening or darkening an area that has lights of different brightness values.

**Make Selected Actor the Current Actor**

This command takes the currently selected in-level actor, and sets the actor browser to the same type of actor.  To use this command, right click on the actor in any viewport and select "Make Current."  So if you want to place more pathnodes in a level, you can right click one of the existing ones, choose "Make Current" and start placing them without using the actor browser window.

Again, this version is under development and this release is mainly to gather feedback.  To reiterate ...

If you want to send me feedback on this version ... requests for features you want, things you like, things you don't, etc., send them to unrealed2@epicgames.com ... I may or may not respond depending on the volume of email I get ... so don't get offended if I don't.

Have fun!  =)

**420 also includes all the fixes and improvements in the 413 patch (listed below)**


## version 413 Release Notes

Version 413 is completely network compatible with all previous public releases of UT (versions 400, 402, and 405b).

### Known Issues

- If you are using D3D and Unreal Tournament did not automatically detect
    D3D when you first installed (so you had to manually select it), you should
    change your video driver to D3D again after installing this patch. 
    This will allow Unreal Tournament to optimize its settings for your video
    card.  To reset your D3D driver, go to the Options->Preferences menu
    and select the Video tab.  Then click on the change driver button to
    re-select D3D.
- We have seen an instance of a GeForce 256 displaying many world polygons
    flashing and flickering.  If this happens for you, press TAB type
    "preferences" to bring up the advanced options menu.  Then
    set UseVideoMemoryVB to True in the Direct3D Render Device options.

### Fixes and Improvements

**Bug fixes:**

- Fixed occasional green skins on players.
- Eliminated most common cause of crashing on startup for GeForces in D3D mode.
- fixed slow client occasional assertion in `UnChan.cpp` (last part of the problem that first showed up in 402)
- fixed clients continuing to get data from servers after disconnecting
- fixed problem causing `!Bunch->IsError()` assertion which was causing some server crashes
- fixed last man standing late entry cheat
- fixed head gib not replicated on headshot in network play
- fixed die at start of feign death and can't respawn in network game
- The detail textures now work correctly in D3D and are reasonably fast (still disabled by default)
- Eliminated squares showing around decals and other modulated textures in 16-bit mode D3D.
- fixed death message when killed in pressure chamber
- fixed keyboard key sticking problem (thanks Chris Norden from Ion Storm/Deus Ex)
- fixed actors getting beginplay events twice if spawned while level is being brought up
- Custom crosshairs > 9 now show up.
- Fixed speech menu bug with mouse staying active.
- Fixed speech menu text positions.
- Fixed bug in bot Assault AI for dealing with team cannons

**New features (Gameplay):**

- D3D uses vertex buffers for all drawing operations - gives overall performance boost.
- Can now use number and arrow keys to navigate voice menu
- Random bots picks from all 32 (not first 16) - including the specially configured ones
- Can summon specific bots: 'AddBotNamed Alarik' adds the bot with the name Alarik (if he's in the list of configured bots)
- Now shows waiting players on team scoreboards before start of game (players who aren't ready are greyed out)
- Improved bot AI about triggering pressure zone when player is in it
- Changed xDSL and cable modem clientspeed to 10000 (and added separate category in netspeed selection)
- No longer need to type 'iamtheone' for cheats in single player
- Demos can now play looping - `demoplay demofile?loop`
- Turbo/hardcore mode is now shown in UBrowser for team games

**New features (for Mod Authors):**

- Unreal monsters will now fight UT bots
- Fixed Mutator `RegisterHUDMutator()` - only sets `bHUDMutator` if successful registration
- Added a call in `DeathMatchPlus.RestartGame()` to allow mutators to modify the map progression (or change what mutators, etc. are loaded for each map)
- Added a call in `Pawn.Died()` to allow mutators to prevent deaths
- Added a call in `GameInfo.EndGame()` to allow mutators to modify the game ending conditions
- Added a call in `GameInfo.Login()` to allow mutators to modify the spawnclass, and login options
- Added a call in `GameInfo.PickupQuery()` to allow mutators to modify whether inventory items get picked up
- F3 brings up objectives menu for subclasses of Assault.
- Call voicepack in player setup menu rather than just playing voice to allow effects to be heard in setup menu.
- AttachDecal() now returns the texture the decal was attached to
- UTExtraKeyBindings class to allow modmakers to add to Customize Controls menu
- Mod menu organization - mod menu class is adjustable with `[UMenu.UMenuMenuBar]` ModMenuClass
- manifest.ini correctly reports version number so mods can require UT version beyond 400 for installation
- Mod authors can add UBrowser tabs, see http://unreal.epicgames.com/files/SampleUBrowserPage.zip for an example of how to set this up
- `stat anim` command displays a list of all visible animating actors with the names of their animations and current frame positions, shows the animation modes - lerping, static, looping back, tweening, and gives individual cpu time and poly count stats. This should be really useful for debugging and tweaking complex model animation repertoires.

**New features (for Servers):**

- Support for server only download version
- Servers can adjust the minimum compatible version number reported to clients using:
  ```
  [IpServer.UdpServerQuery] 
  MinNetVer=405.  
  ```
  This can be used to prevent older clients from seeing your server if you are running a mod which requires a UT version newer than 400.
- ngWorldStats version 1.5.5 is included in the patch.
- The UT server now queries ngWorldStats log batcher to determine if it is correctly processing stats logs. 413 servers report this information to UBrowser, and shows both whether ngWorldStats is enabled on the server, and whether it is actually working correctly.
- Server admins can now redirect auto-downloads to a remote HTTP (WWW) server.
 
Custom content such as maps, skins and texture packages can be stored on the remote
website either uncompressed or in a compressed file format (.uz) for
faster downloads.

The settings to control downloads are in the server's `UnrealTournament.ini`
file.  These are the settings for downloads sent directly from
the UT server:

```
[IpDrv.TcpNetDriver]
AllowDownloads=True
MaxDownloadSize=0
DownloadManagers=IpDrv.HTTPDownload
DownloadManagers=Engine.ChannelDownload
```

Setting `AllowDownloads` to `False` disables all autodownloads sent
directly from the UT server.  This setting has no effect on redirected
downloads. `MaxDownloadSize=0` means allow autodownload of any sized file directly
from the UT server.  Otherwise the value is in BYTES.  We recommend that rather than disabling all
downloads, you set the `MaxDownload` size to an appropriate value.  For
example, `MaxDownloadSize=100000` will allow mutators and other small packages to
be downloaded, but will not allow large files such as maps to be
downloaded.  Turning off all downloads may make it hard for older clients to get
on your server if you are using a lot of custom maps, mutators or other custom
packages.  This setting also has no effect on redirected downloads.

These are the settings for redirecting downloads to a remote website site:

```
[IpDrv.HTTPDownload]
RedirectToURL=http://www.website.com/full/path/to/directory/
UseCompression=True
ProxyServerPort=3128
ProxyServerHost=
```

To enable redirected downloads, you need to set the `RedirectToURL`
variable to point to the website where the files will be autodownloaded from. 
If a client running 405b or earlier connects to your server, it
will ignore the redirection and attempt to download the file directly from the
server, so it is important to configure the non-redirected download options
even if you intend use redirected downloads.  If `UseCompression` is
set to `True`,  the files must be stored on the remote website as
compressed .uz files.  You can create a compressed .uz file by using the
command `ucc compress` from the DOS prompt in the UnrealTournament\System
directory.  Typing `ucc help compress` will give you a list of
supported options (currently this is only a list of filenames or wildcards to
compress).  If `UseCompression` is set to `False`, the custom
package files should be put on the website as they are.  Here are some
examples of `ucc compress`:

```
C:\UnrealTournament\System> ucc compress ..\maps\dk*.unr
C:\UnrealTournament\System> ucc compress ..\textures\customskins1.utx ..\textures\customskins1.utx ..\maps\as-bridge.unr
```

**413 also includes all the fixes and improvements in the 405 patch (listed below)**

**Bug fixes:**

- destroy the "winch", not the "wench" in AS-rook description :)
- fixed problem with landing bob damping on slow systems with high time dilations
- fixed problem where client health gets set to zero (health was still correct on the server)
- fixed spectators drowning in water outside of galleon
- fixed problem with one of the 402 server optimizations causing pickups to be shown when they should be hidden if high packet loss
- fixed fog rendering in software
- fixed assertion line 714 network crash on slow connections
- fixed PlayerReplicationInfos losing owner on client - symptom was teammate health not correctly shown on team huds
- fixed bad poly on Ripper weapon model
- fixed flag not dropped if killed by team cannon in CTF games
- fixed server browser changing highlighted server bug
- fixed gold players showing up in CTF
- added BossSkins.int
- fixed clients hearing ambient sound on dropped weapons in some cases
- fixed picking up additional shieldbelt screwed up armor total if also had other armor types
- fixed teamtriggers
- fixed deathsounds and hit sounds from other players not being heard in net games
- fixed demo playback crash

**New features:**

- much louder warhead explosion
- don't allow Turbo mode with assault
- bigger blood cloud when gibbed
- Menu and text formatting changes to support Japanese text
- Added "AddIni" command for umods to add lines to ini files
- Changed occurances of class'DeathMatchMessage' to DMMessageClass. Allows mod authors to use their own DMMessageClass in all situations.
- Made ngWorldSecret a private variable. So you can't read it from GetPropertyText anymore.
- Added CRT's query packet send improvements. Should improve grabbing server lists from master server.
- Added ProcessKeyEvent to HUD. Allows mod authors to work with key input directly.
- Moved hardcoded SPRITE_PROJECTION_FORWARD from UnSprite.cpp to Actor Property SpriteProjForward.
- Set Actor's default SpriteProjForward to 32.0
- Checked in RegisterHUDMutator functions in Mutator. Allows mod authors to make mutators that self register as HUD mutators.
- Integrated Enhanced Actor Rendering Interface. Allows programmers to render actors in just about any way they can think of.
- Enabled RCI. (Except ClearScreen and RecomputeLighting) Allows programmers more control over what's rendered from a player's point of view.  Search for Render Control Interface in headers for information.
- F4 brings the server browser up.

**Performance Improvements:**

- downloads from server are now rate controlled
- Servers can deny auto-downloading of content by setting `AllowDownLoads=false` in the `[IpDrv.TcpNetDriver]` section of the `Unrealtournament.ini` file.
- reduced how long carcasses hang around on servers
- Improved bit packing for network packets (server performance improvement)
- Ability to turn fractal texture animation off:

Added the `NoFractalAnim `switch. When true, fractal textures are never
updated and the texture's bRealTime is set to false. This takes effect at a
package's loading/init time, so you'll have to restart a level to see it
take effect.

The `NoFractalAnim` variable sits at the `[WinDrv.WindowsClient]` section in the
.ini files, and under 'display' in the advanced options.

It's meant for troubleshooting texture generation crashes as well as a
speedup tweak for those cards that slow down too much with per-frame texture uploads.

Try it if you see the "anomalous singularity" error message."

405 also includes all the fixes and improvements in the 402 patch

**402 Bug fixes:**

- D3D detection works properly.
- removed log warnings for players ghosting out of the level
- fixed saving last start spot for players
- timemessage sounds play correctly if viewing another player
- don't allow spaces in names when using console name or setname commands
- suicide can now end overtime of tied game
- fixed stuck animation if killed while coming out of feign death
- no connect time on team scoreboards in single player
- attach decals in post begin play when zone is properly set
- fixed player sounds appearing to change location when using 3d sound
- turn fog off by default for D3D - was causing texture thrashing w/ D3D drivers
- fixed CTF-coret alternate path problems
- fixed guided warhead blowing up if no client response with 300 msec after spawning
- players can no longer switch to illegal team if server is full and force team balance set
- fixed bots not always playing take hit sounds
- don't kill spectators in the pressure chamber!!!

**402 Server performance improvements:**

- Don't replicate actor properties of `GameReplicationInfo`
- Don't replicate actor properties of `ZoneInfo`
- Less frequent visibility checks for currently relevant actors
- don't keep checking visibility of optional effects
- less frequent checks for temporary actors after 0.2 seconds
- reduced `playerreplicationinfo` update frequency from 5/sec to 4/sec
- inventory class-specific scripted replication only done if bNetOwner
- native replication for weapon, pickup, levelinfo, and ammo classes
- don't spawn decals on dedicated server
- don't spawn non-replicated effects actors on dedicated server
- sort static actors so can ignore non-replicated static actors when testing for replication

**402 New features:**

- added flesh hit sound to bullets
- automatic path builder (documented in updated UT_AI.htm)
- `postnetbeginplay()` called for actors spawned on network clients
- Pawns use `PostNetBeginPlay()` to make sure they have a valid skin and mesh
- improved D3D texture pool allocation when world and actor texture detail is medium
- Pawns add momentum to velocity after effects of damage mutator
- Optional package downloading implemented. 
