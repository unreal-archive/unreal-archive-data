## 1. How can you change a string into a class? So a user can input a string and have it load that HUD or sound effect or song or whatever?? (DynamicLoadObject)

Changing a string into a class variable: 

This is good for loading textures, music, sound effects and things like that.  It is not good for spawning classes.

```   
function SetSkin(string SkinName, pawn TargetPawn)
{
   TargetPawn.Skin = Texture(DynamicLoadObject(SkinName, class'Texture'));
}  

function SetSound(string SoundName, out sound MySound) 
{
  MySound = Sound(DynamicLoadObject(Command, class'Sound'));
}
```

Spawning a class based on a string:

This is good for creating an instance of a class using a string.

```
function SpawnSomething(string Word, class<actor> SpawnClass)
{
  SpawnClass = class<actor>(DynamicLoadObject(Word, class'Class');
   spawn(SpawnClass);
}

function SpawnHUD(string Name, out HUD myHUD)
{
  local class<HUD> NewHUDType;
  NewHUDType = class<HUD>(DynamicLoadObject(Name,   class'Class'));
  myHUD = spawn(M.HUDType);
}
```

## 2. A question about attached objects rotation and UnrealEd:

Attached objects cannot 'react' on all possible movements/rotations that the 'leader' executes. Normally the yaw axis is the only thing 
that works, no pitch or roll. In UEd all is working fine. To check this out, simply select more than one object in UEd and rotate them. 
All virtual distances are used and it is working 100% ok! But in the game itself it isn't working at all......
 
I’m attaching an Object to a Mover. So, why can UEd execute these correctly and the game itself not???

Well to attach an Actor to a Mover, you can set the Actor's physics to PHYS_Trailer, and then set the Actor's Owner to be the Mover. 
Use `bTrailerPrePivot`, `PrePivot` and `bTrailerSameRotation` (of the Actor) to set its relation to the mover (it's Owner).

## 3. What spawn notifications does an object get when it’s created?

When an object is created it gets several spawn notifications in the following order:

- (default vars set including config vars)
- Spawned
- PreBeginPlay
- BeginPlay
- (then the actor is zoned)
- PostBeginPlay
- (then the actor is checked for encroachment -- collision)
- SetInitialState

Then after all that (and not before), all the variables that were replicated along with the actor spawn notification are set.

Then, and this is new to UT 402 patch, PostNetBeginPlay is called.

## 4. Is there any way to extract a name from a string.  You see, animation sequences don't have their own class, they are just names.  So can you somehow, someway change a string into a name?

Use a switch

```
Switch (aString)
{
  case "firstAnimation": return firstAnimation;
  case "secondAnimation": return secondAnimation;
  case "thirdAnimation": return thirdAnimation;
  case "andSoOn": return andSoOn;
}
```

## 5. What function is used to display the messages in the message field i.e. death messages, messages about peeps joining the game, chat messages and so forth. Because I'm looking for a function to display text in that field in different colors, can this be done with the function used to display death messages etc?

There are several functions in Tournament Player that write to that chat box (`ClientVoiceMessage`, `SendTeamMessage`, `SendGlobalMessage`).

If you want to be able to do a lot with text use the `DrawText` function. You have to use in on the canvas, so it can only be called in 
pre and post render function, but you can put text anywhere, any size, in any color.

For text messages in different font sizes, any position, color, fading you can use some built in classes (just subclass them) you
don't have to paint the text yourself...

Some functions you can use:

- LocalMessagePlus
- CriticalEventLowPlus

The best one is `LocalMessagePlus`, you can setup anything you like...

To 'call' them just use:

```
BroadcastLocalizedMessage(class'MyMessage', 0, PlayerPawn(PawnLink).PlayerReplicationInfo);
```

The classes are only able to return default variables, so you can do a little trick for changing the message in the game, i.e.:

```
class'MyMessage'.default.MyText = "Hello";
class'MyMessage'.SaveConfig();
class'MyMessage'.static.StaticSaveConfig();
```

just setup: `var config localized string MyText;` inside your `MessageClass`.

## 6. I have a new gametype and I want to ensure a mutator is loaded. How can I do that?

One method is to override the `InitGame()` event. The `InitGame()` event loads the mutators that the user selected in game setup. 
Also there is a single mutator that is always loaded, even if none is selected by the player. Its called `BaseMutator` and you can find 
it in the `GameInfo` class. UT creates `BaseMutator` based on the value that is assigned to `MutatorClass` in the `defaultvariables`
section of `GameInfo`. With this in mind we can, in our new gametype class, override the `InitGame` function and do an `AddMutator`
call on the `BaseMutator` to the mutator we designate loaded.

Here is the code:

```
event InitGame( string Options, out string Error )
{
  local Mutator M;
  local bool bFoundMut;

  Super.InitGame(Options, Error);

  // search through mutators to ensure the one we want isn’t already defined
  bFoundMut = False;
  for (M = BaseMutator; M != None; M = M.NextMutator)
  {
    if (M.class == class'MyMutator.Mutator')
    {
      bFoundMut = True;
      break;
    }
  }

  // If ours isn’t already defined then add it to the list
  if (!bFoundMut)
    BaseMutator.AddMutator(Spawn(class'MyMutator.Mutator'));
}
```

Alternatively if there is just a single mutator you want loaded you can set the `MutatorClass` variable of your gametype to that mutator. 
Be aware that by default `DeathMatchPlus` uses a mutator called `DMMutator` that ensure compatibility with unreal weapons and items. 
So your mutator will probably want to extend this mutator.

## 7. How/where are the weapon models are placed onto the player meshes?  I know you can give pawns a weapon under their weapon variable, and they will be carrying it.  But where does this happen?  Which code puts them together? 

The actual code is inside of the game engine.  It finds a special polygon flagged as a "weapon poly."  UT doesn't support generic 
attach points right now (405b), only a single weapon attach point.  So when someone makes a model, they create a weapon poly and 
flag it as such. The mesh renderer looks at the Pawn's Weapon variable to know what mesh to draw at the weapon triangle location.

## 8. Some information about how the game initializes itself prior to the player starting the game.

There are two cycles when the game is initializing, an early and a later time, the gametype will be created earlier than the 
other actors. First the game loads the essential base of the level (gametype, architecture, etc.) and afterwards it spawns
the regular actors.

## 9. When is a mutator’s BeginPlay() function called?

A Mutator's `BeginPlay()` functions get called twice, the first time is the early phase, the second time the late one. 
Gametype, level information, architecture kinds of things are loaded in the early phase and then the spawning of the regular
actor class objects is done in the later phase.

## 10. When you make a .umod file make sure you backup your manifest.ini file.

What happens is that UCC creates a new file called "`Manifest.ini`" which is the same file name used by the install list and 
thus it overwrites the original INI file. You can avoid this by backing up "`Manifest.ini`" before you generate the UMOD from 
the command line, then copying it back when it's done.

## 11. How do you use the addini command that was added with the 405b patch?

Using the `AddIni` command (405b patch) in the `mypackage.ini` file (used to create the umod with ‘`ucc master`’) works like this:


```
[INIGroup]
AddIni=UnrealTournament.ini,Engine.GameEngine.ServerPackages=MyPackageName
```

If you haven't made a umod using the `ucc master` command, take a look at the MOD Installer Notes in the Old News Archives
(link found at the bottom of the Unreal Tech Page).

## 12. Can I see and example .ini file you’d use when using the ucc master command?

This is from `EavyDarkmatchIIMOD.ini` file:

```
[Setup]
Product=EavyDarkmatchII
Version=200
Archive=EavyDarkmatchII.umod
SrcPath=.
MasterPath=..
Requires=UnrealTournament400Requirement
Group=SetupGroup
Group=INIGroup
Group=EavyDarkmatchIIGroup

[UnrealTournament400Requirement]
Product=UnrealTournament
Version=400
<br>[SetupGroup]<br>Copy=(Src=System\Manifest.*,Flags=3)

[INIGroup]
AddIni=UnrealTournament.ini,Engine.GameEngine.ServerPackages=EavyDarkmatchII

[EavyDarkmatchIIGroup]
File=(Src="Help\EavyDarkmatchII.txt")
File=(Src="Help\EavyLogo.bmp")
File=(Src="System\EavyDarkmatchII.int")
File=(Src="System\EavyDarkmatchII.u")
```

The building command line is: `ucc master EavyDarkmatchIIMOD`

## 13. UCC doesn’t catch this error during compile time.

If you setup a string inside your `defaultproperties` as follows:

```
MyString=class'MyClasses.MyClass'
```

UCC compiles WITHOUT any error or warning messages. I found that, because I changed some classes into strings for replacing 
and not spawning them. Normally the string should be defined as follows:

```
MyString="MyClasses.MyClass"
```

## 14. Minor parser error with back to back while loops in unrealscript.

```
while ()
 blah;

while ()
 blah;
```

Will result in a compile error, even though its syntactically legal.  You'll have to add brackets {} sometimes:

```
while ()
{
  blah;
}

while ()
 blah;
```

Will cause an error also. So to avoid any problems always use the brackets.

## 15. I want to export and look at the code of the mods that other users have created. How do I do that?

Each mutator has a `.u` file. These files are listed in your UT\system subdirectory. The names are often very similar
to the mutator .UMOD or ZIP file you used to install them. Now, to export the `.uc` files (the scripts itself) you have 
to add some lines in your `Unreal.ini` file in the UT\system directory NOT the `UnrealTournament.ini`, cause UnrealEd
uses the 'old' `Unreal.ini` file.

In the `Unreal.ini` you'll find some entries called `EditPackages=...` Just insert a line called `EditPackages=TheMutatorPackage` 
(without `.u`) below the existing entries. Save the ini file and open up UnrealEd. Now the package will be automatically 
loaded on startup of UEd, and it is exportable. After UEd has loaded, simply click on the Export All button in the classes window.

That will take some time... After UEd has finished exporting the stuff you'll find some new directories under UT. 
One of them should be called like `TheMutatorPackage`'s name. There you will find the classes subdirectory, which includes ALL 
used scripts of this package. Sure, you don't need to export all of the mutators, cause the bigger part of 
them just uses one or two scripts, that can be found 'by hand' in UEd, but for the bigger ones this method 
gives you a quick overview on the used classes.

SHORTCUT: Just load UnrealEd, switch to classes, hit Import, select the `.u` file then do an export all. It will put the 
code in a separate directory as stated above. The advantage with the above method is that it will always make the mod script
available to UnrealEd and thus you don't have to always import the `.u` file if you want to view it in UnrealEd.
 
Note, once exported the `.uc` script files remain on the drive even after UnrealEd is closed.

## 16. General information about actor physics (Pitch/Yaw/Roll)..

The easiest way to think of rotators is to put yourself in the position of the Actor.

By default, you face down the Global X-Axis. If you turn your head left or right (like shaking your head "No") this is Yawing.

Shaking your head up and down (like saying "Yes") is Pitching.

Turning your head sideways is Rolling.

Unreal uses a right hand coordinate system for *most* things (rotators included).  If you convert your rotator to a 
coord (use `GetAxes` to get the three component vectors X, Y and Z) the X Axis will be the direction you are facing. 
If you extend your left arm out to your side, this will be the Y Axis, and the Z Axis will go straight up through your head.

By default, an actor's local coordinate system (`Rotation=rot(0,0,0)`) is aligned with the global coordinate system.

Unreal interprets the Rotator values in the following manner:

- First, it Yaws the Actor about the *Global* Z-Axis, 
- then it Pitches about the actor's new *local* Y-Axis, and 
- finally Rolls about the Actor's new *local* X-Axis. 

Note that these are order dependant because Yaw redefines the actor's local Y-Axis, and Pitching redefines the 
actor's X-Axis.  This may seem a moot point, but it's easy to get confused.

Another handy function is `OrthoRotation()` which is basically the opposite of `GetAxes()`.  It takes three component 
vectors (representing the X, Y and Z axes) and converts them to a rotator for you.

Also realize that when you convert a rotator to a vector, and back to a rotator (`rotator(vector(Rotation))`) that you are 
losing the Roll information. This is generally bad.

## 17. I need a way to check for items that can be picked up (ie laying thru out the level). What I want to do is remove all the weapons that are collectable thru out the level and make it so that the players only get weapons that I provide them.

This can be done very easily in the PostBeginPlay function (for instance) where you iterate through all inventory items you want to get rid of - just destroy them... 

Here's an example:

```
function PostBeginPlay()
{
  local Inventory Inv;

  Super.PostBeginPlay();

  ForEach AllActors(class'Inventory', Inv)
    if ( !Inv.bHeldItem )
      Inv.Destroy();
}
```

The `ForEach AllActors` method is very powerful. You can find more info on this in Brandon's Reinharts mutator tutorial at 
Epic's Unreal Technology site (http://unreal.epicgames.com).

## 18. I want to put some code in a touch event of a Player. How would I do this?

A good general rule of thumb for making mods is to stay as far away as possible from attempting to modify `PlayerPawn` and 
descendants directly.

OO practices and intuition will tell you that this is the right way to go about it, but in practice it's usually the most 
difficult.

Instead you can use the ‘glass jar’ technique to accomplish what you want. What you do is spawn another component (ie some object
such as an actor, or pickup, or whatever) and set its collision radius a little larger than the player. You can then code against
its `Touch` function to perform whatever actions you want. 

A couple of things to note is you want to make sure you set the object owner to the player (`SetOwner`) and set the object so it
will collide with objects (`SetCollision`). There is a lot more to this that depends on what you want to do but this at least points
you down the right path.

## 19. How are UT Teams numbered?

UT teams are numbered 0, 1, 2, 3 and 255 for no team.

## 20. How can I prevent a players death when their health goes under zero?

For mutators you can use the `MutatorTakeDamage()` function to intercept the damage done and then, knowing the current health
level of the player who is taking the damage, do whatever functionality you need. If your creating a new gametype then you can
override the `Killed()` or `ReduceDamage()` functions in `GameInfo.uc`

## 21. What is the preferred way to implement new commands for a player?

If you want to extend the functionality of the playerclass, but don't want the hassle associated with subclassing `PlayerPawn`
(or a derivative), you might consider making an Inventory object to do the job for you.
 
Then you can give this Inventory object to the player, and they will be able to execute any exec functions you place in it.

Another method is to use a mutator. Use the "`Mutate`" function inside your new mutator.

```
function Mutate(string MutateString, PlayerPawn Sender)
{
  if (MutateString == "YourString")
    YourFunction(Sender);
}

Function YourFunctione(PlayerPawn Sender)
{
  // ...add your codes here...
}
```

Then you would setup a key to send "`mutate YourString`". Please note that case sensitivity applies here and the `if (...)`
comparision would fail in the above code if you bound the key to send "`mutate yourstring`".

## 22. When you look at someone it will display the name in the center of the screen. what is that message called, or where is it called?

`ChallengeHud` and `TeamChallengeHud` under the function `DrawIdentifyInfo()` and `TraceIdentify()`

## 23. How can I prevent a player from doing a ‘suicide’ via the console?

You’ll have to subclass the `PlayerPawn` classes to do that.

You currently (405b) can’t prevent it with the use of a mutator or a new gametype. Its rumored that 406 will have a 
mutator hook in `Died() `so you can prevent it that way.

## 24. What's the best way to give players a special pickup each time they spawn?

Use the mutator’s `ModifyPlayer()` to add the item to the players inventory and then call `GotoState('Activated')` on that inventory item.

## 25. Is there any way to set a default variable using UnrealScript?  In other words, can you somehow call a function that changes the default value of a variable permanently?

Just using `default` works:

```
default.drawscale = 1.0;
```

etc

If you want to SAVE those variables for subsequent invocations of UT, you need to call `SaveConfig()` on the object you want saved.

It'll save all its config variables to the `UnrealTournament.ini` file, for loading at a later date. That's how UT stores its
preferences about maps and gametypes and such.

## 26. How would I check to see if an object is of a particular class or compare to see if two classes are the same class? IsA()?

The `IsA` function is simple to use... you just have to call it by using the name of the class you like to check, ie:

```
  if ( Other.IsA('PlayerPawn') )
  if ( Other.IsA('Weapon') )
```

A note about the `IsA()` function: The `IsA` function returns `true` if the classes are matching the given name, but ALSO 
child classes are `true`.

If you want to check to see if the class is a child of a given class then you have to use the `ClassIsChildOf()` function. `IsA()` 
wouldn't work in that case because you it'd return `true` if the class your comparing happened to be the parent class.

Probably the easiest way to compare classes set the comparison variable to a ‘name’ value (names are a unique variable type 
in the same way that ints, strings, floats are. A name is NOT equal to a string and are identifiable via the single quotes 
whereas strings use double quotes):

In its simplest form it would look like:

```
  Object.Class.Name == 'SomeClassNameHere'
```

Another example of the same thing:

```
  var() class<weapon> MyWeapon;           
  MyWeapon = Class'BotPack.SniperRifle';  //sets MyWeapon to the NAME value
  if (someweapon.class == MyWeapon)   // basically translates to if (MyWeapon.class==class'Botpak.SniperRifle')
```

The `'MyWeapon.class == class'Botpack.SniperRifle'` will ONLY return True if the classes match exactly (ie. sub-classes 
will fail the comparison).

## 27. Some general information about the Activate() event on pickups.

All pickups will have their `Activate()` function called when they are in the state 'Pickup' and the `Touch()` function is 
called and...:

1. The variable `bActivatable` is `true`
2. The variable `bAutoActivate` is `true`
3. The touching actor's `bAutoActivate` is `true`

(line #99, `pickup.uc`)

Now in the `PlayerLogin()` function of `GameInfo`, all new players have their `bAutoActivate` variable set to `true`, so 
that covers #3. 

In `DMMutator`, which is loaded as the `BaseMutator` (the `MutatorClass` variable in the `defaultproperties`
section of `GameInfo` defines what mutator is loaded as the `BaseMutator`), contains code in the `CheckReplacement()` function
that sets the `bAutoActivate` variable to `true` on all pickups, so that covers #2. 

Finally the `bActivatable` value is set in the `defaultproperties` of the various pickups such as `ut_jumpboots` and `ut_invisibility`.

Now looking at an example, the `ut_shieldbelt`, we see that the `bActivatable` is NOT set to `true` in that class, nor is it
defined `true` in any ancestors. Because there is no specific functionality needed in that context (no code is in `ut_shieldbelt` 
class under an `Activate()` function) we say there is no need for it to be set. Its easy to see why some items would have 
such a function, say for instance a landmine that explodes when its touched, but there are items (`ut_shieldbelt`) where its not needed.

You may wonder what functionality it would have inherited from the ancestors and what it *wasn't* getting by not having that 
variable defined as `true`. Looking at the ancestors we see that the `Activate()` call assigns the `ProtectionType1/2` variables,
which is important in the calls that reduce damage based on what armor your carrying and the `ProtectionType1` assigned. 
`ut_shieldbelt`'s `defaultproperties` section sets `ProtectionType1/2` to 'ProtectNone'. Since there is no `damagetype` 
called 'ProtectNone' the shield belt provides no specific protection against any damage types. 
Thus there is no need for the ancestor code to be ran at all, nor as far as I can tell, any reason to include the 
`ProtectionType` variable settings in `defaultproperties` other than consistency of coding. 

By not setting the `ProtectionType1/2` variables (because the ancestor activate functions were not called) the values 
default to ‘`None`’. This has the same affect in the logic of the damage reducing functions as having the values set to 'ProtectNone'.

## 28.  I’ve seen it coded where a inventory item is given to a player they a line that reads: SelectedItem = NewItem; what is this for?

That line is not really necessary but kind of good style. 

In Unreal, you have an inventory display and are able to cycle through it, that's where this variable originates. 

In Unreal Tournament, all items are instantly Activated so there's no need for the inventory display and selection. But since
a mod could add it in easily, it's better to make sure the item is selected, just in case, as an example the 
flashlight/searchlight comes from the original Unreal, so that's why `SelectedItem` was necessary. 

Even some UT items (jump boots come to mind) do it so we can consider it The Right Thing.

## 29. How do I ensure that my .u files are downloaded to the client from the server?

Make sure you have the classes directory a file called `<package name>.upkg` with the following in it.

```
[Flags]
AllowDownload=True
ClientOptional=False
ServerSideOnly=False
```

## 30. I’m having a problem with GlobalConfig vars being saved in my config(MyConfig) .ini file.

If you you make a subclass of a class that uses `GlobalConfig` vars, AND you use `config(MyConfig)` for putting your 
config vars into a different ini file all the `GlobalConfig` vars from the mainclass will show up in YOUR own ini 
file as well. If you do this with a gametype, the resulting effect is as follows:

You select your gametype and the 'original' config variables are loaded.... You change them and by starting the game, YOUR config 
variables will be saved - of course not the global ones. Now try to start another match - same variables are used, not your 
changed settings.

The current solution to this problem is by making the variables 'hardcoded' and setting the originals back again after leaving

## 31. If your going to use the mutate functionality of mutators then you need to read this.

Another thing I'd like to mention regarding "`Mutate`": Mutators are intended to be combinable, so when choosing your mutate 
string, please keep that in mind. If you've made a flashlight mutator that toggles the lighting with "Mutate On" and 
"Mutate Off" commands, it will get in the way when a user is running an cloaking mod that toggles the invisibility with the 
same commands. That's kind of obvious, but once it's overlooked, compatibility between mutators suffer.

A proposal is to use a simple programming convention for Mutate: Prefix the actual commands with your mod's filename. If you only
need one Mutate command, give it the same name as your mod. If you use several commands, check the strings. Here's an example:

```
String MyMutator; // Set value in defaultproperties or hardcode it

function Mutate(string MutateString, PlayerPawn Sender)
{
  if ( Left(MutateString, Len(MyMutator) + 1) ~= (MyMutator@"") )
    MutateString = Right(MutateString, Len(MutateString) - Len(MyMutator) - 1);
  else if ( !(MutateString ~= MyMutator) )
  {
    // Mutate command doesn't have proper prefix so it's not for our mod
    Super.Mutate(MutateString, Sender); // Let other mutators handle it
    return; // And then leave
  }
  // Your MutateString evaluation here (case, if, whatever)
}
```

The name of your mod should be stored in the variable "MyMutator", but hardcoding it (and its length) works as well, of course.
The advantage of this code is that after the "`if`", you can evaluate the MutateString normally, without having to bother with
the prefix anymore. This is very useful for complex mutate commands, but if you only use one or two, a simple "`if`" or "`case`" 
statement will still be more efficient to use. 

But do keep these things in mind for the sake of interoperability (the real reason for mutators).
