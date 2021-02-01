## Installation instructions

> Note: You need to have at least an OpenGL 3.3 capable card to use this 
> renderer!

Unzip the archive to your `UnrealTournament\System` directory, so that you have
the following files present:

```
- Unreal Tournament/
  - System/
    - glew32.dll  
    - msvcr120.dll  
    - WinDrv.dll  
    - XOpenGLDrv.dll  
    - XOpenGLDrv.int  
    - xopengl/
      - ...  
```

The `xopengl` folder has to be placed into your `UnrealTournament\System` 
folder.

Edit `UnrealTournament.ini`, and change `GameRenderDevice` in the 
`[Engine.Engine]` section to:

```
GameRenderDevice=XOpenGLDrv.XOpenGLRenderDevice
```

Add the following section at the end of `UnrealTournament.ini`:

```
[XOpenGLDrv.XOpenGLRenderDevice]
AlwaysMipmap=False
ShareLists=False
DetailTextures=True
MacroTextures=True
BumpMaps=True
DescFlags=0
Description=
Coronas=True
ShinySurfaces=True
VolumetricLighting=True
RefreshRate=60
UseSinglePass=True
UseTrilinear=True
UsePrecache=True
NoFiltering=False
LODBias=0.000000
GammaCorrectScreenshots=True
GammaOffsetScreenshots=0.700000
MaxAnisotropy=4
HighDetailActors=True
UseOpenGLDebug=False
DebugLevel=1
UseAA=True
NumAASamples=4
VSync=On
NoAATiles=True
UseBufferInvalidation=True
NoBuffering=False
GenerateMipMaps=False
OpenGLVersion=Core
```

Enjoy!

## Release Notes

### Version 1.0.0.9

- Added OpenGLVersion option, to switch between OpenGL3.3 Core and OpenGLES3.0, some (low end) graphics card rather support GL ES than 3.3 Core, also performance may differ for these. Some OpenGL extensions like UseBufferInvalidation are unavailable for ES though.
- Moved some intensive calculations into shaders (GPU) in order to reduce CPU usage quite some, this will increase overall performance especially for weaker CPU's when using XOpenGL.

### Version 1.0.0.8

- Fixed hopefully remaining fogging issues, fixed some performance issue causing very short stuttering sometimes,  fixed some memory cleanup issue. Shader cleanups, using a global include now.

Thanks to han, sharing experience and code, I was able to integrate full support for UED.

### Version 1.0.0.7

- Fixed some fogging issues in combination with PolyFlags such as Masked, Translucent, Modulated. Some shader fixes. As a first renderer ever in UT (I think?) I added support for DetailTextures on Meshes (yes, also UT uses this quite some on Meshes originated in Unreal). Added "GenerateMipmaps" option, which will replace the original mipmaps with newly by OpenGL created mipmaps in order to improve visual quality, especially in SkyBoxes. However, still testing this feature, so it's false by default. Feedback welcome.

### Version 1.0.0.6

- Fix for some drivers/graphic cards crashing on startup when trying to compile shaders with an uint error message.

### Version 1.0.0.5

- Color adjustments, Gamma adjustments, fixed Meshes always unlit, fixed some issues with fogging. Gamma won't affect desktop brightness anymore.

### Version 1.0.0.4

- fixed some problem with rendering PF_TwoSided, fixed some issue with DrawComplexSurface texturing (i.e. with DetailTextures). Some brightness adjustments

### Version 1.0.0.3

- Fixed the Z problem in "Character creation", added "NoAATiles" option, added "NoBuffering" option (for bugtesting only, severely hurts performance, but can be disabled in order to identify possible problems with it), added "UseBufferInvalidation" option (OpenGL4 capable cards only), fixed duplicate DetailTextures entry, the mirror problem and it seems the bleeding in the skybox as well. Fixed some rendering issue with PF_TwoSided causing weird color distortions. Also changed some fog setting, but needs some testing yet.

### Version 1.0.0.2

- Fixed some gamma issue, added an updated WinDrv.dll to fix the fullscreen issue, also including RawHID mouse support.

### Version 1.0.0.1

- This is the first official UT build of an entirely new and written from scratch OpenGL3 / OpenGL4 renderer. All functions currently in use are OpenGL3 yet though.

Known issues: for some reason switching fullscreen resolution fails until toggle fullscreen or restart.
