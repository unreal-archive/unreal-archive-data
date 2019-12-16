## 1. How do I get all the team scores?

This is the pseudocode which will work reliably in a network game in client code:

```
local TournamentGameReplicationInfo TGRI; local int i; local int scores[4];
TGRI = TournamentGameReplicationInfo(PlayerPawn (Other).GameReplicationInfo); 
if ( TGRI != None )
{
  for ( i=0 ;i<4; i++ )
    scores[i] = TGRI.Teams[i].Score;
}
```

 
##2. How do you spawn an explosion?  

Look into the `Explode` function of whatever projectile the Rocket uses. It'll just have a spawn line for an explosion. You can
add more, or whatever else you like...
 
## 3. How do you get guaranteed gibs on a kill?

Call the `gibbedBy()` function in `Pawn`.
 
## 4. How does the Speech/Orders Menu get Spawned? I mean, specifically what function gets called when you press the button.

The speech menu is displayed from the `KeyEvent` function in class `UTConsole`.
 
## 5.How do you import a UAX file?

*Chris Schletter of Minions of Destruction comments:*

```
#exec OBJ LOAD FILE="sounds\SmackDown.uax" PACKAGE="SmackDown"
``` 

Then assuming that with UEd you imported `Smack1.wav` and `Smack2.wav` in as `SmackDown1` and `SmackDown2` into the group `OneShot`, 
then all you should have to do is:

```
P.ClientPlaySound(Sound'SmackDown.OneShot.SmackDown1', , True);
```

You should not have to include the name of your class package, because the #exec when the package is compiled will get imported 
into the package. However, if you include it in a different package, say SmackDownSounds.u then you would have to do this:

```
P.ClientPlaySound(Sound'SmackDownSounds.SmackDown.OneShot.SmackDown1', , True);
```

## 6. How do I script complex HUD Mutators?

You might want to take look at www.planetunreal.com/unrealistic as they have a mod rescource there called ITSHUD which does 
the sort of thing you're trying to do.
 
## 7. I'm working on a mod of the sniper rifle. I am trying to mask out the view of all except what the sniper can see through his scope. However I would like the HUD and stuff to still be visible. I am drawing a texture (with DrawRect) onto the canvas in PostRender of my modified sniper rifle script. The HUD elements show up over it nicely. However, the player chat messages are masked out (they seem to be "behind" my mask, if you know what I mean.) I would like to get the chat messages "over" the mask. Making the mask STY_Translucent allows the chat messages to be seen, but defeats the purpose of the mask in the first place :) Any ideas?

*Brett "mouse" Foster of RealCTF comments:*

If you have custom PlayerPawn-derived classes then you can use `PlayerPawn.PostRender` to inject your screen-blackout code 
before calling `myHUD.PostRender`. Otherwise, if you look at `ChallengeHUD.PostRender`, you will see that the chat messages 
are rendered before calling `Weapon.PostRender` or `HUDMutator.PostRender`. It would seem that your options are somewhat 
limited. 

For maximum compatibility I would recommend that you simply not draw black over the speech area or the face area. You will 
have to copy some code from `ChallengeHUD` in order to determine whether these elements are present on the HUD. 
Unfortunately the background will show through.

Other less palatable alternatives include replacing the HUD class (which is bad for a mutator) or re-rendering all of the 
speech stuff from your `Weapon.PostRender` function. Both of these present serious potential compatibility problems.
 
## 8. Our problem is we can't find a good way to remove the color effect that it puts on the image. Like Blue Scale for team blue. Does anyone know how to remove this effect?

*Chris Schletter of Minions of Destruction comments:*

_Editor's note: The original answer seems lost in a copy/paste failure_
 
## 9. How exactly does the native FindPathTo function work? How do bots know when to jump and teleport?

Some of your questions sound related to UnrealED which Level Designers have to use to setup the Bot AI stuff 
(Navigation, JumpSpots). Maybe you have not checked out this document yet: [Creature Feeding](https://web.archive.org/web/20011204222758/http://unreal.epicgames.com/UT_AI.htm).
 
## 10. Is there any utilities that I can use to help test my netcode on a single machine?

*Posting from mod author, Bane:*

Some time ago, I received the tip to try out a small utility called "Priority" in order to be able to test netcode on a
single machine (yes, I know you can do that anyway, but the performance eh leaves much to be desired). While actually created
for QuakeWorld servers, it works pretty well with UT as well - and it's definitely made my life a lot easier :) Check it out 
at Priority (_Editor's note: dead link_).
 
## 11. Is there any way to change a PlayerPawn's mesh?

It's quite easy to change the pawn's mesh by changing the value of the pawn's mesh property.
 
## 12. How do I find out the length of a sound?

I think you can look at `GetSoundDuration`.
 
## 13. Anyone know if it's possible to make a player a trailer of another actor? I've tried by setting the player's physics to PHYS_Trailer and then setting their owner to the object I want them to trail, but it crashes UT.

*Comment from Shag, S.W.A.T mod leader, designer, coder.*

Do not change the `Owner`!!! In a Class, `Owner` is the class that spawned the first one. That surely messes up many things.

*Comment from Mike Lambert, a.k.a. Mongo:*

And if your tick-based one is jerky in netplay, try setting the `RemoteRole` to a `ROLE_SimulatedProxy` and simulating the tick 
function. See if that helps any.
 
## 14. How do you stop bots from picking up inventory items?

You need to modify the pickup class and override the `BotDesireability` function.

You can also override the `PickupQuery` for your purposes if you are creating a new or derived gametype. There is also a
`HandlePickupQuery` function available to Mutators. You may be able to use that.
 
## 15. The Pawn Class has a member "bool bBehindView." Normally, when this is true, the player's model is drawn on their own screen (if in view), otherwise not. My question is, where is the "if (bBehindView) DrawMe()?"

Yes, your own body/mesh is only drawn if you set `bBehindView == true`. There's nothing you can do about that. However, 
you can use it as a simple 'drawself' var alone, since you can override the camera functions. There's code in `PlayerCalcView`
that moves your view back to create the effect you see, which can be overrriden in a subclass.
 
## 16. i want to change the skin of a decoration via a trigger, but i cannot figure out how to use the TriggeredTexture trigger. i heared this trigger would be somehow buggy - has anyone of you tried this once ? i have a 'head' in my modification that should 'talk' - therefore i would like to change the skin of the head - toggle open mouth /closed - eventually a blink.... any ideas how i could archive this ?

Do you want this to be triggered by events that occur in the map, or just to display a sequence of mouth movements and 
whatnot? We've done some really nice things with Unreal Movie Studio with scripts for long sequences of skin changes
on models in order to do lip synching... check it out at http://www.unframed.org/ums/index.htm ... hope that helps!
 
## 17. My HUDMutator is not receiving Post Render calls, why?

Make sure you have, `bHudMutator=true` set in the `defaultproperties`.
 
## 18. Does anyone know what these RemoteRole's do exactly. I understand SimulatedProxies but, what about these:

```
  ROLE_DumbProxy,       // Dumb proxy of this actor.
  ROLE_AutonomousProxy, // Locally autonomous proxy of this actor.
```
	
*Comment #1:*

DumbProxies get their postion, velocity, and animation frame replicated from the client to the server every so often 
(unlike simulated proxies which attempt to make predictions and perform physics on the client). AutonomousProxy is the
`PlayerPawn`, and I think that that is the only class that uses that role. As we have discussed before, the `PlayerPawn`
has some strange replication features, like not all functions needing to be simulated to run on the client.

*Comment #2:*

If you take a look at the Network Architecture doc at the Unreal Tech site it has a nice list of what each of these are.
Here are some excerpts:

> "Role==ROLE_DumbProxy means the actor is a temporary, approximate proxy which should not simulate any physics at all.  
> On the client, dumb proxies just sit around and are only moved or updated when the server replicates a new location, 
> rotation, or animation information.
> This situation is only seen in network clients, never for network servers or single-player games."
>
> "Role==ROLE_AutonomousProxy means the actor is the local player. Autonomous proxies have special logic built in for 
> client-side prediction (rather than simulation) of movement.
> This situation is only seen in network clients, never for network servers or single-player games."

 
# 19. Anyone know what MoveTo does internally? According to the brief comment line in the UScript source it moves the object towards the vector that's sent in as a parameter and the object is rotated towards the vector, and I assume it uses the RotationRate of the object to accomplish this. Anyone know for sure? Also, how does GroundSpeed/WaterSpeed/Acceleration/AccelRate interact with each other internal in the UT engine?

`MoveTo` causes the pawn to head for that location at `GroundSpeed` by default, unless you pass in the optional parameter, 
in which case it's limited by the `maxspeed`. And yes, it uses the `RotationRate` until the yaw points to the location in the
`moveTo`. So it moves and rotates at the same time.

`GroundSpeed` is the max velocity when `PHYS_Walking/Running` (whichever), `WaterSpeed` is max velocity when swimming, 
`AirSpeed` is when flying/falling, and `AccelRate`, well, I can only assume that it is for the max acceleration of the actor.
Oh, and where you see 'velocity', read that as scalar value (length of vector) of velocity.

Additional Comment:

Actually I believe the Engine checks the Physics of the object and moves it with the appropriate speed property, i.e.

`Walking/Running` = `GroundSpeed`, `Flying` = `AirSpeed`, etc.

 
## 20. Ok, Im having problems with some simple maths in a mutator I am working on. More specifically, divisions. Basically I want to `(((x - y)/x) + z)`

It isn't working. If for eg, `z` is set to `1` and all the others are other values, the result of the routine is `1`, as if the rest 
are `null`. Could someone give me a quick run down on how to do this simple bit of code. 

*Aaron Leiby from Legend Entertainment, comments:*

Remember if `x` is an INT, then integer division will return an INT. So for example: `(5 - 4)/5 = 0`! In this case, you might 
want to explicitly cast your divisor to a float: `(x-y)/float(x)` (If `x` is already a FLOAT, then I'm not sure what's going on.)
 
## 21. Has anyone seen any examples for the dynamic loading of texture data directly from a data file during run time? Also does anyone know how to set the MASK attribute when you use #exec texture import definition? I looked at the unreal.epicgames.com site and the #exec commands weren't documented..

An example can be found at `Botpack.ChallengeHUD`. Look at how the `CrossHairTextures` are loaded. I believe when 
you do a dynamic load, you must specify the full qualified class name `{package.class}`. I cannot remember the `MASK` 
attribute stuff off-hand. I believe alpha is black by default. You will have to check. I think I used UnrealEd to 
define that and then I placed it into my own `.utx`.

The arguments to load at run time are: `DynamicLoadObject(String, Class)`. If I recall correctly, a class is returned 
which you must cast to what you desire. You may also want to check `SetMultiSkin` and `SetSkinElement` in the `Pawn` class.

```
CrossHairTextures[c] = Texture(DynamicLoadObject(CrossHairs[c], class'Texture'));
```

The `#exec` statements looks under your project directory. 

```
#exec TEXTURE IMPORT NAME=HUDWeapons FILE=TEXTURES\HUD\HudElements2.PCX GROUP="Icons" MIPS=OFF FLAGS=2
```

The line above will look at Your Project/Textures/HUD for `HudElements2.pcx` and place it into an `Icons` group. So, you call it
like `local Texture T; T=Texture'Botpack.Icons.HUDWeapons'` or `T= Texture'BotPack.HUDWeapons'`

What is cool is `ucc` will let you know if it cannot find the textures. If found, they are placed into your `package.u`. 

Above is a hint of pseudo code. You can also create your own `.utx` then import your custom package using lines like this: 

```
#exec OBJ LOAD FILE=..\Textures\LadrStatic.utx PACKAGE=Botpack.LadrStatic 
```

That line tells ucc to go to the main `Textures` directory and get the `utx` file. This is as brief as I could make my 
explanation. I learned trial-and-error. There are some great docs at Unreal Tech Site though.

*Comment #2:*

You can see what all the flags are by trial and error using UnrealEd. Import a texture using whatever settings you want, 
then display the Log window to see what the import statement looks like.

*Comment #3:*

Black is not necessarily the "transparent" color in a masked texture; it just happens to be the most common default. If you
have a program like Paint Shop Pro, load up your texture and then use the Edit Palette feature. Then, set the RGB value of the
first palette entry to some color you don't want to use, like hot pink or whatever. This will be the transparent color when
you import; the Unreal engine always masks using the first palette entry, regardless of its RGB value. Set the RGB value of
some other entry in the palette to 0,0,0 for black and that should be all you need.

*Comment #4:*

To get the masked effect, add `FLAGS=2` to the `#exec` line.
 
## 23. I am trying to write a "ScoreKill" function that check for a player killing thier teamate, but it only works in CTF for some reason.

My guess is that you have Friendly Fire at 0%. AFAIK `ScoreKill` won't be called then...

*Comment #2:*

So, the `DeathMatchPlus` code of `ScoreKill` is only called when you killed someone of another team. And the team game `ScoreKill` 
code doesn't call `BaseMutator.ScoreKill`.
 
## 24. Can anyone give me a quick rundown of all the possible reasons a Spawn function would return as NONE?

Spawn an actor. Returns an actor of the specified class, not of class Actor (this is hardcoded in the compiler).

Returns `None` if the actor could not be spawned (either the actor wouldn't fit in the specified location, or the actor list 
is full). 

Defaults to spawning at the spawner's location. 

So you have to check for the right class (especially when using `Dynamicloadobject`) and if there's place for spawning the actor.
 
## 25. I am working on some neat weapon ideas. I have a weapon called Blaster (modified Super Shock Rifle) which adds all sorts of things, such as HUD elements, changed functionality, etc. Here's a problem - when I am testing a network game, clients don't see the blast fired, nor they see the weapon as another player holds it. I understand some basic rules on Replication, but I feel that I'm missing something entirely different, such as NetRole. Any ideas?

I experienced this same problem the other night and I thought to myself, "I don't understand replication after all these 
talks in the group, code, and network docs, I am an idiot". Then I looked in my client log and noticed the server did not
send my mod package to the client (GUID ID #). So, I quickly went to my `UnrealTournament.ini` file and added the 
`ServerPackage=MyMod` line and all was well. Even though, the client had the same mod, he would not load it in a network
game w/o that line.

Also be sure to make a `upkg` file. These are documented in the UnrealScript Black Magic Document at the Tech Page, in 
the "Package flags for package control." section.
