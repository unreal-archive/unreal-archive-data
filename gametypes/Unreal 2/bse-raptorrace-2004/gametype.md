Thankyou for downloading BSE RaptorRace 2004 for Unreal 2: XMP. We hope you enjoy playing
our mod as much as we enjoyed making it.

## Installation for play

Simply extract the contents of the archive into your U2XMP directory, the subdirectories
will be extracted to the correct locations - ensure that the 'use folder names' is
enabled in your archive software.

Alternatively, extract the archive manually and copy the contents to your U2XMP directory
manually. No ini modifications or registry settings are required so file copy works fine.

If you get stuck, the files need to be distributed as follows:

```
all .unr files  ->  XMP \Maps\ Directory
all .utx files  ->  XMP \Textures Directory
all .usx files  ->  XMP \StaticMeshes\ Directory
all .u files    ->  XMP \System\ Directory
all .int files  ->  XMP \System\ Directory
```

## Configuring and running a server

The RaptorRace mod is fully map-embedded and will run properly simply by selecting one of
the RaptorRace maps on your server. Installation is the same for servers as for clients
(see above), simply copy all of the required files and you're ready to go. However, make
sure you run your `BuildMD5.bat` file in your system folder before running the game for
the first time.

For best gameplay, we make the following recommendations:

1. Add `eq2.u` to your ServerPackages. Find the section in your `U2XMP.ini` file which
   looks something like this:

```
[Engine.GameEngine]
CacheSizeMegs=32
UseSound=True
ServerActors=IpDrv.MasterServerUplink
ServerActors=UWeb.WebServer
;ServerPackages=...
ServerPackages=eq2                     <-- add this line
```

   ensure that there is no semicolon (;) at the start of the line with eq2 on it. This
   step is absolutely vital when using the eq2Raptors mutator (see below).

2. Use the following server settings - or as near to - for best gameplay:

```
Initial Deploy Time:   30-60 seconds
Deploy Time:           8 seconds
Time Limit:            60 minutes
Team Damage:           100%
Force Balanced Teams:  off

Game Speed:            100%
Use SVehicles:         yes (May behave unpredictably if unchecked)
```

3. Use the 'energiser' mutator (see below). Although the maps are designed so that the
   included energy sources provide enough power for the race, for best results use the
   energiser mutator to fix both teams energy level at 1200. This is best for dedicated
   RaptorRace servers.

## Energiser mutator

The Energiser mutator (included) allows game admins to fix the energy levels of both
teams at 1200 and was originally designed as a practice aid so that teams could focus on
strategy without having to worry about energy.

It works in conjunction with the XMP Summoner mutator and once adminlogin has been done
adds the extra 'MUTATE' commands:

```
MUTATE [UNFIX|FIX] [BOTH|RED|BLUE]
```

For example `mutate fix red` sets (and fixes) red energy at 1200. `mutate unfix both`
resumes normal energy usage. The setting is carried across level-changes server restarts
and can happily be enabled and forgotten on RaptorRace servers.

## eq2Raptors mutator

The eq2Raptors mutator is only a bit of fun but allows any server with the RaptorRace mod
installed to use the eq2Raptors and eq2Juggernauts in normal levels.

IMPORTANT: This will not work in netplay unless `eq2.u` is added to the ServerPackages
section as described above. Clients will not be able to see the new vehicles unless this
is done.

The mutator simply replaces all Raptor and Juggernaut vehicle spawn points with the new
variety and viola - Raptors become the souped-up race versions, and the Juggernauts do
too. This makes for some excellent melee vehicle fighting but not much good for normal
gameplay.

Harbingers also get the rear-view-camera capability.
