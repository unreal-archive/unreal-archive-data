## Installation instructions

Go to your `UnrealTournament\System` directory. Make a backup of your old `OpenGLDrv.dll` (Windows) or `OpenGLDrv.so` (Linux) in case the new one doesn't work. Then put the new `OpenGLDrv.dll` or `OpenGLDrv.so` in your `UnrealTournament\System` directory. This one contains a number of optimizations that should improve performance over the base UT 436 OpenGL renderer. It also contains a number of new options, which are described further down on this page.

----

## Release Notes

### Changes in version 3.7:

- Fixed a bug with `ShareLists` enabled and the editor that could cause crashes.
- Editor selection no longer uses OpenGL API selection support. This avoids problems with OpenGL drivers with bugs or missing support in this area.
- A couple 227 editor related updates that were also general renderer code fixes.
- The `SmoothMaskedTextures` option will use alpha to coverage if AA is enabled with 4 or more samples.
- Removed support for using vertex programs without fragment programs. The UseFragmentProgram setting controls both of these and the UseVertexProgram setting is gone.
- Removed compiled vertex array support and the UseCVA option.
- Removed the `UseTNT` option.
- No longer using `sstream` for internal debug functionality.
- A few other mostly minor changes.

### Changes in version 3.6:

- `NoMaskedS3TC` option removed. Always uses RGBA DXT1. This matches the only option for DXT1 in D3D.
- `GL_NV_multisample_filter_hint` extension support removed. Don't consider this one very useful anymore.
- A few 227 editor related updates that were general renderer code fixes.
- `MaxLogUOverV` and `MaxLogVOverU` config settings removed. These are set internally now.
- Larger default maximum allowed texture size in the not using S3TC config case.
- Potential NVIDIA driver bug workaround for the major graphics corruption after windowed / full screen switch issue. Suspect this may be fixed in newer drivers now, but was easy to add.
- `RequestHighResolutionZ` option removed. Modified code to attempt to get a 32-bit, 24-bit, or 16-bit z-buffer in that order.
- If first mipmap pointer set to NULL in SetTexture(), skip looking at others.
- `AutoGenerateMipmaps` and `AlwaysMipmap` options removed.
- `UseDetailAlpha` option removed and always enabled internally. A number of detail texture rendering paths depend on having this one enabled.
- `BufferClippedActorTris` option removed and functionality it controlled always enabled internally.
- A few other minor changes.

`ZRangeHack` will be enabled by default for UT if not already present in the ini file, but this one may still need to be watched a little more closely. There are a couple cases I know of where it has minor side effects. However, with most video cards these days only supporting 24-bit but not 32-bit z-buffers, or unless modified other parts of the game engine to draw decals a little further away, it is needed to avoid decal flickering in the distance in many common cases.

----

## Settings

This sectionn contains descriptions for a number of Unreal Tournament OpenGL Renderer settings. Some of these settings are present in the base renderer from Epic. Many are only present in newer versions of the enhanced renderer.

For a standard UT install, these settings go in the `[OpenGLDrv.OpenGLRenderDevice]` section of the `UnrealTournament.ini` file. With some version of the renderer, it is also possible to access these settings through the Advanced Options window. This window can be accessed by entering the preferences command from the console or by selecting Advanced Options from the Options menu. The OpenGL renderer settings are in the Rendering\OpenGL Support section.

Note that changing settings from the Advanced Options window may cause unexpected behavior while the game is running. Due to how parts of the engine are designed, it is somewhat difficult to fix this and still have the options show up in the Advanced Options window. While many options can be changed here without causing a crash, if any problems are observed, it may be best to change certain options with just the default wallpaper on the screen. A large number of settings that can be changed through the Advanced Options window may not take effect immediately or completely until either UT is restarted or the resolution is changed. So, after changing any settings here, always be prepared to restart UT.

### UseTrilinear - [True/False]
Controls the use of trilinear texture filtering.

### NoFiltering - [True/False]
Can disable filtering on all textures. Useful as a debug option.

### MaxAnisotropy - [Integer]
Controls the use and level of anisotropic texture filtering. Disabled if set to 0. Should make no difference if set to 1 (isotropic texture filtering). If set to greater than 1, specifies the maximum degree of anisotropy to use for texture filtering.

### UseS3TC - [True/False]
Enables the use of high resolution S3TC compressed textures if they are installed.

### Use16BitTextures - [True/False]
Selects lower quality and more compact formats for a number of textures, which will often speed things up. In many cases, there is only minor quality loss. In other cases, like with various skyboxes and coronas, there is often major quality loss.

### UseBGRATextures - [True/False]
Allows textures to be uploaded in BGRA format rather than RGBA format if the GL_EXT_bgra extension is supported. This can improve texture upload performance. This option should always be enabled unless it causes problems.

### LODBias - [Floating point]
Allows mipmap selection bias to be adjusted. Use negative values to pseudo sharpen textures. Use positive values to blur textures and potentially improve performance at the expense of blurry textures.

### UseTNT - [True/False]
A workaround for buggy TNT/TNT2 drivers. Alters texture scaling and mipmap generation behavior. If you really want to know all the details, check the source code.

### TexDXT1ToDXT3 - [True/False]
A workaround for poor image quality on NVIDIA GeForce1 - GeForce4 series hardware when using DXT1 format S3TC compressed textures. If enabled, converts all DXT1 textures to DXT3 textures on upload. This improves image quality on the previously mentioned NVIDIA hardware at the expense of twice as much texture memory usage for these textures. The NVIDIA DXT1 image quality problems or most noticeable on certain skybox textures. Keep this in mind when deciding whether or not to trade image quality for speed here. This option should not be enabled on any hardware that draws DXT1 textures with the same quality as DXT3 textures of course.

### UseMultiTexture - [True/False]
Controls the use of multitexturing. Should always be enabled as the renderer has a few glitches when it is not. I might try to track these down some day.

### UsePrecache - [True/False]
Controls texture precaching. Texture precaching may improve performance by initializing internal data structures for a number of world textures and most likely getting them loaded into video memory at level load time. It will also slow level loading down some.

### MaxTMUnits - [Integer]
Used to limit the number of texture units used by the renderer. Useful as a debug option. Disabled if set to 0.

### UsePalette - [True/False]
Controls the use of paletted textures. If there is hardware support for paletted textures, using them can significantly improve performance.

### UseAlphaPalette - [True/False]
A workaround for very old buggy GeForce drivers. If set to False, will not upload masked textures as paletted. If there is hardware support for paletted textures, this option should be set to True unless it causes any problems.

### MaskedTextureHack - [True/False]
Enabling this option can prevent rendering problems with masked textures when the same texture is applied to different polygons that do not have the masked attribute set consistently across all of them. Likely examples of masked texture problems are rendering errors with solid colored boxes around railings and trees that can often times be fixed with the flush command. There is some risk to using this option, which is why it's called a hack option. It's likely to be very safe, but not completely safe. Implementing it the completely safe way is a lot of extra work, so it uses the simple solution. If it does happen to fail, there will be some completely incorrect textures on some objects.

### GammaOffset - [Floating point]
Offset for gamma correction. Can be used to adjust gamma correction even more if you hit the end of the Brightness slider in Video options. The default value of 0.0 causes no change. Use negative values for darker or positive values for brighter. If adjusting this setting for the first time, I'd recommend starting with small values such as -0.3 or 0.3.

### GammaCorrectScreenshots - [True/False]
If enabled, will apply gamma correction to screen shots.

### GammaOffsetRed - [Floating point]
### GammaOffsetGreen - [Floating point]
### GammaOffsetBlue - [Floating point]
Fine tuning parameters for gamma correction. These allow different offsets to be specified for each color channel. These offsets are never applied when gamma correcting screen shots, even if GammaCorrectScreenshots is enabled.

### OneXBlending - [True/False]
If enabled, matches what the D3D renderer does for blending in multitexture mode when applying lightmaps to world geometry. I can't say for sure which way is correct. In single texture mode, the D3D renderer does appear to do blending like the OpenGL renderer in single texture mode or multitexture mode without OneXBlending enabled.

### RefreshRate - [Integer]
Can be used to request a specific refresh rate when running full screen. If set to 0, a default refresh rate is used. If this value is set to an invalid or unsupported refresh rate based on video card or monitor capabilities, the renderer will fail to initialize.

### SwapInterval - [Integer]
Controls V Sync. If set to the default value of -1, the default buffer swapping method is used. Set to 0 to disable V Sync. Set to 1 to enable V Sync. Set to higher values for one frame every N screen refreshes. Not all video drivers support values higher than 1.

### FrameRateLimit - [Integer]
CPU controlled frame rate limiter in frames per second. Set to 0 to disable.

### UseAA - [True/False]
Enables multisample antialiasing. For the OpenGL renderer, requires the GL_ARB_multisample extension.

### NumAASamples - [Integer]
Specifies the number of samples to use per fragment for antialiasing. 2 and 4 are common values that should work on many video cards.

### NoAATiles - [True/False]
Enable this option to disable antialiasing when drawing tiles as seen from the lower half renderer perspective. This should eliminate HUD corruption that can occur when antialiasing is enabled. Some video hardware / drivers do not support the functionality required to enable this option. Note that corruption with antialiasing enabled can still occur on the logo background if using Entry.unr on startup (it's not made of tiles from the renderer perspective).

### UseZTrick - [True/False]
Can avoid some z-buffer clears at the expense of cutting z-buffer precision in half. This may improve performance on some video cards. On video cards with z-buffer optimization hardware, enabling this setting may significantly reduce performance as it interferes with some hardware z-buffer optimization implementations.

### ZRangeHack - [True/False]
An experimental option that can make the z-buffer work better for far away objects. Might cause unexpected problems, but doesn't seem to break anything major so far. Will fix problems with decals flickering in the distance with 24-bit z-buffers, which is the most you can get on many video cards. Will also fix the issue with the Redeemer covering up part of the HUD. Partially breaks weapon rendering on the first person view one if using wireframe debug mode (will clip near parts of it). Doesn't help enough to make 16-bit z-buffers work correctly.

### MinLogTextureSize - [Integer]
Set to 0.

### MaxLogTextureSize - [Integer]
Set to 8, or 0.

### UseCVA - [True/False]
Enables the use of the compiled vertex array (CVA) extension. It may be useful on video cards without HW T&L. It is likely to slow things down a little bit on video cards with HW T&L.

### UseMultidrawArrays - [True/False]
Enables the use of the GL_EXT_multi_draw_arrays extension.

### BufferTileQuads - [True/False]
Enables buffering in the DrawTile path. May improve text rendering performance.

### UseSSE - [True/False]
Controls the use of SSE instructions. Set to True to auto detect CPU and OS support for SSE instructions and use them if supported. Set to False to disable the use of SSE instructions.

### UseVertexProgram - [True/False]
Enables vertex program mode. Consider this an experimental option. It can improve performance in some cases. It can also slow things down a lot if certain other settings are not configured correctly. It is likely to slow things down a lot if detail textures are enabled, but single pass detail texture mode is not enabled. It may not work correctly or may cause crashes with some video drivers.

### UseFragmentProgram - [True/False]
Enables fragment program mode. Requires the UseVertexProgram option to also be enabled. May improve performance on newer video hardware. It's generally best to enable or disable UseVertexProgram and UseFragmentProgram together. In a later version of the D3D9 renderer, the UseVertexProgram option is not present and UseFragmentProgram will enable use of both vertex shaders and pixel shaders together if shader model 3 support is available.

### UseTexIdPool - [True/False]
Should be set to True.

### UseTexPool - [True/False]
Should be set to True.

### DynamicTexIdRecycleLevel - [Integer]
Should be set to the default value of 100.

### DetailTextures - [True/False]
Enables detail textures.

### DetailClipping - [True/False]
Enables the use of a somewhat experimental detail texture mode. It costs more CPU time, but may improve performance in fill rate limited situations.

### DetailMax - [Integer]
Set to 2 to enable a second detail texture layer. Set to 0 or 1 for standard one layer detail texturing if detail textures are enabled. The second detail texture layer will not show up unless SinglePassDetail is disabled.

### SinglePassDetail - [True/False]
Enables single pass detail texture mode. This should generally be the highest performance detail texture mode. It requires 4 texture units. It also requires the UseDetailAlpha option to be enabled.

### SinglePassFog - [True/False]
Enables single pass fog mode. This should generally be the highest performance fog mode. It requires 3 texture units. For the OpenGL renderer, it also requires support for either the GL_ATI_texture_env_combine3 extension or the GL_NV_texture_env_combine4 extension.

### ColorizeDetailTextures - [True/False]
Debug option for detail textures. If enabled, adds a green tint to detail textures.
