# Unreal engine Direct3D 10 renderer

This Direct3D 10 renderer for Unreal, Unreal Tournament, Deus Ex and Rune aims to provide a good, consistent looking and future proof renderer for these games. The focus is not on fancy effects; the idea is to have something that will allow these games to perform well and look good on modern systems, something which I can support and bugfix. Written from scratch, it ditches a lot of legacy stuff and profits from the fact that D3D10 support means a clear baseline. Furthermore, source code and documentation are provided, which should aid future efforts to keep these games running.

Thanks, for various reasons, go out to Danny, Tyler, Ro, Sebastian, Eric. Special thanks to Chris who made the [other renderers](../index.html) and provided valuable feedback.

## Features

- Complete. Implements the full range of Unreal graphics functionality such as reflective surfaces, detail textures, fog.
- Support for S3TC (i.e. compressed) textures, such as those from Unreal Tournament CD 2, the ones available here, these for the original Unreal, or New Vision for Deus Ex.
- Consistent. Looks good whether full screen or windowed, on whatever graphics card's being used. No washed out or dark graphics. Screenshots look like they do in-game.
- Niceties: supports various quality improvements such as anti aliasing and anisotropic filtering, see below.
- Always runs in 32 bit color mode, always has all game detail settings enabled.
- Fixes various graphics glitches present in other renderers (shimmering surfaces, etc.).
- Forces the game to run on one processor(core).
- Deus Ex, Unreal: instead of the 16 lowest, the 16 highest supported resolutions are shown in the video settings dialog.
- Inreased depth precision (before after).
- Automatically adjusts field of view to aspect ratio (example).
- Override textures: textures can be replaced by external .dds files not burdened by the engine's limitations. Artist info.
- Bump mapping: can be used when a normal map texture is provided.
- Parallax occusion mapping: either the standard detail textures or an external height map can be used for parallax occlusion mapping.
- HDR lighting and bloom; but also Classic Lighting which looks exactly as the games always have.
- For more information on the various settings, see below.

## Supported games:

- Unreal (Gold). Tested with Unreal 226final and Steam version of Unreal Gold (226). The renderer does not work with the version 227 fanpatch for various reasons.
- Unreal Tournament. Tested with Steam version (436).
- Deus Ex. Tested with Steam version (1.112fm). The most well-tested of the games.
- Rune. Tested with Rune 1.07 and Halls of Valhalla 1.07 and 1.08. NOT Compatible with Rune Classic (Steam).

### There are also renderers for some specific, non-newest, game versions:

- Rune 1.00/1.01. Offered by request. Tested with Rune 1.00.

Tactical Ops: Mikhail informs me the UT renderer sort-of works with 'Tactical Ops: Assault on Terror': the brightness is off and in-hand weapon models aren't drawn.

## Installation instructions

> Install required DirectX update: [dxwebsetup.exe](http://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe). 
> Install required VS2010 runtimes: [vcredist_x86.exe](http://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe).

1. Unzip the files for the game you're playing to that game's `System` directory. Examples of this are `C:\UnrealTournament\System` and `D:\Steam\steamapps\common\UnrealTournament\System`. You should end up with a `d3d10drv.dll` file in said System directory, and a `d3d10drv` subdirectory with various other files.
2. Start the game, go into its video options, and click the the renderer selection button. The game should restart and allow the **Direct3D 10** renderer to be picked (make sure to select "*Show all devices*").
3. That should be all; read on for more settings.

![Renderer Selection](renderpick.png)

## Settings

To change the various advanced settings the renderer offers you need to conjure up the advanced preferences dialog:

- Unreal: choose 'advanced options' in the options menu.
- Unreal Gold and Unreal Tournament: choose *Tools* -> *System Console* in the main menu bar, type `preferences` and hit enter.
- Deus Ex: while there's no menus on the screen, hit the 't' key, remove the "say" text, type `preferences` and hit enter.
- Rune: choose 'advanced options' in the 'game' options menu.

![Renderer Settings](settings.png)

The dialog shown above should pop up, browse to *Rendering* -> *Direct3D 10 support*. For most of these to take effect, the renderer needs to be restarted. Switching to full screen (and back again if desired) accomplishes this (Alt+Enter).

The renderer offers these settings:

**Alpha to coverage**
> Smoothens the edges of 'masked' textures such as grates and leaves. Unfortunately, this does lead to artifacts where the textures don't tile (example). Requires at least 4x anti aliasing enabled to take effect. Valid settings: true/false. Default: false. Note: on some hardware this setting seems to result in black backgrounds around HUD icons, etc. I suspect this is a driver issue.

**Anisotropy**
> Anisotropic filtering, makes textures look less blurry at a distance. Valid settings: 0 to 16. Default: 8.
    
**Anti aliasing**
> Greatly improves visual quality by filtering jagged lines. Valid settings: depends on video card. 1 and lower is off. 16 is the absolute maximum. If an unsupported setting is selected the renderer falls back on the next lowest supported one.

**Auto FOV**
> Automatically sets the field of view depending on the window/screen size. Might want to turn this off if you want to set an extra-wide FOV for multiplayer games. Valid settings: true/false. Default: true.

**Classic lighting**
> With this enabled, the lighting matches that of the original renderers. Otherwise, D3D10 renderers before version 18 use a more vibrant lighting scheme; after version 18 HDR is used (in which case reverting to classic lighting improves performance). Valid settings: true/false. Default: true.

**FPS limit**
> Prevents the games from running too fast even with vsync disabled, by limiting the maximum frames per second drawn. The games seem to appreciably start to speed up above ~200 FPS. Valid settings: 0 to whatever. Default: 100. Think twice before completely disabling this, as wrong timing information will be fed to the shaders (resulting in too-fast HDR for instance).

**LOD bias**
> Setting this to a negative values makes the game use larger mipmaps (textures) than it'd normally do. Theoretically improves quality but far-off textures tend to look too 'busy'. Valid settings: -10 to 10. Default: 0.

**Parallax occlusion mapping (POM)**
> Gives surfaces 3D relief. Pretty GPU intensive, and you might not like the way it looks. Will use an external height map texture if present, otherwise the detail texture is used. Valid settings: true/false. Default: false.

**Simulate multi-pass texturing**
> Greatly improves the look of various skies and alters the look of reflective surfaces and some windows. This matches the look used by early versions of Unreal running on 3Dfx hardware; later versions of that renderer seem to have switched to single-pass multitexturing. This setting can be turned off for the look most people will be used to. Valid settings: true/false. Default: true.

**Precache**
> Makes the game preload textures, which can lead to smoother gameplay. However, it does increase (un)loadtimes. Valid settings: true/false. Default: false.

**VSync**
> Synchronizes the game's frame redraws with monitor updates, reducing visual tearing. However, some people seem to experience input lag with this enabled (in other games as well). Valid settings: true/false. Default: true.

**Bump mapping**
> Can be ignored unless you've got special textures installed. Attempts to fake bump mapping if textures have normal maps present. Requires a normal map to be either present in the texture's bump map slot, or provided as an extra external texture. Valid settings: true/false. Default: false.

**Unlimited view distance**
> Sets view distance to the maximum supported map size. By request. No reason to touch this.

----

## Changelog

### Version 29 (oct 21, 2015)
- Fixed flickering textures on Nvidia cards.

### Version 28 (dec 10, 2011)
- Hopefully fixes black screen bug.
- Bugfix: Fixed too fast HDR shader with FPS limiter disabled.
- Change: Built-in renderer options such as Coronas can now be turned off.
- Bugfix: Custom polyflags now get passed to shaders instead of only being used to set state.
- Bugfix: Vertex color alpha now only gets forced to 1 when original (as opposed to custom) polyflags don't include alpha blending.
- Bugfix: Small color glitches on far-off models (centroid sampling for color) (regression from v18).

### Version 27 (july 18, 2011)
- Fixed bug reintroduced with v21 where nearby detail textured walls would get darker (big thanks to Cade).	

### Version 26 (july 9, 2011)
- Added support for polyflag overrides for custom gouraud/tile textures (thanks Dean).

### Version 25 (may 21, 2011)
- Change: Slowed HDR luminance adaptation time for less jarring transitions.
- Improvement: With HDR enabled, darkened object models to prevent them from looking too bright.

### Version 24 (may 16, 2011)
- Bugfix: Fixed purple corruption on low mipmap levels of rectangular S3TC textures. I always failed to notice this due to playing with a high amount of anisotropic filtering (thanks David).
- Bugfix: Fixed awful color banding with HDR enabled.
- Improvement: Improved dynamic range increase with HDR enabled. Originally, all lighting was just doubled. Now, it's color^1.5. Difficult to get right of all occasions, might need to tweak this in the future.

### Version 23 (november 30 2010)
- Fixed Rune v1.00 green screen.

### Version 22 (august 9 2010)
- Bugfix: Fixed world geometry glitching on translocator / gun fire. Was due to beacon or ejected shells triggering z-precision fix. Switched the (floating point) z-buffer to an inverted one to get rid of the precision issues once and for all. Thanks Martin!

### Version 21 (august 8 2010)
- Change: Set ClassicLighting to true by default so initially the games look like they're supposed to.
- Feature: Added 'SimulateMultipassTexturing' option; on by default. This simulates how multi-pass texturing, such as that of the Glide renderer, results in lightmaps of translucent surfaces being modulated with the whole scene instead of just that surface. In short, this leads to huge quality improvements for some skyboxes. Thanks Ralf!
- Feature: Added 'UnlimitedViewDistance' option as this was requested for a mod. Sets frustum depth to 65536 units. Please do not mess with this unless you've got a good reason to.
- Bugfix: Fixed character models' faces getting clipped during Deus Ex intro (was accidentally using Unreal/UT weapon projection code).
- Bugfix: Changed Unreal/UT weapon projection code from a z compensation to its own projection with closer zNear. Fixes deformed weapon models with non-default FOVs.
- Change: Removed superfluous Z_NEAR compensation from tile shader.

### Version 20 (june 21 2010)
- Change: Updated to June 2010 DirectX SDK; make sure to run the DirectX updater.
- Bugfix: Fixed broken macro textures (broken in v11 I think, thanks MaxUser6000).
- Change: Re-instated support for Unreal bumpmap texture slot (removed in v18).

### Version 19 (june 13 2010)
- Bugfix: Deus Ex security computers didn't work.
- Bugfix: Deus Ex intro way too bright (forgot to reset viewport before postprocessing).

### Version 18 (june 8 2010)
- Change: Major rewrite, all geometry paths now use their own shaders.
- Feature: Post-processing support.
- Change: Tiles are sent as a single vertex and expanded in the geometry shader.
- Feature: HDR and bloom when ClassicLighting = false.
- Change: Compiled with Visual Studio 2010.
- Bugfix: Small color glitches on far-off models (centroid sampling for color).
- Bugfix: Fixed distant terrain being incorrectly detail textured, resulting in white pixels with MSAA enabled (centroid sampling for origPos).

### Version 17 (may 29 2010)
- Bugfix: Fixed a crash with 4096x4096 textures (thanks Keith).
- Bugfix: Fixed missing decals such as most explosions. Long standing bug that I somehow had never noticed (thanks Keith).

### Version 16 (may 11 2010)
- Feature: Auto FOV scaling can be disabled in the preferences.
- Feature: Framerate limiter, can be set in the preferences. Added to prevent the game from running too fast with vsync enabled; vsync introduces mouse lag for some people.

### Version 15 (mar 4 2010)
- Improvement: Some DXGI screwery which somehow results in significantly improved framerates in specific cases.
- Change: Small change to fullscreen switching code, hopefully more reliable.

### Version 14 (feb 24 2010)
- Bugfix: Some Unreal 1 S3TC texture pack textures (seems mainly in Ancient.utx) report their size incorrectly, this resulted in flickering textures. Created a workaround to fix this. Thanks Boris.

### Version 13 (feb 21 2010)
- Improvement: Geometry shader only calculates POM normals when useful for activated texture layers.
- Feature: Improved override textures with support for alpha blending and external detail-, height- and bump maps. See website.
- Improvement: Detail texture POM has same granularity as non-POM detail texturing (only applies POM to coursest level).
- Change: Alpha to coverage default off for Deus Ex as well, too many glitches.
- Feature: 'Classic Lighting' option which is less vibrant but closely matches the original renderers (thanks Nicholas).

### Version 12 (feb 16 2010)
- Bugfix: Flash effects (underwater, red hurt haze) don't mess up alpha blending and alpha to coverage aa anymore (thanks Hermann).
- Change: Got rid of a superfluous PF_AlphaBlend check.
- Feature: Preliminary support for texture overrides. For example "Deus Ex\Textures\Unatco\Stone\Uob_Far_Wall_B.dds" will replace the stone texture in the training area.

### Version 11 (feb 7 2010)
- Improvement: Color multiplication in shader moved to each relevant pass.
- Improvement: Finer detail texture levels now don't hide courser ones, more closely matching original renderers.
- Feature: Renderer is now aware of materials' 'bumpmap' texture slots. Shader implements hackish bumpmapping as light positions aren't available. 'Bump Mapping' preferences setting added. Unless you somehow have texture packages with normal maps, this doesn't do anything. Work in progress.

### Version 10 (jan 31 2010)
- Improvement: Changed brightness to use gamma functionality which more closely matches original renderers; should help with blown out looking graphics with high brightness (thanks wIz4)
- Change: Reverted Deus Ex blendflag precedence (introduced in version 4) as this messed up the holograms in the training section. Unfortunately this in turn this does break Gary's glasses in the Area 51 holomessage, but this is also an issue with the original renderers; it's probably due to an oversight when Gary's skin was created (thanks Ben).
- Improvement: Changed brightness handling so it works with the in-game shortcut keys.
- Improvement: Overhauled detail texture support to more closely match original renderers: closer algotrithm, multiple layers, no darkening when close to a wall.
- Bugfix: Macro textures now use mipmapping.
- Bugfix: Macro textures were too dark.

### Version 9
- Change: Dropped Unreal v244 support.	
- Change: Ported from D3DX10 math to XNA math.
- Change: Tweak to device/swap chain setup.
- Change: Got rid of some shader compilation warnings with parallax occlusion mapping enabled.

### Version 8
- Change: Built with aug. 2009 DirectX SDK.
- Improvement: By request, Rune 1.00 support.
- Change: Renamed UnrealGold package to Unreal_226_Gold.
- Change: Renamed Unreal package to Unreal_224.
- Bugfix: Limited Unreal 1 variants to only being supplied to highest 16 supported resolutions (Deus Ex style) to fix glitched options menu.

### Version 7
- Improvement: Moved some dot product calculations out of a loop (small theoretical performance increase).

### Version 6
- Change: Took out multi pass rendering as this complicated things greatly, with little payoff.
- Change: Auxiliary files are now stored in the 'd3d10drv' subfolder as opposed to directly in the game's 'system' directory.
- Improvement: Alpha to coverage support to make masked textures look nicer. Takes effect if turned on and at least 4x anti aliasing is enabled. Unfortunately, alpha to coverage makes non-tiling masked textures, such as hills in skyboxes, have seams (much effort was made to prevent this, to no avail). As such, it's only turned on by default for Deus Ex, for which this issue is almost nonexistant.

### Version 5
- Bugfix: DX: Crash on systems that support < 16 resolutions.
- Bugfix: Missing 2D elements on ATI cards.
- Improvement: Automatic FOV for Unreal (Gold).
- Improvement: Anti aliasing for masked surfaces.
- Improvement: Optional parallax occlusion mapping.

### Version 4
- Bugfix: Fixed broken LOD bias setting.
- Improvement: Adjusted projection handling so flickering geometry (often far away signs, like on the DX sub base) doesn't z-fight anymore.
- Improvement: DX: Gary Savage's glasses in A51 hologram conversation don't have white areas around them anymore (DX blend flag precedence).
- Improvement: UT/DX/RUNE: Automatically sets proper field of view for selected resolution.
- Improvement: Anisotropic filtering on masked textures.
- Improvement: No anti aliasing of masked world surfaces; prevents lines in for example skybox hill billboard corners.

### Version 3a
- Bugfix: Accidentally left D3D debug layer on in v3, turned it off; should prevent not starting and/or significantly decreased performance.

### Version 3
- Feature: Made texture precaching a user-configurable setting, default off.
- Bugfix: Fixed a rare crash bug caused by invalid polygons.
- Feature: Added Rune distance fog.

### Version 2
- Bugfix: Fixed glitchy mirrors by preserving invisible objects' depth.

### Version 1
- Initial release