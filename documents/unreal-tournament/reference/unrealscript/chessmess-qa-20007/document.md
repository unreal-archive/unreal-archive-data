## 1. How can i set it so that activating a trigger from within a level changes something in my custom HUD?

See April Q&A; Question 16.

You may want to check out `Engine.Dispatcher` class. The only complication is your're trying
to change something in a purely client side object->HUD. This could turn into a nasty replication
issue meaning you'll need a `ReplicationInfo` or `TournamentPlayer` subclass and call a replicated
function to tell the client to tell his HUD to display whatever.

There may be another way but, this is how I might approach it.
 
 
## 2. Is there an #EXEC command to flip the vertex normals on a mesh import?

First make sure your model is centered at the origin (0,0,0) and that its' dimension fits within 
the -128....128 range. Funky things like this happens if any of these basic rules are violated. 
Also, make sure all animation frames fit within that cube boundary.

Next, you can try flipping the normals in 3DS Max. If you're not familiar with 3DS Max:
 - load the mesh into your scene
 - click on the mesh to select it
 - next, go to Edit Mesh Modifier->Face. Select all the polys. 
 - If you move the UI up, you'll see the Flip Normals button.
 - When you click it all the normals will be inverted.

This is how I invert the normals before exporting.

Brushes can be a little easier to invert in UnrealEd.

There are some excellent tuts on 3ds max-> www.3dcafe.com if you want to learn how to use it really well...

Finally, you can try playing with the `#exec scale` command

```
#exec MESHMAP SCALE MESHMAP=MYMesh X=0.1 Y=0.1 Z=0.2
```

simply change the axis to mirror the mesh to the negative value... maybe this helps.. ie:

```
#exec MESHMAP SCALE MESHMAP=MYMesh X=0.1 Y=-0.1 Z=0.2
```

You can also try:

```
#exec MESH FLIPFACES MESH=MeshSk
```
 
 
## 3. My object doesn't enter it's auto state.

Every class that uses states should have one and only one state with the keyword `auto`.

The object will automatically enter this state when it's created -- as long as `bStatic == false`.


## 4. How do I stop the carcass from gabbing the view?

Put a check in the `Tick()` of the deathcam to see if it has the view... if not, take it back.
 

## 5. Is there a functional IRC client in UT? What about a server?

There is a client, it's used for the chat windows, before joining a multiplayer game. Check out the class `UBrowserBufferedIRCLink`. 

There's no server functionality that comes with UT. Check out [UT IRC reporter (UTR)](https://web.archive.org/web/20010602033321/http://www.planetunreal.com/utreporter/).
 

# 6. How can I change the brightness of various lights from UnrealScript?

First, make sure the lights you want to control all have `bDynamicLight` set to true. Then, go 
through all the `ZoneInfo`s and change the `AmbientBrightness`.

You can also go through all the lights on a level and change their brightness. Also, check
out the [MoodLighting](https://unrealarchive.org/mutators/unreal-tournament/M/mood-lighting_915b9620.html) mod. 

Note that no one seems to have actually gotten this to work, so it may not be possible.
 
## 7. How can I create a patch of fog that moves around?

To Create A BASIC fog:

I created a class that looks a lot like the shortsmokegen, and this is the code I wrote:

```
class FogMaker extends SmokeGenerator; 
Auto State Active
{
    Simulated function Timer()
    {
        local Effects d;
        d = Spawn(GenerationType);
        d.DrawScale = BasePuffSize+FRand()*SizeVariance;
        d.RemoteRole = ROLE_None; 
        if (SpriteSmokePuff(d)!=None) SpriteSmokePuff(d).RisingRate = RisingVelocity; 
        i++;
        if (i>TotalNumPuffs && TotalNumPuffs!=0) Destroy();
    }
} 
simulated function PostBeginPlay()
{
    SetTimer(SmokeDelay+FRand()*SmokeDelay,True);
    Super.PostBeginPlay();
} 
defaultproperties
{
    SmokeDelay=0.120000
    BasePuffSize=30.500000
    TotalNumPuffs=100
    RisingVelocity=0.200000
    RemoteRole=ROLE_SimulatedProxy
}
```

First off notice I kicked up the `BasePuffSize` And the `TotalNumPuffs`, then killed the rising velocity.

Then to call it just do this

```
local actor myFog;
myFog = Spawn(class'FogMaker');
myFog.RemoteRole = ROLE_None;
```

You can also try using sprites, set out a bunch of them like the rocket trail. Watch out, this can
do nasty things to your frame rate. You can also take a look at the smoke grenade.

Also, It might be worth a try to subclass the `ZoneInfo`. In your subclass, replace the constant
with a variable. I don't know if the engine takes it into account, but it is worth a try.


## 8. Is there any way to extract a mesh from a .u file?

Nope. Epic hasn't released the file format, nobody has reverse engineered it, and there are no tools to do 
it. Apparently, the format is complicated.
 
## 9. Does Unreal Tournament have a skeletal animation system?

UT does not have a skeletal animation system. The Unreal Engine has it but it's for licensees only.
Epic has said they are not making it available to UT. I do believe U2 will have it. Of course, this
might have changed but that was Epic last announced stance. Check out what Brandon "GreenMarine"
Reinhart said on GameSpy:

> There are two ways to animate computer models -- in layman's terms, Vertex Animation is very 
> mechanical, and involves moving the model as you would a clay dummy and saving each frame.
> Skeletal Animation is more organic, and involves placing a stick-figure-like frame inside the 
> model (bones) if you will. The model is moved by moving the bones around, and the game
> automatically moves the limbs those bones are attached to. Skeletal animation is a more
> exciting technology, because it allows developers to make more complex animations, save them
> easier, and make better use of technologies like motion capture. The latest version of the
> Unreal Engine has skeletal animation in place and working; Reinhart showed GameSpy a demo
> featuring a very complex character model fluidly moving. He turned on the wireframe to
> demonstrate the bone structure.
> 
> Finally, he demonstrated a character model who used skeletal animation for his face -- the
> eyebrows, cheeks, hair, eyeballs, etc. were all tied into a skeletal framework, which made
> it possible to create a variety of facial animations. The character winked, blinked, sneered,
> etc. It was a good demonstration of the greater power developers will have with the new 
> technology being built into the engine.
>
> What next? Well, in a few weeks, Epic will wrap it up with the Unreal Tournament code and
> declare it done. Then all further changes to the engine will geared toward their next game,
> and of course available to engine licensees." 

Catch the [interview at GameSpy](https://web.archive.org/web/20010613184130/http://gamespy.com/gdc/unreal_b.shtm).

Also, check out:

```
var Animation SkelAnim;
```

and

```
// Skeletal animation linkup.
native final function LinkSkelAnim( Animation Anim );
```

## 10. How do you change/remove the splash screens?

Some people think that, without licencing the engine (which costs a couple hundred thousand
dollars), you can't. Others think that the background UT logo is puzzled together from 
256x256 pcx files in `botpack.u`. Also, playing with the BMP files in the help directory
might get you somewhere.

 
## 11. Is there a way to change the falling speed? e.g. the player's velocity when Physics==PHYS_FALLING?

Change the `AirSpeed` attribute in the `Pawn` class, and/or change the `Velocity.Z` field.

 
## 12. Where is the code that does the Speech/Orders Menu?

The speech menu is displayed from the KeyEvent function in class `UTConsole`. `UTMenu.UTConsole` & `UTMenu.SpeechWindow`.


## 13. Can I get an animated texture to ALWAYS start at frame 0 when a new item that uses that texture is spawned?

Nope. You'll have to animate it manually in a tick function or something yourself. Put the textures in an array, like this:

```
defaultproperties {
  SmokePuffs(0)=Texture'Chaostex.Smoke.ringpuff1_a01'
  SmokePuffs(1)=Texture'Chaostex.Smoke.ringpuff2_a01'
  SmokePuffs(2)=Texture'Chaostex.Smoke.ringpuff3_a01'
  SmokePuffs(3)=Texture'Chaostex.Smoke.ringpuff4_a01'
  SmokePuffs(4)=Texture'Chaostex.Smoke.ringpuff5_a01'
}
```
 
# 14. I put pawns (e.g. Unreal 1 monsters) into my level in UnrealEd. Why don't they show up?

Set `Level.Game.bNoMonsters` and `Level.Game.bHumansOnly` to false. Also, try setting it to a single player game.
 

## 15. How does transparency work in the HUD?

Note: "opaque" is the opposite of transparent, you can't see through it. If something is 100% opaque,
it completely blocks whatever is behind it. If it's 75% opaque, it's a little bit transparent, so you
can see through it a little bit. 0% opaque is 100% transparent, i.e. it's invisible, it's not drawn
at all.

Note: `#EXEC IMPORT` with `FLAGS=2` is the same as having the texture property flag `bTranslucent` 
set within Ued2. This makes first colour in the palette 100% transparent.

The rendering styles, as defined in `Actor.uc`, are:

```
// Style for rendering sprites, meshes.
var(Display) enum ERenderStyle
{
     STY_None,
     STY_Normal,
     STY_Masked,
     STY_Translucent,
     STY_Modulated,
} Style;
```

- "None" means the graphics aren't drawn at all.
- "Normal" means every pixel is 100% opaque, unless you #EXEC IMPORT it with MASK=2. In that case,
  every pixel that uses the first entry in the pallette will be 100% transparent, and the rest will be
  100% opaque.
- "Masked" means each pixel is 100% opaque, except the first entry in the pallette, which is 100%
  transparent.
- "Translucent" means the brightness of the color is also it's opaqueness, i.e. white is 100% opaque,
  a middle bright colour such as grey or medium yellow is partially transparent, and black is
  completely invisible. This doesn't work well in some configurations (possibly MacOS + Glide) unless 
  the `#EXEC IMPORT` also has `MASK=2`. So, always use `MASK=2` with any texture you plan to draw 
  `STY_Translucent`.
- "Modulated" works like this:
```
  color 0,0,0 = darken screen
  color 127,127,127 = no change
  color 255, 255, 255 = brightens screen
```

Also, there's a utility called "Bright," distributed by Epic, that helps with this. It has a command
line option "`-pinkmask`" that makes all pink pixels (R=255, G=0, B=255) transparent, and all others
opaque.

There's also a `bHidden` attribute.


## 16. Is there a way to speed up creation of the root window?

You have to change the root subclass in the console before creating the root to your custom root
window. There create a custom MenuBar that doesn't automatically load the mod menu. This really
speeds up the root creation, because the `GetNextIntDesc` is the function that slows it down.

Then you can give players the possibility to load the mod menu with a dialog that asks if it
should be loaded when clicking the MOD item.
 

## 17. How do you make a player invisible, so that other players can't see him/her and the bots ignore him/her?

To make the player invisible to others (i.e. not rendered), set `bHidden = true`. To make the
player mostly invisible to bots, set visibility to a low number. This is how cloaking works.

However, you can't set it to 0. If you want the bots to completely ignore the player, in every
bot's `Tick()` function, check the `Enemy`. If the enemy is supposed to be invisible, set the
enemy to `None`.
 

## 18. If you have a class that isn't derived from Actor, why must none of its fields refer to Actors?

If they do when the level ends, the game will crash. This has something to do with garbage
collection. Suffice it to say, either don't have non-Actors refer to Actors, or be very
careful to always set those fields to None before the end of a game. Note that you get this
problem whether the type of reference is Object or Actor. It's the type of the object that's
referred to, not the type of the reference. 
