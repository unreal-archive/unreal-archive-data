# 1. Anyone know of the proper way to code C++ DLL's that you can access via UnrealScript?  Do I need to be a licensed developer?

You don't need to be a licensee, you just need the public headers for the version of UT that you're working on. 

Unfortunately, only the 402 headers have been released, and your DLL file will only work on 402. Blitz (Sleepwalker TC) 
and I did up DLL tutorial which you can find here: http://www.sleepwalkertc.com/members/blitz/native/native.html You 
can find the 402 public headers at: http://openut.sourceforge.net/.
 
# 2. Good information regarding the use custom player skins and the use of SetMultiSkin()? 

If you are going to use the `SetMultiSkin` stuff, and want too use the FaceSkin stuff, you NEED to subclass `TournamentPlayer`, 
instead of `PlayerPawn`. When you do that, there are a few important vars that you need to set to get the skins to appear 
correctly. 

The following four variables must be set to the element of the skin array that corresponds to that variable.

- `FaceSkin`
- `FixedSkin`
- `TeamSkin1`
- `TeamSkin2`

Hopefully the above should be self-explanatory. All four of them should be set, even if they are set to 0. Unreal(ed)'s 
exporting doesn't show a property if its set to the default value (0), so that is why Epic's code looks like they left 
those properties alone. In fact, Epic's code probably has them specifically set to 0, and you should too, to make things 
easier to understand. 

The TeamSkin1/2 are used in regular games, and those are the only parts of the mesh that are changed when you go into a
team game (to the T_0/1/2/3 skins to identify your color). The fixed skin is a basic part of the skin that is independent 
of color, and you know what the face skin is.

You also should to set these to ensure defaults will work when strange things happen:

- `DefaultSkinName`
- `DefaultPackage`

An example would be:

```
  DefaultSkinName="CommandoSkins.cmdo"
  DefaultPackage="CommandoSkins."
```

Notice the placement of the periods. One is the default package to look for skins for this `PlayerPawn` in, and the other
is the default basic skin to use when it isn't told what to use.
 
## 3. How do you define a coerce string?

For a local definition within a function:

```
  Function MyFunc(coerce string MyString);
```

You can also typecast variables into strings...for example: string(MyInt)

If you want to define it for a an entire class so that it can be used anywhere:

```
  class TeamSatellite expands Actor;

  var localized string AcqFailedMsg;

  defaultproperties
  {
    AcqFailedMsg="Failed to spawn Actor"
  }
```

Note that 'localized' replaces the use of 'coerce' for this. Localized refers to language specifics but has the additional 
affect of 'coercing' all values to strings.
 
## 4. How can I spawn items in the entry level? The entry level can be used to persist objects across levels as mentioned in Brandon Reinharts 'BlackMagic' document at the unreal.epicgames.com site.

The entry level is always the first level spawned and there is a variable you can use to spawn anything in the entry level
because the entry level is always there and it is always the first level to spawn. The variable declaration is:

```
  EntryLevel=LevelInfo'Entry.LevelInfo0'
``` 

In order to spawn objects in it you would do: 

If you are in UWindows, you can use:

```
  ClassVar = GetEntryLevel().Spawn(....)
```

If you have a reference to a `PlayerPawn`, use:

```
  ClassVar = PlayerPawn.GetEntryLevel().Spawn(...)
```
 
## 5. I am trying to set the collision properties on a model I created for UT . I am having a problem figuring out how to set the CollisionRadius & CollisionHeight properties. Do you compute the CollisionRadius from the pivot point outwards (which is what I have been assuming but it does not seem to work right)? Also, is the CollisionHeight measured from the pivot also?

The `CollisionHeight` is doubled to create the full height of an actor. The height extends `CollisionHeight` units above and below 
the Location's vector. The `CollisionRadius` extends in each direction from the Location as well. So in effect, you create a
cylinder around the location.

`PrePivot` has nothing to do with the collision. `PrePivot` decides how much you want to move the actor's mesh/texture before it is
drawn. It allows you to offset the mesh from the actual location and collision stuff. Also, if this is a building... a regular actor 
is limited to a plain old cylinder with collision. If this is a building, it'd be a much better idea to import it as level geometry
and have the level designer place it in his level. Then it will have a collision size according to its shape.
 
## 6. Anyone know how the CTF flags attach to a pawn. They never seem to get their based changed to a pawn.

`CTFFlag` has an intrinsic attachment to the `Pawn` class via the `HasFlag` property of the `PlayerReplicationInfo` class. There is 
code in the engine to draw whatever decoration is assigned to this property.
 
## 7. When the player is just standing there, their point of view moves slowly up and down, like they're breathing. This is separate from the breathing animation that other people see. Is there anyway to turn off this first person breathing while still being able to turn and move?

Turn your `ViewBob` to zero, see `defaultproperties` of `PlayerPawn`.
 
## 8. Is there any way to play movies (mpg, avi) in unreal? Not *in* a level, but for cut scenes and the like? Or are in-game cut scenes the only way?

Well, with access to the UT headers (I don't know what the last version that was released publicly) you should be able to make 
a native trigger that hooks into a dll from Smacker or some other video player. You could also try using the Unreal Movie Studio,
available from http://www.machinima.com/unframed/ums/ available with various tutorials.
 
## 9. Is it possible to stop a sound that's already playing. Let's say I do a PlaySound(sound 'mysound',SLOT_Talk).. is there a StopSound(SLOT_Talk)?

Currently there is no way to do this in UT. While the code to do it is out there (its implemented in Wheel of Time) it remains in 
Epic's hands to integrate this capability into the game.
 
## 10. Can I reference an enumerated variable outside of the class I defined it in?

Not with the current release (413).
 
## 11. If you want your bots to do more than mindless killing in your mod here is some info that could help.

If you want the bots to have any intelligence besides mindless killing, it will need to subclass `TeamGamePlus`. For example, 
HeadHunters had to do this to make the bots know when to return heads, even though it is not a team game. Just subclass 
`TeamGamePlus`, and override all the team-specific functions with functions that don't do anything like this:

```
function Foo()
{
  Super(DeathMatchPlus).Foo();
}
```

That way all calls to those functions will look like their just a `DeathMatchPlus` game.

With the sub-class of `TeamGamePlus` you can now use the `FindSpecialAttractionFor()` function to get bots to attack players carrying
the flag or whatever the needs of your particular mod are.
 
## 12. Is there a way for a mutator, not a game type, to change the text that is displayed when you look at someone (instead of showing name, health, show name and model name) or any other info?

The mutator does make this a little more difficult since the drawing of that information is in `DrawIdentityInfo` and 
`TraceIdentity` and such, but HUDs in mutators are mutators themselves, not derived from `ChallengeHUD`.

Since there is not currently a mutator hook for this you will have to change the gametype's `HUDType` into your own in your
mutator's `PostBeginPlay()` function.
 
## 13. What in the weapons code makes weapons continue to fire if you hold down the Fire key/button?
 
Most of the weapons `Fire()` functions switch it to the `Firing` state. That state continues until out of ammo or until you stop 
firing. 

If you want to `Fire` with a function like `MyFire`

```
exec function MyFire()
{
  Fire()
} 
```

You need to add this in your `User.ini`:

```
Aliases[26]=(Command="Button bFire | MyFire",Alias=MyFire)
``` 

...and bind your function with a key. If you forget to put the `Alias`, you won't be able to have a continuous fire.

## 14. How do I create a building that can take damage?

Make the actor a mover brush in UnrealEd..
