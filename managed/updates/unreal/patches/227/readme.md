# Oldunreal's 227 Patch 

_This package was created with knowledge and permission of Epic Games._

If you like this patch you can help me to keep this project alive with a 
donation, even with very small sums you can help me to improve this patch
or to buy new hardware for testing purposes, it allows me to spend more
time for development and to pay the website.

This patch was made to offer all Unreal players a new, completely overworked
and fixed version for our old "love". Although the main target was bugfixing,
many improvements have been made and a lot of additions found their way into
this new version. The general gameplay and the game itself was not touched and
it should remain 100% compatible to old mods and maps. Also it is still
possible to join older servers with this version (as long these servers are not
using some kind of anticheat system which doesn't know 227 yet). 227 can be
still used as Server for older Clients like 224, 225 and UnrealGold (more
details can be found in the
[WIKI-FAQ](http://www.oldunreal.com/wiki/)).

New renderers like D3D8, D3D9 and a heavily improved OpenGL (all based on UTGLR
with permission) and new sounddevices like OpenAL and FMod have been added but
the "old" versions like D3D and Glide for graphics and Galaxy for sound have 
been kept.

Many security fixes have been implemented for both client and server. A new 
check was built in to detect hacks,bots and other cheats. Details about that
can be found in the 
[Oldunreal_227_Admin_Guide](http://www.oldunreal.com/wiki/index.php?title=Oldunreal_227_Admin_Guide)

A Linux port has been created supporting software rendering with SDLSoftDrv and
hardware accelerated rendering with OpenGL for graphics output. It offers
OpenAL and FMOD for sound and music. This version is completely native and
supports to run Unreal as client and as server. Although advanced options are
not available every setting can be made within the UnrealLinux.ini and Unreal 
is fully functional. There is no UED port for Linux and there is no UED port 
planned at the moment as it would require to rewrite it from scratch. It 
basically works in Wine, but is currently unusable due to some selection bug 
(a bugreport has been filed already, but it isn't fixed yet). **Due to legal 
reasons Linux users have to install the basic version and the patch with wine
but once installed the game can be started and used completely native.**

Almost all other additions are optional, don't interfere with the older 
versions and may or may not be used in future maps and mods. Thats up to the 
community. All this should ensure that the game stays like we all know it and
love it- just "fixed" and for those who want- enhanced and improved.

The current release is 227i. It's a mature release. It will be the final 
version in case no (critical) bugs are found.

The UnrealClassicPatch227 is for the Unreal versions without Return to Napali 
and the UnrealGoldPatch227 patch includes support for RTNP (UPak) and can be 
applied to Unreal Gold and Unreal Anthology.

If you want to apply the UnrealGoldPatch227 to classic version with additional
RTNP, be sure to apply the UnrealRtNPPatch first. Also you need to ensure that
the UPak maps are in the Unreal/Maps/UPak folder, otherwise it won't find the
necessary files and can't be installed.

Also be sure to visit the
[Unreal Texture](http://www.unrealtexture.com/) Homepage to get the latest high
quality texture pack for best graphics experience ever in Unreal, supporting 
the Unreal community and providing a lot of the download mirrors for the patch!

**IF YOU WANT TO TRANSFER YOUR SETTINGS TO YOUR NEW INSTALLATION YOU HAVE TO 
COPY SPECIFIC LINES MANUALLY.
DO NOT TAKE OVER OLD UNREAL.INI AND USER.INI FILES FROM PREVIOUS INSTALLATIONS.
SOME SETTINGS HAVE BEEN CHANGED AND SOME SETTINGS ARE JUST MISSING THEN, THIS 
CAN CAUSE WEIRD SIDE EFFECTS AND EVEN CRASHES!** 
