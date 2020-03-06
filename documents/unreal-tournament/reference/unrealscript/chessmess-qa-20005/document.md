## 1. How do I get multiple gametypes to appear under a new category?

Adding `Description="My Game Type"` to the end of the gametype item in the `.int` file
will create a new category for that gametype.

(Code for this is implemented in `UTMenuStartMatchCW.uc`)

Make your descriptions identical for all of your game types in your `.int`.

In summary, the description string in the `.int` file is used to specify the
category.  The `GameName` default string in the `GameInfo` derived class defines 
the game types that will be attached to the new category. 
 
 
## 2. How do I make a subclass of "Nali" follow a player?

Look at the bodyguard tutorial [at Chimeric](https://web.archive.org/web/20010408013950/http://www.planetunreal.com/chimeric/scripts/tut44.htm)
and the [NaliCiv tutorial](https://web.archive.org/web/20010408013950/http://www.planetunreal.com/chimeric/scripts/tut20.htm)

 
## 3. How do you find out what area a Pawn is in?

Each player knows what's Zone he is in. Check PRI for that PlayerZone
variable. When mappers create levels, they have to create a ZoneInfo to
describe each logical section of the map. 


## 4. Is there any way to force the creation of the root window besides manually hitting ESC?

(Code from WRI)

```
simulated function bool OpenWindow()
{
   local PlayerPawn P;
   local WindowConsole C;
   local UWindowWindow TheWindow;
        
   P = PlayerPawn(Owner);
   if (P == None)
   {
      log("#### [WRI] Attempted to open a window on something other than a PlayerPawn");
      DestroyWRI();
      return false;
   }
   C = WindowConsole(P.Player.Console);
   if (C == None)
   {
      Log("#### [WRI] Attempted to open a window on something without a Console");
      DestroyWRI();
      return false;
   }
   if (C.Root == None)
   {
       // Tell the console to create the root
           
       Log("#### [WRI] Had to create the Root");
       C.CreateRootWindow(None);
   }
   C.LaunchUWindow();
        
   UmenuRootWindow(C.Root).MenuBar.HideWindow();
   UmenuRootWindow(C.Root).StatusBar.HideWindow();
      
   TheWindow = C.Root.CreateWindow(MyWindow, WinLeft, WinTop, WinWidth, WinHeight);

   if (TheWindow == None)
   {
      Log("#### [WRI] CreateWindow Failed");
      DestroyWRI();
      return false;
   }
   TheWindow.ShowWindow();
}
```

The only really important part for you is the call to `C.CreateRootWindow(None)` when `C.Root == None`.
 
A couple of things to point out. When you call the console's `CreateRootWindow` passing in `None` for
the canvas, it sets usable defaults for the window size. These get automatically fixed up 
when the window is rendered for the 2nd time.

Your `UWindow` must make sure to realign itself in the world on each paint or else it will end up flush
in the corner.


## 5. How do I setup the Visual Studio editor for editing UnrealScript?

Here is a link to a tutorial about using Microsoft Developer Studio as an 
IDE for UnrealScript. It mostly just fleshes out Brandon "GreenMarine" Reinhart's tip 
in the [Black Magic](../the-dusty-tome-of-unrealscript-black-magic) page, 
but for those new to Dev Studio or UnrealScript programming it should be a help.
  
[Using Microsoft Developer Studio as an IDE for UnrealScript](https://web.archive.org/web/20010128231200/http://www.metahuman.org:80/NightLife/Tutorials/DevStudio.html)

Contribution added from Richard Benson:

You can add to the list of known Keywords so that they will get colored uniquely.

Create a file in `\WHEREVER YOU INSTALLED DEVSTUDIO\Common\MSDev98\Bin` called `Usertype.dat`

Place all the words that you want to be treated as keywords in that file. Here is the contents of my version ( it may be overkill )

```
exec
abstract
AUDIO
byte
default
event
expands
FILE
foreach
function
global
GROUP
guid
hideparent
IMPORT
intrinsic
latent
local
MESH
MESHMAP
name
NUM
operator
postoperator
preoperator
scriptconst
SETTEXTURE
SEQUENCE
simulated
singular
state
static
string
super
Super
TEXTURE
transient
var
defaultproperties
```

Then those keywords will show up as unique keywords in DevStudio (this does require the step that Brandon 
mentioned in the registry so that it treats `.UC` files as C/C++ files). You can set the color that these
show up as by going to Tools\Options\Format and finding the User Defined Keywords in the listbox of
available items.


## 6. How can I track information between levels?

You can take the Assault route, and write the info out to ini files. Assault does 
this so that it knows who defended in the last game, and the time they did it in, 
so that the games seem to occur in pairs. 

There's no UnrealScript method for getting access to the Entry Level, server-side,
even though one does exist, I think.


## 7. How can you prevent JumpZ from being reset to default when a player respawns?

`PlayerPawn.JumpZ` is reset in `GameInfo.AddDefaultInventory`, before it 
calls `Mutator.ModifyPlayer`. All you need to do is store a copy of the 
desired value, then reset it yourself in `Mutator.ModifyPlayer`.


## 8. How can you give a player the effect of either having a white tint to the skin, or a white glow around it?

Look at the default properties of domination control points:

```
   LightType=LT_SubtlePulse     
   LightEffect=LE_NonIncidence     
   LightBrightness=255    
   LightHue=170     
   LightSaturation=255     
   LightRadius=7in
```
 
The LightHue is changed for each domination control point depending on the controlling teams
color (red/green/blue/gold).


## 9. Which color is connected with a specific LightHue?

Here's a nice link for ya: [Introduction To Color by Jane Rock Kennedy](https://web.archive.org/web/20010430004454/http://www.webdesignclinic.com/ezine/v1i1/color/)

You remember ROY G BIV from elementary school, no?  (Red, Orange, Yellow, Green, Blue, Indigo, Violet)
These hues correspond to the `LightHue` starting at 0 and going to 255 
(and because it's a color wheel, 255 ends back at red).

`LightSaturation`, then is how much of that hue is used (black-and-white => full color -- and everything in 
between). 

And `LightBrightness` is pretty self explanatory.


## 10. How do you replace the default HUD with a custom HUD?

Normally, the `HUDType` is set in the `DefaultProperties` of a `DeathMatchPlus`
subclass. It is spawned client-side in the `PlayerPawn` class. But, its' creation 
is delayed a few seconds until the first Render call.

You could also use a `HUDMutator`. There is a much better explanation in Brandon's doc 
at the Unreal Tech page.
 

## 11. When are DECLARE_CLASS and DECLARE_FUNCTION used? Are they for classes that are never defined in a .uc file, but are still callable from UnrealScript?

`DECLARE_CLASS` and `DECLARE_FUNCTION` are needed for any native class
definition.  If the `noexport` keyword is not used in the UnrealScript class
definition, `ucc make` should generate the header for you.

Example:

In the C++ header:
```
class UMyClass : public UActor
{
	DECLARE_CLASS(UMyClass,UActor,0);
	DECLARE_FUNCTION(execNativeFunction1);
	DECLARE_FUNCTION(execNativeFunction2);
};
```

In the C++ source file:
```
IMPLEMENT_CLASS(UMyClass);
void UMyClass::execNativeFunction1(FFrame& Stack,RESULT_DECL)
{
	P_FINISH;

	GLog->Logf(TEXT("execNativeFunction1 was called."));
}

IMPLEMENT_FUNCTION(UMyClass,-1,execNativeFunction1);
void UMyClass::execNativeFunction1(FFrame& Stack,RESULT_DECL)
{
	P_FINISH;

	GLog->Logf(TEXT("execNativeFunction2 was called."));
}

IMPLEMENT_FUNCTION(UMyClass,-1,execNativeFunction1);
```

In the UnrealScript file:
```
class MyClass extends Actor
	native
	noexport;

native function NativeFunction1();
native function NativeFunction2();
```

For a tutorial on creating your own native functions, see [Native Functions by Tom "Blitz" Conder and Carlos "c0mpi1e" Cuello](https://web.archive.org/web/20010408013950/http://www.sleepwalkertc.com/members/blitz/native/native.html)


## 12. How do you add a key to switch to an external view and have it show in the Preferences menus.

This requires UT Version 413 or higher

Expand `UTExtraKeybindings` like this:

```
class MyKeyBindings extends UTExtraKeyBindings;
defaultproperties
{
     SectionName="MyMod"
     LabelList(0)="Change Player View Point"
     AliasNames(0)="behindview 1 | onrelease behindview 0"
}
```


## 13. How do you hook in to a CTF flag being grabbed event in a CTF game ?

There are no hooks, just build new flags and swap them at spawn.


## 14. Is there a way to shell to an external app. in UT ? WOT does it through an "actor.consolecommand"

No, Not in UnrealScript.

You can write a custom dll and have your script call functions within it.. the dll could launch
an external app.

For a tutorial on creating your own native functions, see [Native Functions by Tom "Blitz" Conder and Carlos "c0mpi1e" Cuello](https://web.archive.org/web/20010408013950/http://www.sleepwalkertc.com/members/blitz/native/native.html)


## 15. Is there some way my function can test whether it's running on a server or a client?

If you want definite proof of where a certain function is being processed between client and server,
add a Log statement. The log output will appear in `SERVER.LOG` of the server if it is processed there,
and will appear in `UNREALTOURNAMENT.LOG` of the client if it is processed on the client side. 

Or `UCC.LOG` if running a dedicated server from UCC. Also check `Level.NetMode`.


## 16. How do you get the precise time that a key is pressed and relay that value to the server.

Try:

```
replication
{
    if( Role<ROLE_Authority ) // send to server
        SendTime;
}

exec function MyExecFunc()
{
    SendTime( Level.TimeSeconds );
}

function SendTime( float Time )
{
    log( "Received "$Time );
}
```

Note: That `Level.TimeSeconds` is the number of seconds since the client
started Unreal.  If you want other info, you can probably get it from
LevelInfo and send that instead.

Modifying `PlayerPawns` (like adding exec functions) can be a pain for mod
authors.  You might want to try throwing this stuff into an Inventory object
and then giving that Item to the player.


## 17. Is Level replicated to the client ?

`Level` exists on both server and client. It's `Level.Game` that doesn't appear
on the client.


## 18. Where is a web page listing the Unreal Tournament command line options?

[Epic's UT Command Line and Console Commands](https://web.archive.org/web/20010405054748/http://unreal.epicgames.com/UTConsole.htm)
and 
[Unreal Tournament Command Line Options](https://web.archive.org/web/20010128225300/http://www.metahuman.org:80/NightLife/Resources/CommandLine.html)
 

## 19. Is there a difference between game time and real time in UT? e.g. if the server freezes for, say, 5 seconds, when it recovers, does game time advance 5 seconds or only some maximum, say 200 milliseconds? If so, I assume the time in LevelInfo is game time. How can I access real time?

Check out `LevelInfo`.  I believe you can access the local system clock info
by referencing the following:

```
Year;
Month;
Day;
DayOfWeek;
Hour;
Minute;
Second;
Millisecond;
```

`TimeSeconds` is scaled by `Level.TimeDilation` (which is usually 1, so it
normally doesn't come into account).

The `DeltaTime` in Ticks is clamped between 200 fps and 2.5 fps, but this
happens after `TimeSeconds` is updated, so you shouldn't have to worry about
that.

So yes, `TimeSeconds` should be pretty darn close to the actual physical time
that Unreal has been running on your system.


## 20. How can I get a Nali to jump off of ledges while following a player? The Nali just stops at the ledge when it encounters one.

In `ScriptedPawn`, `MayFall()` is called by the engine physics if the pawn is walking and 
`bCanJump` is true and is about to go off a ledge. The pawn has the opportunity (by setting 
`bCanJump` to false) to avoid the fall.

```
  function MayFall()
  {
     bCanJump = true;
  }
```


## 21. What are the parameters for the spawn function?

It's declared in `Actor`.
``` 
native(278) final function actor Spawn
(
 class      SpawnClass,
 optional actor   SpawnOwner,
 optional name     SpawnTag,
 optional vector   SpawnLocation,
 optional rotator  SpawnRotation
);
```


## 22. How can code in Bots access functions in GameReplicationInfo since it is only available through a PlayerPawn and GameInfo?

Well, bots code is only run on the server. No logic is done client side. 
So, if you are playing with bot code, the bots have access to `Level.Game`.

```
Level.Game.GameReplicationInfo.YourFunction();
```


## 23. How do you get the maximum number of teams in a game from mutator code?

```
if(TeamGamePlus(Level.Game) != none)
   MyVar = TeamGamePlus(Level.Game).MaxTeams; 
else
   MyVar = 1;
```


## 24.What is the largest number that an int type variable can hold in UnrealScript?

Unreal uses 32 bit signed integers so the largest representable number would
be 2^31 - 1 or 2,147,483,647.


## 25. Where can I find more information on Replication other than [Unreal Network Architecture](https://web.archive.org/web/20010405051236/http://unreal.epicgames.com/Network.htm)?

[Mod Authoring for Unreal Tournament](../mod-authoring-for-unreal-tournament), the "Decrypting Replication" section.
and
[Replication De-Obfuscation](https://web.archive.org/web/20010624122531/http://www.planetunreal.com/pipeline/tutorials/replication.html)


# 26. How do you access the HUD colour the player is using?

To access the HUD color from within a mutator, do the following:
```
simulated event PostRender( canvas Canvas ) 
{
    HUDColor = ChallengeHUD(Canvas.Viewport.Actor.myHUD).FavoriteHUDColor;
    /*do drawing here*/
}
```
 
## 27. Is there any way to reference the EntryLevel with out a playerpawn, so that server side persistent object can be spawned?

I think not, because `GetEntryLevel` is a native function that is defined 
in `PlayerPawn`, so you'll have to do it with a `PlayerPawn`.

## 28a. Does the "Weapon Poly Triangle" exist on the Player model or the Weapon model?
## 28b. Is the weapon model aligned with the (0,0,0) coordinate of the weapon triangle?

a. The Weapon Triangle is on the player model. The "weapon attachment point" on the 
   player model is simply a way to let UT know where to "graft" the weapon model 
   onto the player model mesh. Simply place a triangle flagged as a weapon triangle 
   so that the weapon syncs up with the Player Model during animation.

b. Yes, Leave the origin for the weapons somewhere close to (0,0,0) like
   (-4.00, -2.2, 2). Next, type Edit Actor (package.classname of weapon).
   Under Inventory section, you can align your weapon there {the offset vector is there} right
   down to the numbers and watch it sync up in realtime. UT takes
   something like -1.51 and multiplies it times 100 or something so the numbers
   differ a little. But, you can approximate what the #s are in UnrealScript.
   Go back to your weapon script and type in what the #s should be in it's
   default properties.(PlayerViewOffset)


## 29. Is there any way to read a file from the local hard drive in UnrealScript?

No, There is just `GetNextIntDesc()` for getting `.int` files.

The only other option is to write a dll. If you haven't already seen it,
[here is a tutorial c0mp wrote](https://web.archive.org/web/20010408013950/http://www.sleepwalkertc.com/members/blitz/native/native.html)
on building one.


# 30. How can you change the LightBrightness, LightHue and LightType of all players so that it is only visible by one player that has a particular inventory item, like night vision goggles?

You can't do selective lighting effects, but you can make an actor visible
only to its owner. Just set: the default variable `bOnlyOwnerSee` to true.
This is the approach that other night vision effects take. Have
the goggles spawn a red shield belt like effect around all players and make
the owner of the effect the player wearing the goggles. Note you will have
to do this for each person wearing goggles - could get nasty if you have a
lot of players with goggles.


# 31. How do you use list boxes (UWindowListBox) in UWindows?

The listbox has two parts - the class for the list
box itself, and the item class. Items are added via
AddItem() in the listbox class.

UWindow receives two messages before it paints a Pre and a Paint. 
During the Pre function, that's when you want to reset the size 
and position of the listboxes.


## 32. Where in a HUD mutator should code that searches the map for certain objects be placed?

`PostBeginPlay()`, just in case the `HUDMutator` is automatically being used when the game starts.


## 33. What are the benefits/tradeoffs of deriving from PlayerPawn or children as apposed to deriving from Inventory to make small changes to players?

A disadvantage of deriving from PlayerPawn is that it can't be used with existing classes or future classes not 
derived from it. You have to change the player classes to yours, and so new custom classes can't be used and UT
has no multiple inheritance.

Avoid sub-classing the `PlayerPawn` and `Bot` if you can at all, especially for small changes. Use a mutator
command that can be bound or inventory objects to add small functionality to the game for a player.
 
When you sub-class the `PlayerPawn` or `Bot`, you lose, without significant coding, the ability of your mod to
support new custom UT player models such as 666 Marine, 666 Rumiko, conversions from Q2, etc. Also, like anything
else, the more you override base functionality the more you have to check, at each version, to make sure your
modification is compatible. 

If you are going to sub-class the `PlayerPawn`, actually you want to sub-class the `TournamentPlayer` class
instead, you are going to have to create about 11 additional classes which is not a trivial thing. The same applies
to the `Bot` class, although there are many other reasons that you may need to sub-class the `Bot` class than the
`PlayerPawn` class.

One of the big advantages to using an Inventory item is the fact that they support `exec` functions which can be
bound to keys to toggle the functionality of your "mutator" on and off.


## 34. Is the Unreal Engine multithreaded and can you uses concepts like mutex and synchronization?

No, Concepts like mutex and synchronization just do not apply to UnrealScript.
During a scripted tick, actors can perform a certain job without interruption.
So, you will always have a valid thread of execution.  Time-based code
is usually handled in a state. You can make latent function calls there like
`SetTimer(float delta, bool bLoop)`. After delta expires, `Timer()` gets called.

Example:
```
auto state WaitForEvent
{
	event Timer()
	{
		//Do stuff here....
	}

Begin:
SetTimer(2.000, true);
}
```

Outside of a state, you can use the `Tick()` function.

 
## 35. Where in the WoT code is the music executed from?

```
 if( !PopupMissionObjectives() && Level.MP3Filename != "" )
 {
    ConsoleCommand( "MP3 START "$ Level.MP3Filename );
 }
```

It's in `WOTPlayer.uc` in the `WaitToShowMissionObjectives` state. 
There's an `MP3Filename` string in `LevelInfo.uc`.

Music is shut off for cutscenes when a player touches a
`CutsceneTeleporter`.

So, it looks like you're looking for:

```
ConsoleCommand( "MP3 START "$ Level.MP3Filename );
```

and

```
ConsoleCommand( "MP3 STOP" );
```

Doing a search through all the `.uc` files for "mp3" or ".mp3" should 
provide more info.


## 36. Why does giving a gun to all bots with GiveWeapon(PlayerPawn, "SF.DesertEagle"); work on some maps and not on others?

This is probably the result of spawning the weapon in a wall.  Check the
levels where it doesn't work, and see if the point at 0,0,0 is solid.


## 37. If I spawn an actor that extends NavigationPoint (ControlPoint) at a random path node then tell the bots to find it (via FindPathTowards) they just roam around. But, If I spawn an actor that extends decoration at a random path node then tell the bots to find it they do so without a problem.

My guess is that the bots assume that there are paths between 
navigation points (created by the mapper), but there aren't any paths 
leading to your freshly spawned ControlPoint. 
So that's why the bots are acting like morons.


## 38. Why does touch() function of an object that was derived from ControlPoints no longer get called since upgrading to 420?

Call `SetCollision()` on it to make sure that it collides with players immediately after spawning it.

```
local DominatorPoint D;
D = spawn(class'DominatorPoint',....);
D.SetCollision(true, false, false);
```


## 39. Is there any way of using SpawnNotify's with ONLY the class that you specify, and not any subclasses?

Checking the Class type when the `SpawnNotify` is fired. `A.IsA('MyModPlayerReplicationInfo')`, 
to check for the type and if it already exists don't spawn a new object.

```
class MyModPRISpawnNotify expands SpawnNotify;

simulated event Actor SpawnNotification(Actor A)
{
  local actor aOwner;
  local MyModPlayerReplicationInfo MyModPRI;

  if (A.IsA('UMSPlayerReplicationInfo') || A.IsA('UMSBotReplicationInfo'))
    return A;

  aOwner = A.Owner;
  A.Destroy();

  if (A.IsA('PlayerReplicationInfo'))
     MyModPRI = Spawn(class'UMSPlayerReplicationInfo', aOwner);
  else if (A.IsA('BotReplicationInfo'))
      MyModPRI = Spawn(class'UMSBotReplicationInfo', aOwner);
  else
      MyModPRI = None;

  return MyModPRI;
}

defaultproperties
{
     ActorClass=Class'Engine.PlayerReplicationInfo'
}
```

Just a warning: Spawnnotifies occationally cause random crashes.


## 40. How can you get a new game type to show both DM and DOM type maps?

Change the `MapPrefix` default in your gametype to "D".
Since they both start with "D" it works. 


## 41. Why doesn't "Export All" button in the Class Browser in UEd2 work?

Apparently this is a bug as I've had this too.  Instead, bring up any
script, doesn't really matter, and then do an "Export All" from the script
and it will export everything.


## 42. How do I change the Velocity of a projectile in a touch function?

If you want to change the `Velocity` of a `Projectile` in a `Touch` function you
need to set `bJustTeleported` to True (otherwise the Physics code will reset
your Projectile's Velocity back to what it originally was).

Of course `bJustTeleported` is const, so you'll need to use `SetLocation` to set
it for you.

Example:
```
event Touch( Actor Other )
{
    Other.Velocity = -Other.Velocity;
    Other.SetLocation( Other.Location );
}
```

In `physProjectile` (C++ engine physics code) this code here is executed
*after* your Touch notifications, thus spamming any changes you may have
made to the projectile's velocity.

```
if (!bBounce && !bJustTeleported)
  Velocity = (Location - OldLocation) / deltaTime;
```

In your case, you may have `bBounce` set to True (which will also disable this
code).



## 43. How does bIsWalking affect Player movement?

`bIsWalking` is used in the walking physics code in determining maximum movement speed 
(when true, max speed is capped at 30% of groundspeed).
 
`bIsWalking` is set true if `bDuck != 0` (e.g. crouching) in `HandleWalking()` in `PlayerPawn`.
