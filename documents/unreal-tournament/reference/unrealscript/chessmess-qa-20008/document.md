## 1. How do I set which PlayerPawn the player is using/controlling?

A `PlayerPawn` subclass is returned by `GameInfo.Login()`. You can set the `DefaultPlayerClass` for any 
`GameInfo` subclass. If you look through the Q&A's, you'll find some info about how to switch out the
meshes & such dynamically. I think mutators in Patch 413 & greater can do something about PlayerPawn(s)
also. You will have to check. Maybe it is called `Mutator.ModifyLogin()` there as well (I have not used
this yet). I think Ob1 coded a Dynamic Player Class API at [UMod Wizard](https://web.archive.org/web/20010619163314/http://www.planetunreal.com/umodwizard/).

> I don't really understand `PlayerReplicationInfo`.

Refer to the Network Architecture Document on replication for some background. Basically, the game on
the server sends the player data he needs to know about the game. A PRI plays a critical role in
relaying certain data to clients in network games.
 
## 2. In a CTFGame, when a person captures an enemy flag I want that person to explode (die) after a certain amount of time. How do I code this?  

My implementation would be to subclass the CTFFlag/Decoration and start a timer as soon as the item 
is picked up (`Touch()`). Next, I would spawn a redeemer blast or call `TakeDamage()` 
(`Actor.TakeDamage`) on the flag carrier and set the damagetype to gibbed.
 
## 3. I have a weapon that works properly for players. However, when bots use it, the rate at which they fire is much faster than it should be. It seems like they're not going into a Reload state (which I use to do stuff, as well as force reload time between firings).

Fred Peeler, from ChoasUT comments:

Make sure it does work properly for the player... I always try 2 things... pressing the fire button
repeatedly before the reload cycle ends and holding it down. If either of those are not working
properly you probably need to supress the Fire and Altfire functions in all of your post-firing
states, either by subclassing Fire with an empty function in your firing and reload states, or
using an ignores.
 
## 4. How does the Unreal Engine handle Garbage Collection? Is it okay to reference an actor (like a bot) from a pure Object?

```
class MyObject expands Object; 

var Object object1; 
var Object object2; var Actor actor1; 

function foo(Canvas canvas, Actor the_actor) 
{ 
  object1 = canvas; // This is ok. 
  actor1 = the_actor; // This is also ok. 
  object2 = the_actor; // If MyObject is deleted like this, the game will crash. 
}
```

_Aaron Leiby from Legend Entertainment comments:_

When you call `the_actor.Destroy()`, the Actor is marked as deleted and removed from the main
list (among other things). For all intents and purposes, it's gone. But it's not really. It's
still sitting in memory until garbage collection is run (which doesn't happen until you change
maps -- or quit -- or call `OBJ GARBAGE`)*. So since Object's variables aren't cleaned up when
an Actor is `Destroyed()`, object2 and actor1 will still point to your now "destroyed" Actor
(they will not be None).

* a form of garbage collection is called every time 256 (it may be 128) destroyed actors 
accumulate. I think this is where the Actor variables get set to None -- if they pointed to 
one of these Destroyed Actors. But I don't think any memory is reclaimed at this point.

_Richard Osborne, from F.E.B.A., comments:_

Inventory actors get destroyed {notifies the engine to collect it} all the time when a pawn
dies/restarts. All references to this actor become none if you test it within code. Now, in
my mod, I did not point to inventory actors but, to pawns which do not get destroyed til the
end of the game or later. Example subclass:

```
class Node expands Object;

var Object value;
var Node next, previous;
```

During the course of the game, I used to set the value to some Pawn to track different 
things. At the end of the game, if this reference (value=Some Pawn) is not cleaned up, it
will cause a crash consistently - 100% of the time. I suppose you won't have this problem
if Node expanded Actor & value was defined as an actor. But then if you expanded actor
and there were thousands of little nodes then your FPS will go down eventually.... I think
it is best to stick with arrays for referencing pawns in the long run, which is what most
coders do anyway...
 
## 5. How do I setup my own fire button through a mutator without using a mutate string?

_JohnMcl from WarBots comments:_

Try binding this: `mutate whateverON|onrelease mutate whateverOFF`
 
## 6. Can I swap out (exchange) a flagbase using a SpawnNotify?

_Brett Foster, RealCTF coder comments:_

If you take a look at the properties of the `FlagBase` class, you will see that 
`bNoDelete=True`. There is no way to replace these actors on the fly regardless of the
technique (SpawnNotify or otherwise).
 
## 7. Is there a way to draw to the hud without having the hud color take effect. Any graphic I put there seems to be adjusted by the hud color which causes a lot of nasty effects.

_Brett "mouse" Foster of RealCTF comments:_

Simply set `Canvas.DrawColor` to white or whatever color you want. Then restore it when
you're done.
 
## 8. Anyone knows if it's possible to draw a black color on the canvas without using the ERenderStyle.STY_Modulated ?

_Brett Foster from RealCTF comments:_

Use a palette editor to change the RGB value of the first palette entry to some other color
that you're not using, then change another palette entry to black. After that you can have
a transparent texture that also has black in it. Most decent paint programs have a palette
editor built-in like Paint Shop Pro.

_Pfhoenix from Mod Exemplar Project comments:_

You don't even need the `ERenderStyle`. Simply (in MS Paint) whip up a 2x2, or 4x4 bitmap that
is nothing but solid black (make sure it's 256 color though, so you maybe don't want to use MS
Paint =). Then, in your code, #exec import it with no flags at all - viola~, UT draws it as it
is, solid black.
 
##9. What are all the different styles an actor can be rendered?

_Laurent Delayen, Tactical Ops Leader comments:_

- `STY_Normal` - Every pixel 100% opaque except if `FLAGS=2` is set then index0 (first color in
  the palette) will be transparent.
- `STY_Translucent` - The brightness of a pixel is also it's opaqueness It doesn't work well on
  some configs and OS (MAC+Glide if i'm not mistaken and software mode). `FLAGS=2` is required
  then it works great on software mode and i guess on every hardware/OS.
- `STY_Modulated` works like this: color 0,0,0 = darken screen color 127,127,127 = no change
  color 255, 255, 255 = brightens screen I use this for the sniper crosshair in Tactical Ops
  aswell as the screen darkening in the Pre-Round and the WideScreen Effect.
- `STY_Masked` - All pixels that are color-pallet-zero are completely transparent (i.e. not
  rendered), the rest are 100% opaque.
 
## 10. When my mod is played on a server over a netgame, it is supposed to look into one of the client's .ini files to find out which class to log them in as, but at the moment it just looks at the server's and all the players end up as being the same class. This is the ModifyLogin function i'm using:

```
function ModifyLogin(out class SpawnClass, out string Portal, out string Options)
{
    MatrixClass = class'MatrixConfigClient'.default.MatrixClass; 
    if(MatrixClass == 0)
        SpawnClass = class'MatrixMutator.Agent'; 
    if(MatrixClass == 1)
        SpawnClass = class'MatrixMutator.Resistance'; 
    if(MatrixClass == 2)
        SpawnClass = class'MatrixMutator.SWATOfficer'; 
    if ( NextMutator != None )
        NextMutator.ModifyLogin(SpawnClass, Portal, Options);
} 
```

My Question: is there any way that I can get the server to look at the client's ini file instead of it's own?

First, use a `ReplicationInfo` (RI) subclass which is spawned in `ModifyLogin()` on the users
first connect. Now, the problem is the client has not replicated his player class to the server
at this point. The solution then is to replicate stuff from PostNetBeginPlay() in a network game.
Keep in mind that event is only called in network games. From there, you must replicate your
player class index from the client RI to the server-side RI. Here is a small example:

```
class FRI expands ReplicationInfo; 
var config int PlayerClassIndex; 

replication { 
    if (ROLE > ROLE_Authority) ServerUpdatePC; 
} 

simulated event PostNetBeginPlay() 
{ 
    log("client side log..."); 
    ServerUpdatePC(PlayerClassIndex); 
} 

event ServerUpdatePC(int PC) 
{ 
    //whatever you need to do here..... 
    log("server side log"); 
}
```
 
## 11. Can I change the class (playerpawn subclass) of the player before login()?

The normal solution to this is to let players select the player class through the config menu. 
Is this an option for your project? If you have new skins, models, or something you could do
it that way. Sort of like what [Unreal4Ever](https://web.archive.org/web/20010603040324/http://www.planetunreal.com/u4e/)
did.
 
## 12. What's the best method for replacing an inventory item at load time?

I used a mutator to change the classes of items in the game. I have a separate class called
`RalsMini` in the `MyPack` package.

```
//--------NewMini.uc 
class NewMini expands Mutator; 
function bool CheckReplacement(Actor Other, out byte bSuperRelevant) 
{ 
    local Inventory Inv; 
    bSuperRelevant = 1; 
    
    if ( Other.IsA('StationaryPawn') ) return true; 
    Inv = Inventory(Other); 
    if ( Inv == None ) 
    { 
        bSuperRelevant = 0; 
        return true; 
    } 
    
    If ( Other.IsA('Weapon') ) 
    { 
        //Log All occurances of weapons for testing 
        log("RL: Found "$Other$" at "$Other.location); 
        if ( Other.IsA('Minigun2') && !Other.IsA('RalsMini') ) 
        { 
            //Log all instances of a replacement. 
            log("RL: MiniGun Replacement Made Of "$Other$" at "$Other.location); 
            //This is the replacement call ReplaceWith( Other, "MyPack.RalsMini" ); 
            return false; 
        } 
    } 
    bSuperRelevant = 0;
    return true; 
} 
// -----End NewMini.uc 
```

This works just fine for me. It may not be the most efficient way of doing this but it does work.
Also, Remember to modify your .int files to reflect both of your new classes, the mutator and the
item classes, if they are not native to UT. Look in mutator.uc to find more information about the
different possible inherited functions. This function will also change items as they respawn, so
it's not just a one shot deal, if you wanted it to be a one shot switch, you'd need some extra
logic in there.

## 13. I am having some trouble with some inherited events not firing. I have a class somewhat like this:

```
//Begin Code Snippet 
Class Blah expands UTClass; 
Simulated event DoStuff 
{ 
    Log Stuff for error trapping 
} //End Code Snippet
``` 

_Comment from Aaron Leiby, Legend Entertainment._

But after having said all of that, there's no reason your function shouldn't be getting called -- 
unless you perhaps spelled it wrong, or overrode it in a different state or something. If you have
a function in the class that you know is being called, have you tried directly calling your 
overridden event from that function?
 
## 14. I coded a new gametype that uses CTF Maps (and some code from CTFGame.uc). This new gametype expands TeamGamePlus so there are no flags spawned (which is what I wanted since I use another object instead). However, at the end of the game when the clients go into spectator mode & their views are switched to the flagbase of the winner, you can see a flag. How do I get rid of this flag?

_JohnMcL, WarBots coder:_

Make sure you set `BestBase.bHidden = false` in the `EndGame()` code.
 
## 15. I have created some textures and built a UTX file, which has been dumped in the Textures directory under my UT directory. Upon building a level and applying some textures (after importing the UTX) I try to run the level (after building) and I get a message telling me that the package cannot be found. How do I get textures, from the UTX file into a map, so that I can run the map from UED2?

_Aaron Leiby, from Legend Entertainment comments:_

I'm guessing this is due to a name conflict. Try changing the name of the map, or the texture package.
As a general rule I usually tack a 'T' on the end of all texture package names to avoid such conflicts.
(also make sure they don't conflict with any .u files in your system folder)
 
## 16. I have two questions:

1. What does the `globalconfig` mean/do in comparison to config?
2. what does `travel` mean for a `var`?

_Richard Osborne, F.E.B.A. Project Lead comments:_

1. It appears these variables get stored to `unrealtournament.ini`
2. Traveling Actors are actors that can travel to different URLs through a portal that may be used to
  link a series of maps together. If you setup a portal that points to a different level via its' URL
  property, then the playerpawn can take his selected weapon and inventory along with him. Only a few
  actors have the bTravel property set like Inventory, Ammo, Weapon, & PlayerPawn classes. So, Server
  Travel means going from one URL to another (check out the Actor class). There are some mapping
  tutorials about this concept (Portals) at 
  [UnrealEd](https://web.archive.org/web/20010613184853/http://groups.yahoo.com/group/unrealscript/files/Question%20&%20Anwser/www.planetunreal.com/unrealed).

_Beppo, Infiltration Lead Coder also comments:_

Traveling actors can "travel" between maps / URLs... So a player is able to carry his weapons, items
to the next map also... Thus, traveling actors need the TravelPostAccept function to get them
reassigned to the player... UT checks the players health in PlayerPawn for example to get it back to
the default value cause health is a "travel int" within Pawn and this will not be sooo cool if
playing online matches ;) (still a travel int since Unreal 1 ... and without it "real" single player
games will not be possible...) A Pickup uses this function to "give" the inventory objects back to
the player after he/she enters a new map (same single player issue...). Weapon uses this to fully
add the weapon to the players inventory again including ammo.
 
## 17. I want to subclass an original Unreal Weapon and use it in the game. Everytime I do this UT replaces the Weapon model with the newer one. How do I get UT to accept my Unreal I Weapon?

_Brett "mouse" Foster, RealCTF coder comments:_

The code you're looking for is in `Botpack.DMMutator`:

```
if ( Other.IsA('ASMD') ) 
{ 
	ReplaceWith( Other, "BotPack.ShockRifle" ); 
	return false; 
} 
```

So, if you want to use those old models you can do it; you just can't make a subclass of the original
Unreal weapon class and expect it to work with UT game types.

## 18. Does anyone know of a fast way to align imported weapon models (the 3rd person view)?

The only way to align imported weapon models (3rd person view) is through the `#exec` statements.
 
## 19. Anyone know any magic about dealing with weapon priorities? It appears that weapon mods seem to mess it up pretty well.

_Beppo, Infiltration lead coder comments:_

Simply delete these lines totally out of your `user.ini` file and replace them with the lines that are
listed within the `DEFUSER.INI` found in every `UT\system` folder out there ;) btw. Each weapon that
the player selects will be automatically added to this list! .... Infiltration handles this problem by
allowing users to change their weapon priorities within our own weapon priority window. UT is only 
able to show the UT weapons within the original weapon priority window... Here's the list out of the
`DEFUSER.INI` file if ya need it:
```
[Engine.PlayerPawn] 
WeaponPriority[0]=Translocator 
WeaponPriority[1]=ChainSaw 
WeaponPriority[2]=ImpactHammer 
WeaponPriority[3]=enforcer 
WeaponPriority[4]=doubleenforcer 
WeaponPriority[5]=ShockRifle 
WeaponPriority[6]=ut_biorifle 
WeaponPriority[7]=PulseGun 
WeaponPriority[8]=SniperRifle 
WeaponPriority[9]=ripper 
WeaponPriority[10]=minigun2 
WeaponPriority[11]=UT_FlakCannon 
WeaponPriority[12]=UT_Eightball 
WeaponPriority[13]=WarheadLauncher 
WeaponPriority[14]=None 
WeaponPriority[15]=None 
WeaponPriority[16]=None 
WeaponPriority[17]=None 
WeaponPriority[18]=None 
WeaponPriority[19]=None 
```
 
## 20. What is the cleanest way to enable variable rate zooming?

_Beppo, Infiltration Lead Coder comments:_

If ya want to change the FOV directly without using the bzooming version, simply edit the `FOVAngle`
value directly. You have to setup the `FOVAngle`, the `DesiredFOV` and the `DefaultFOV` for using the
cleanest way that will not collide with the zoom-codes within `PlayerPawn`. ie. use the following in
a weapons `Tick` function or any other object the player owns...

```
PlayerPawn(Owner).FOVAngle = MyFOV; 
PlayerPawn(Owner).DesiredFOV = MyFOV; 
PlayerPawn(Owner).DefaultFOV = MyFOV; 
```

Then you can setup `MyFOV` like ya wish... ie using `DeltaTime` to setup the rate for changing it 
also.
 
## 21. What things/problems would cause the Paint() not to be called in a UWindow subclass?

Make sure you look at the `UTMenu.SpeechWindow` code. There are 2 lines you need:
```
function Created() 
{ 
    bAlwaysOnTop = True; 
    bLeaveOnScreen = True; 
} 
```

Also, make sure `bHidden` is set to false.

## 22. Can I use the ESC key to close a UWindow that has been added to the UTConsole?

You cannot use the ESC key to close a `UWindow` (if the root is owned by `UTConsole.uc`). It always 
messes up child windows...
 
## 23. How does one setup a variable such that it can be set in defaultproperties?

Any variable can be initialized in the `defaultproperties` as long as there are no spaces and no (;).

```
var int x;

defaultproperties
{
    x=5
}
```
 
## 24. Is it possible to change the player setup's class selection (ie playermodel) in a separate Mod-menu menu?

_JohnMcl, WarBots Coder comments:_

Yes, let him change it and save it to the URL. The functions are somewhere in `Playerpawn.uc`
 
## 25. How can I start Unreal Tournament without the startup video for UT?

_Catalyst88, Exile coder comments:_

If you look at `UnrealTournament.ini`, you'll see a line that says:

```LocalMap=CityIntro.unr```

if you change this to: 

```LocalMap=Ut-Logo-Map.unr ```

Then UT will start up at the logo screen instead of with the intro sequence.

## 26. How do I determine the actual height of the camera, from the floor for a PlayerPawn?

_Beppo, Infiltration coder comments:_

Here's the script part used within the PlayerPawns event PlayerCalcView:

```
CameraLocation = Location; ... 
// First-person view. 
CameraRotation = ViewRotation; 
CameraLocation.Z += EyeHeight; 
CameraLocation += WalkBob;
```

This is the way the `CameraLocation` is setup... So, the location of the player plus the `EyeHeight` and
the `WalkBob` results in the location for the camera... What is left as actual height for the camera 
relative to the floor: the `Pawn.CollisionHeight` ... Note its half the height of the player (results
in a collision cylinder), so the `CollisionHeight` itself is the exact middle of the mesh and the 
location of the player relative to the floor... So, `CollisionHeight` + `EyeHeight` + `WalkBob.Z` = 
current height of the Camera or: `CameraLocation` - `Location` = current height of the camera if the
camera's position is always higher then the mesh's `Location` (center)...

## 27. Where can I find an example of a Tournament Player subclass?

`Botpack.TMale1` is a good example.
 
## 28. Where can I find info on Network Priorities?

There's Mongo's great replication doc at: 
[Replication De-Obfuscation](https://web.archive.org/web/20010624122531/http://www.planetunreal.com/pipeline/tutorials/replication.html)
 
## 29. Anyone know of any good tutorials concerning new weapons?

_Professor Gib, UTC coder comments:_

[Chimeric](https://web.archive.org/web/20010613184853/http://www.planetunreal.com/chimeric) shows how
to create weapons from scratch.
 
## 30. Is there a function that's guarenteed to be called when the player leaves the game, no matter how?

`Logout()`
 
## 31. Do UWindow subclasses have a Tick() function?

No but they do have a `DoTick()` call.
 
## 32. UT seems to forget my ExtraKeyBindings. Why?

_Professor Gib, UTC coder comments:_

There's a known issue where the extra bindings have trouble with stuff that has spaces in it.
 
## 33. Can I code my own states in a PlayerPawn subclass? They do not seem to work correctly in multiplayer.

_Aaron Leiby, from Legend Entertainment comments:_

Servers don't execute state code for autonomous proxies (`PlayerPawns`) in UT.
 
## 34. Is there any printf equivalent for truncating floats in UScript?

No, but you can use other methods to truncate a number.

_Yoda, planetunreal admin comments:_

You could convert your float to a string, and use `Instr()` (to figure out where the "." is) and `Right()`
(to grab everything before the "." and however many chars you want afterwards). Then convert back a float.
```
MyFloat = 3.29393; 
MyString = string(MyFloat); 
MyTruncatedString = Left( MyString, Instr(MyString, ".") + 2 ); 
MyTruncatedFloat = float(MyTruncatedString) or: MyFloat = 3.2939; 
MyTruncatedFloat = float( Left( string(MyFloat), Instr(string(MyFloat), ".") + 2 ) ); 
```

Which would give you 3.2 Hope that helps.
 
## 35. How can I replace the speechwindow?

_Laurent Delayen, Tactical Ops coder comments:_

In the `Possess()` (`PlayerPawn`) function you can switch it. Backup the original `Speechwindow` and
create a new one. Be careful because you'll need to use the console and root window, and sometimes 
it's not created (if you launch the game from UED or gamespy for example) so you have to test if the
ROOT windows exists, otherwise create it. Then in the Destroyed method (if this code is in a HUD)
replace your `Speechwindow` with the UT one. Below is some code from Tactical Ops:

```
///////////////////////////////////////
// Possess
///////////////////////////////////////

simulated event Possess()
{
    local WindowConsole    C;
    local UWindowRootWindow  Root;
    
    Super.Possess();
    
    if (C.Root == None)
    {
        log("s_Player - Possess - C.Root == None - creating Root");
        C.CreateRootWindow(None);
    }
    
    if (Player != None
        && Player.Console != None
        && UTConsole(Player.Console) != None
        && (UTConsole(Player.Console).Speechwindow == None
            || !UTConsole(Player.Console).Speechwindow.IsA('s_SWATWindow')) )
    {
        Root = WindowConsole(Player.Console).Root;
        if (UTConsole(Player.Console).Speechwindow != None)
        {
            UTConsole(Player.Console).Speechwindow.Close();
            UTConsole(Player.Console).Speechwindow.CancelAcceptsFocus();
        }
    
        UTConsole(Player.Console).Speechwindow = SpeechWindow(Root.CreateWindow(Class's_SWATWindow', 100, 100, 200, 200));
        Song = None; 
        
        if (UTConsole(Player.Console).Speechwindow == None)
        {
            log("s_Player - Possess - Speechwindow == None"); return;
        }
    
        UTConsole(Player.Console).SpeechWindow.bLeaveOnScreen = true;
        if(UTConsole(Player.Console).bShowSpeech)
        {
            Root.SetMousePos(0, 132.0/768 * Root.WinWidth);
            UTConsole(Player.Console).SpeechWindow.SlideInWindow();
            }
        else
            UTConsole(Player.Console).SpeechWindow.HideWindow();
    }
    else log("s_Player - Possess - cannot replace speechwindow");
}

///////////////////////////////////////
// Destroyed (this code is for the HUD)
///////////////////////////////////////

function Destroyed()
{
    // Replacing our Action window by the original Speech window.
    if (Root != None)
    {
        UTConsole(Root.Console).Speechwindow = SpeechWindow(Root.CreateWindow(Class'SpeechWindow', 100, 100, 200, 200));
        UTConsole(Root.Console).Speechwindow.SetAcceptsFocus();
        if(UTConsole(Root.Console).bShowSpeech)
        {
            Root.SetMousePos(0, 132.0/768 * Root.WinWidth);
            UTConsole(Root.Console).SpeechWindow.SlideInWindow();
        }
        else
            UTConsole(Root.Console).SpeechWindow.HideWindow();
    }
    
    Super.Destroyed();
}
```
 
## 36. I have a VERY tall actor in a map and I am experiencing some weird "popping" of the actor. It would appear that if the center of the actor is "behind" the viewplane of the camera, then the object is deemed as not onscreen. (the actual algorithm is probably more complex but this is the simplist way to describe what I see). The actor is like 1000 units high or so, and all seems well until the camera is up close and pointing toward the top of the actor, at which point the actor disappears. If the camera is angled down, then the actor pops back into view. Same if the camera is "backed up".

I have tried modifying collision/view height/radius to no avail. Anyone have any insight?

_Aaron Leiby from Legend comments:_ 

This is a "feature" (bug) of Unreal's mesh rendering code (it's been like that since day one). It still hasn't been fixed.
 
## 37. Is it possible to change the client's/player's playerpawn during the game?

_Beppo, from Infiltration comments:_

Yes, it's possible but, it takes a little work. Below is some example code.

```
function ScoreKill(Pawn Killer, Pawn Other)
{
    // called by GameInfo.ScoreKill()
    local PlayerPawn NewPlayer;
    local string SpawnClassString, InSkin;
    local float rF;
    
    if ( PlayerPawn(Killer) != None && Killer.bIsPlayer )
    {
        rF = FRand();
        switch ( Killer.class )
        {
            case class'BotPack.TMale1' :
                SpawnClassString = "BotPack.TFemale2"; 
                if ( rF < 0.2 ) InSkin = "SGirlSkins.army"; 
                else if ( rF < 0.4 ) InSkin = "SGirlSkins.Garf";
                else if ( rF < 0.6 ) InSkin = "SGirlSkins.Venm";
                else if ( rF < 0.8 ) InSkin = "SGirlSkins.fbth";
                else InSkin = "SGirlSkins.fwar";
                break;
            case class'BotPack.TMale2' :
                SpawnClassString = "BotPack.TFemale1";
                if ( rF < 0.25 ) InSkin = "FCommandoSkins.cmdo";
                else if ( rF < 0.5 ) InSkin = "FCommandoSkins.daco";
                else if ( rF < 0.75 ) InSkin = "FCommandoSkins.goth";
                else InSkin = "FCommandoSkins.aphe";
                break;
            case class'BotPack.TFemale1' :
                SpawnClassString = "BotPack.TMale1";
                if ( rF < 0.33 ) InSkin = "CommandoSkins.cmdo";
                else if ( rF < 0.64 ) InSkin = "CommandoSkins.daco";
                else InSkin = "CommandoSkins.goth";
                break;
            case class'BotPack.TFemale2' :
                SpawnClassString = "BotPack.TMale2";
                if ( rF < 0.2 ) InSkin = "SoldierSkins.blkt";
                else if ( rF < 0.4 ) InSkin = "SoldierSkins.Gard";
                else if ( rF < 0.6 ) InSkin = "SoldierSkins.RawS";
                else if ( rF < 0.8 ) InSkin = "SoldierSkins.sldr";
                else InSkin = "SoldierSkins.hkil";
                break;
        }

        if ( SpawnClassString != "" )
        {
            LOG("---->ChangeClass to:"@SpawnClassString);
            PlayerPawn(Killer).ClientMessage("ChangeClass to:"@SpawnClassString);
            PlayerPawn(Killer).UpdateURL("Skin",InSkin, false);
            PlayerPawn(Killer).UpdateURL("OverrideClass",SpawnClassString, false);
            PlayerPawn(Killer).ConsoleCommand("reconnect");
        }
    }
    
    if ( NextMutator != None )
        NextMutator.ScoreKill(Killer, Other);
}
```

Now you have to get the new `PlayerStart` to work (you need a subclass of `PlayerStart` that can be 
spawned) and a `GameInfo` that will allow you to connect again...

## 38. How can I create a login screen whereas players can pick their team like in Tactical Ops 1.5?

Download WRI from [Creative Carnage](https://web.archive.org/web/20010606123741/http://www.creativecarnage.com/unreal/)
and read the tutorials that comes with it. 
