# Unreal Version 226 Final 

This is the final Unreal 1 patch. It is based on the earlier 226 patch and 
includes the latest Direct3D and sound code from Unreal Tournament. Please
read the Release Notes for more information about this patch. This patch 
is network-game compatible with existing patch versions Unreal 224, 225 and 226. 
Servers do not need to upgrade, as this patch contains mainly client 
improvements.

### Installation Notes

To install, download the patch and run it. It will ask you for the location of
your Unreal installation. Check the location it provides and press Next. The 
patcher will then ask you to insert your Unreal CD into your CD-ROM drive so
it can refer to some of the original files shipped with Unreal. Confirm your 
CD-ROM drive letter and press Next. When the patch is installed you may launch
Unreal as usual. You will need to reconfigure your display settings and 
controls.

---

## Release Notes

### Direct3D Render Device
- Updated to the same Direct3D code as in Unreal Tournament version 420.

### Sound
- Updated to the same sound code as in Unreal Tournament version 420.

### Networking
- Improved dedicated server performance.
- Fixed packet id wraparound error causing client-side weapons to disappear.
- Fixed packet size overrun causing packets to be lost.
- New DISCONNECT and RECONNECT console commands.
- New server -profilestats command line option for performance monitoring.

### Editor Issues
- People having trouble starting UnrealEd (runtime errors or other trouble) should get this fix from the web: UnrealEdFix4.exe.

## End
