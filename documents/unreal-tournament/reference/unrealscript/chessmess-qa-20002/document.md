## 1. If you're releasing an updated version of your mod/mutator here are some important things to know about UT versioning.

UnrealTournament has some issues with versioning control that you should be aware of. To identify those issues we first need to 
understand how versioning works in the current release (405b):

Fact: Each time an Unreal Tournament package is compiled with `ucc`, a unique identifier called a GUID (Globally Unique IDentifier) 
is assigned to the package.

Ok first we have to identify the two possible methods under which a version of a given mod can be placed on a users computer. 
The first method  we'll call the 'cache' method' and the second we'll call the 'umod' method. Under the 'cache' method the 
user gets the mod from the server they are connecting to while they are playing UT. Under the 'umod' method the user 
installs the mod on their computer via a .umod file (or manually from a zip file). 

Now to understand where the problem lies you need to know  what happens when a user logs onto a server that is running a mod:

1. The server sends the client (ie the players computer) the package name, and package GUID.
2. UT Checks in all its directories for a file by the name of package name.
3. If it finds one, it checks its GUID. <br/>
   If the GUIDs of the server's package and the players package match then UT loads the client side mod and uses it.<br/>
   If the GUIDs do not match it gives a 'Version Mismatch' error and the client is disconnected from the server.
4. If it cannot find a package by the appropriate name on the players computer, it then moves on:
5. It searches the cache directory for a .uxx file with the appropriate GUID as the server specified. if it finds one, 
   it loads it and uses it.
6. If it does not find the file(s), it attempts to download it/them from the server (assuming the upkg file allows it)
7. Upon downloading it, it puts it in the cache folder where it will eventually be removed from the cache in some number of days
   defined by the player (default = 30 days).

Now lets say you've released version 2.0 of your mod. As long as the user never manually installs the files onto the PC 
(ie. via a .umod file) then they should be fine. Problems appear when the user installs the mod via a .umod file 
(or manually from a zip) or use some cache moving program and then tries to connect to a server running a newer version 
of the mod. 

In these cases they will get the 'version mismatch' error and won't be allowed to connect. While I don't have numbers to
back this up, I'd bet money that the majority of players who play mods install them via .umod files made available for
download by the mod's developer. 

You have two roads to take to address this. The first is to ensure that the user never installs your mod via the umod method
and only gets you're mod off the servers they connect to. This is, of course, totally dumb. you're only real alternative is
to rename your package with each release. This has the nasty side effect of leaving unwanted files (from the previous versions)
on the client machines as well as ini entries that are no longer needed or unnecessarily duplicated. 

Because of this you need to be sure to include instructions in you're release notes files on what the player needs to do to 
'cleanup' from the prior release (not that they'll read and do what you tell them to do). With this method you only want to
release Major versions as you'll soon gather ill will if players are constantly having to upgrade and perform clean-ups. 

The following is a task list of things to do when going this route:

1. Rename MyMod010 package dir to MyMod011
2. Check to make sure you update any references to the class (ie class'MyMod010.classname' changes to class'MyMod011.classname')
3. Update the .int file to reflect this change in package name and to
4. Indicate the version in the Mod name displayed to the user
5. Update the .ini file, if you rename the .ini to match the mod package name be sure to search the code for references and update them.
6. Update the .upkg file
7. Update you're UMOD definition file
8. Recompile source
9. Rebuild UMOD

Step two is obvious but easy to overlook. So always search through all source files for the package name to see if it was used
anywhere. It's easy to forget a little "`class.myPackage.myClass`" somewhere and then get puzzled why it works on your system
(where that class might exist) but not on some other system (where the old mod wasn't installed). Step five follows the same rules.

Remember to be aware of any INI files you use that contain configuration information. If you rename your package then the INI file
name changes and the server operator will have to move the ini info over from the old ini file to the new one manually. If you
overwrite the package, and thus the INI file, then the contents of the original INI file are completely lost. Ideally, the two INI's
should be merged, i.e. any var that already exists stays and any new vars are added to it (since new releases may add new 
config vars). 

Be sure to post necessary instructions for server operators regarding ini changes/moves/etc in your release notes.

Multiple versioning has one another problem that's specific to mutators. If a user installs versions 1.0, 1.1, and 1.2 of 
a mutator, then they will have all three mutators listed in my mutators list, and three different modmenuitems. 

You'll have to include instructions in your release notes letting the player know how to remove the older versions.

One final tip regarding versioning is that there is one method for keeping `.u` compatibility between releases. 
Find a copy of the original .u package that you've released. Create a `SystemConform` directory 
(`C:\UnrealTournament\systemconform`) next to your `UnrealTournament\system` directory. Place the original `.u` in the 
`systemconform` directory. When you compile the new version of your `.u`, it will be net-compatible with the version that
exists in the `systemconform` directory.

Regarding net-compatible `.u` files, they will only work if you do not change what passes over the network. This means that
you cannot create any new classes that the client will see, or any new variables that are replicated to the client. New
client code is okay, but people using the older `.u` will not see the new client code, but rather use the old one.
 
## 2. Is there an easy way  to recolor the current viewport? I'd like to have the viewport have a red transparency to it or green, etc.

Try the `ViewFlash` code, it is used for the red tinge when you fire the Redeemer. You can fog any color at varying degrees.
If you want an example of an effect over the screen look at the Redeemer's static explosion code. `Viewflash` does work really 
well, too, especially in that you can fade things to black (or reverse). Attaching a texture to the viewport would be good if
the viewport is a TV screen, where you can cycle between textures with static, etc. However, for a pure color filter try the
view fogging. 

Check the following functions that exist in `PlayerPawn`. They are used in various weapon effect flashes (if you turn them on
via Preferences), and they're used for when you get damaged (the red tint): 

```
function ClientFlash( float scale, vector fog ) 
function ClientInstantFlash( float scale, vector fog ) 
function ClientAdjustGlow( float scale, vector fog )
``` 

The last one is the one that does permanent color changes, until undone. Not sure of the difference between the first and the
second ones, though. Check how they are used in game, and it should become more obvious
 
## 3. Is there an easy way to add a tab to the server browser that would show servers playing my own game type?

With the next patch (406), mod authors can finally add their own `UBrowser` tabs. I'd recommend not to mess with the INI/INT
files, which is another method you can do to accomplish this, and just wait for the next patch. But if you must then you can
find a tutorial on how to do this here: http://www.unreality.org/universe/tabs.htm
 
## 4. How can I do an intro text on the screen when the game starts? I want to be able to tell the players the rules of the game.

There are a few methods you can use to do this. The easiest way is to set the `defaultproperty` variables in the gametype to show
what you want. Take a look at `DeathMatchPlus` and you'll see the variables `StartupMessage` and `StartupTeamTrailer` that you can
use to some extent. 

Some custom code to do this follows:

```
class TagMessage extends LocalMessagePlus;

static function string GetString(
  optional int Switch,
  optional PlayerReplicationInfo RelatedPRI_1,
  optional PlayerReplicationInfo RelatedPRI_2,
  optional Object OptionalObject
)
{
  return("Your custom message goes here!");
}


static function int GetFontSize( int Switch )
{
  return 2;
}

static function float GetOffset(int Switch, float YL, float ClipY )
{
  return (Default.YPos/768.0) * ClipY + YL;
}

defaultproperties
{
  bIsSpecial=True
  bIsUnique=True
  bFadeMessage=True
  DrawColor=(G=0,B=0)
  YPos=196.000000
  bCenter=True
}
```

If you're doing a new game type you might want to call `PlayerPawn.BroadcastLocalizedMessage( class'TagMessage' )` from 
`RestartPlayer`, or if you are doing a mutator then in `ModifyPlayer`. If you just want it to pop up once, then you might have 
to add a flag variable somewhere.
 
## 5. Why you don't want to set a players state (ie walking, flying, etc) in PreBeginPlay(), BeginPlay() and PostBeginPlay(). 

`SetInitialState()` (see `Object.uc`) gets called after `PreBeginPlay()`, `BeginPlay()` and `PostBeginPlay()`. 

Therefore, any state you set in these functions will get ignored since the initial state doesn't get set until 
afterwards, thus overriding the state you just put the player in. 
 
## 6. What does the OUT mean when its in front of variables in function parameters. An example of this would be: Function MutatorTakeDamage( out int ActualDamage, Pawn Victim, Pawn InstigatedBy, out Vector HitLocation,out Vector Momentum, name DamageType)

Think of out variables in UnrealScript as you would references in C/C++;

```
function Foo( out int i );
void MyClass::Foo( int &i );
```

Basically, they're return variables that get passed in as parameters rather than being declared as the return type. This allows you to do stuff like having a function that needs to return more than one variable.
 
## 7. How can I force a player to be a specific class in my gametype class?

You can use the new `Mutator.ModifyLogin(SpawnClass, Portal, Options)` function (called from `GameInfo.Login()` to modify the 
`Options` string. This applies to versions 413 and greater. Otherwise you can do the following...

Derive your own GameType class (UScriptSpeak: create a class which expands `DeathMatchPlus`, etc). Derive your own `PlayerPawn` 
class (UScriptSpeak: create a class which expands `PlayerPawn`). In the event function, call your parent class' `Login` function 
and pass it a reference to your new and improved `PlayerPawn` class:

```
function PlayerPawn Login(string Portal, string Options, out string Error, class<playerpawn> SpawnClass)
{
   SpawnClass = class'MyNiftyPlayerPawn';
   Super.Login(Portal, Options, Error, SpawnClass);
}
```

Since your `PlayerPawn` class inherits from the original `PlayerPawn`, the parent `GameType` class will swallow the modified 
class without complaint.
 
## 8. How do I invert the direction of the normal skin on a mesh I am importing?

Use `UNMIRROR=1` in the `#exec` statement. If anyone has an example of the syntax for the `#exec `and the use of `UNMIRROR` please
email me and I'll put it in.
 
## 9. Did you know about the bExtra keys on player pawns? How about AExtra vars for mouse movement?

There are four additional input keys for use that are defined in the `PlayerPawn` class that you can use. These keys are 
`bExtra0`, `bExtra1`, `bExtra2`, and `bExtra3`. Use them for special functionality you want to provide in your mod. There are also a 
few extra vars. `aExtra0`, etc, which are used for axis vars (like `aMouseX` and `aMouseY` stuff).
 
## 10. How can I make a key toggle such that when its held down one thing happens and when its released another thing happens?

That's already a way to make a toggle key by programming it in, but there's another way, setting up the proper keybinding. At 
the console, type this:

```
Set Input MyKey Mutate MyCommandOn | OnRelease Mutate MyCommandOff
``` 

Substitute MyKey with any valid key (look in your `User.ini` for the list, you can just add this binding there, too) and 
`MyCommandOn/Off` with your Mutate functions. You can also use the same function twice so you only need one 
(as suggested by Hollywood). 

How do you get a user to bind this key? Either you tell them to do this manually in your ReadMe, add it to the `User.ini`
with an UMOD setup, or add a real menu option to select that key! That's the most professional and probably best idea - just a
little bit of additional work. In 406 Epic added the ability to customize the control options menu. You can see an example of this
with the relics (which take advantage of it to allow the player to customize the key used to throw out a relic).
 
## 11. Does anyone know if it's possible to do a picture in picture kind of HUD? At it's simplest, a narrow, rectangular FOV window for the sniper zoom. At it's best a round FOV zoom window.

Use `DrawPortal`. However, be warned that it does induce a performance hit and is buggy and unsupported by Epic. The main problem 
is that sprites/textures will not be drawn correctly using this function. For example:

A copy of your hands and guns are shown in the extra window. You can fix this, by setting the `Weapon.PlayerViewOffset` offscreen, 
drawing the portal, and moving it back to the original location again. 

Effects like explosions and smoke from rockets are not drawn correctly as they appear as if the portal is drawn at screen 
coordinate (0,0), and aren't clipped at all.

There is a tutorial at Chimeric for this and be sure to check out Meltdown's External Sniper Tutorial at his site on
http://www.planetunreal.com/unrealtower  for more more information.
 
## 12. You do not want to directly subclass PlayerReplicationInfo, here is why.

You do not want to directly subclass `PlayerReplicationInfo` for a variety of reasons.

1. There already is a `BotReplicationInfo`. and Bots REQUIRE that, so you'd have to have everything subclass `BotReplicationInfo`
   and waste bandwith.
2. Changing it 'after the fact' is a BIG mess, although possibly `SpawnNotify`s could handle that.
3. It's not the right thing to do.

Brandon Reinhart of Epic suggests the following idea, which I (I being Mongo aka Mike Lambart, author of the Jailbreak mod) have
implemented into JailBreak already with great success. Make a `JBPRI` (JB because of JailBreak, of course :) actor, that subclasses 
`Info`. It contains all the player-specific info you want. In the `Login`, and in the `SpawnBot`, you spawn one of these for 
each played created. In the `Logout`, you delete it.

You need to 'attach' it to the player somehow. First, make the owner of the `JBPRI` the playerpawn/bot, for identifying it with
the player. Or, make a `PRI` field that is set to the `PRI` of the owner. Either way, its important for this so that there is 
some method of identifying WHO this `JBPRI` belongs to.

Then, in your gameinfo, implement a function. Mine is the following:

``` 
function JBPRI getJBPRIfor(pawn Other) {
  local JBPRI pri;
  if (other != none && other.playerreplicationinfo == none) return None;
  foreach allactors(class'JBPRI',pri) {
    if (pri.PRI==Other.PlayerReplicationInfo) return pri;
  }
  return None;
}
```

This gets the correct `JBPRI`, given a pawn. Now, you can do stuff with player-specific variables by just adding them to 
the `JBPRI`. I added all my player-specific stuff there, even though all of it did not need to be replicated to the client. I had
no real good place to store such information. Here is an example of its use:

```
function Killed(pawn Killer, pawn Other, name damageType) {
  local JBPRI pri;
  Super.Killed(Killer,Other,damageType);
  pri = getJBPRIfor(Other);
  pri.isJailed = true;
}
```

That makes the person jailed, so they respawn in the correct location upon respawning.

The only other pitfall you'll need to worry about is replication: Make sure in `JBPRI`, that you've given it a `defaultproperty` 
of `bAlwaysRelevant=true`, so that the server knows to send your `JBPRI` stuff to the client. And then add the appropriate needed
variables (including the `PRI` of `JBPRI`) to the replication statements, so that the clients can use them.

Oh, and although it looks bad that its doing a `foreach` in the `getJBPRIfor`, you're only really iterating through 16 items MAX.
That's not too bad. And as long as you don't unnecessarily call `getJBPRIfor` many times, (eg: store it in a variable for multiple
uses in the same function), you should be fine.
 
## 13. How can I make a player begin in a given state, such as walking, flying dying or custom?

Each `PlayerPawn` has a default property called `PlayerRestartState` (set in `Pawn.uc`). By setting this to the name of the state 
you want you will achieve the desired results.
 
## 14. I have extended the ChallengeHUD class and added a custom HUD element. The problem is, I don't know how to hide it during the following times:

1. Before the game starts
2. While the scoreboard is being viewed 
3. After the game ends.

Here is how I added extended HUD elements to my ChallengeHUD extension.

```
simulated function PostRender(canvas Canvas)
{
   if (bHideHUD ||
      PawnOwner.PlayerReplicationInfo.bIsSpectator ||
      PlayerOwner.bShowScores)
      return;

  // Draw custom HUD elements here 
}
```

Logic is as follows: If `bHideHUD` is not true and the `Pawn` is not a spectator and the `bShowScores` is not true then draw the hud, 
otherwise the '`return`' exists the function and none of the custom hud elements are drawn.
 
## 15. PreBeginPlay(), BeginPlay() and PostBeginPlay are all currently (405b) called twice but this will change in the next patch.

According to Steve Polge of Epic the next patch (406) will fix this so that it only is called once. Be aware of this upcoming
change if you have code that is dependant upon this behavior. An example of proper coding that will won't break follows:

```
var bool bInitialized;

function PostBeginPlay () {
  if (!bInitialized) { /** if its the first time calling PostBeginPlay **/
    /** do you're intiialization stuff **/
    bIntialized = true;
  }
  Super.PostBeginPlay();
}
```

Again this only applies to mutators.
 
## 16. ADD-INI Behavior mod/mutator authors should be aware of.

If you use the ADD-INI functionality when creating your umod you should be aware that ADD-INI does what it says and adds
the INI line entry regardless if it already exists in the file. As users do repeat installs (for version upgrades or whatever)
your use of the ADD-INI functionality will result in multiple lines of the same information being added to the INI file.
 
## 17. Can I use MP3 music in my mods?

Its been rumored that a future patch of UT will include support for MP3s. Until that happens you can do the following:

In UnrealEd, you can import MP3 sounds as easily as you can import wav sounds. Just tell UnrealEd to see '*.*' and load in a
mono MP3 sound, and it will work fine. There are some restrictions on the MP3 sound, which is that the MP3s must mono, 16bit, 
44khz MP3 files.

eRAZOR has coded an MP3 player for use with UT, but it's not the only way to play MP3s in UT. I believe that if you replace your
import sound statements to just import the wav, it will work fine. Unfortunately, another limitation of UT's MP3 support is that
you cannot use the MP3s as music, only sound. So that prevents you from using `SetClientMusic` with MP3s.

The only other way to use MP3s right now is to convert them into a digital format, such as IT.  These are the steps that need to
be followed to go from an MP3 to a digital format:

1. First convert it from MP3 into a WAV file, you can use loads of tools and even WinAmp does it.
2. Convert the WAV file to at least a sample rate of 11025 with 8bit resolution.  I kept mine in stereo, but you could take it
   to mono if you want a smaller size file.  This step is really a trade off between file size and sound quality.
3. Use a program like Modplug, http://www.castlex.com/modplug, to convert the WAV file from the WAV format to IT format. 
   File size should be about the same size as the converted WAV file
4. Import the IT file into a UMX file through UnrealEd.  Again, the file size will be about the same size as the converted WAV/IT file.

Then you can now use the UMX file in UT. I used this method to be able to play an MP3 as custom music in my gametype that overwrites
the music in the level as follows:

```
#exec OBJ LOAD FILE="music\CustomMusic.umx" PACKAGE="Custom"

event PostLogin(PlayerPawn NewPlayer)
{
  Super.PostLogin(NewPlayer);

  NewPlayer.ClientSetMusic(Music(DynamicLoadObject("Custom.CustomMusic", class'Music')), Level.SongSection, Level.CdTrack, MTRAN_Fade);
}
```

The `Super.PostLogin` must be called first, because this actually does a ClientSetMusic that uses the `Level.Song` as the music to 
play. Unfortunately the `Song`, `SongSection`, `CdTrack` variables in Level are all constants so can not be set directly.  Basically
you end up doing two `ClientSetMusic`s, the first fires off the `Level`'s default music, then the second kills that and fires off
your new custom music.

The following is a link to follow for information:
  - http://www.co30.com/mapmusic.htm
  - http://unreal.epicgames.com/audio.htm 
 
## 18.I want to use a particular model of one of the existing UT weapons but I want to apply a different texture to it, how would I do that?

What you do depends upon the weapon you select because some weapons use multiple textures. You can tell if a weapon uses multiple
textures by looking at the #exec statements for the class. Look at the following `#exec` statement for the flak cannon:

```
#exec MESHMAP SETTEXTURE MESHMAP=flakm NUM=0 TEXTURE=Flak_t1
#exec MESHMAP SETTEXTURE MESHMAP=flakm NUM=1 TEXTURE=Flak_t2
#exec MESHMAP SETTEXTURE MESHMAP=flakm NUM=2 TEXTURE=Flak_t3
#exec MESHMAP SETTEXTURE MESHMAP=flakm NUM=3 TEXTURE=Flak_t4
```

This comes from the cannon's script file:  `ut_flakcannon.uc`. They key item to note is the `NUM=` section of the statements. This 
tells you that the object uses multiple textures.

Now we can use UnrealEd to take a look at the textures and even export them allowing us to customize the texture, import it back in
and then use us it instead of the original texture. Here are the steps to export the texture:

The flak cannon resides in `Botpack.U`. This means that, when looking for the texture in UnrealEd, you have to do these things:

- Open UnrealEd and go to the Classes browser
- Load `Botpack.U`
- Go to the Textures browser
- Select `Botpack` as the package
- Go to the 'Skins' group, and find the texture called `Flak_t4`
- Right-click on the texture and choose 'Export'.

Now you will have the PCX file which you can modify as you see fit! 

Ok, so now you have your new texture and you want to apply it to your subclassed weapon. Now I make a point of saying subclassed 
weapon because we are NOT modifying Epic's original code! Doing that would prevent you from playing online and probably cause more 
problems.

Lets say that your have your new texture and its in the form of `MyNewTexture.pcx`. You'll need to take the `.pcx` file and store 
it within a package file. Epic recommends that all textures be stored in a package file with a `.utx` extension (although this is
not enforced and you can in fact store your textures in any package file you want, including your `.u` code file). Use UnrealEd to
import your file into whatever package file you want.

Now that you have the texture in a package file you need to 'import' it within the code.

The first thing we need to do is to import the texture. We have two approaches to this, the first being a method you can use if
you have the new texture in its own `.pcx` file. The following #exec line will cause UT to load the `.pcx` texture: 

```
#exec TEXTURE IMPORT NAME=MyFlakCannonTexture FILE=MODELS\MyFlakCannonTexture.PCX GROUP=Skins FLAGS=2
``` 

The texture then can be referred to as `Texture'WeaponName.Skins.MyFlakCannonTexture'`, which is what you'll need for the 
`defaultproperties` section (keep reading). 

The other `#exec` method works if you have compiled your texture into a `.utx` file. The `.utx` file is a package file created with
either UnrealEd or `UCC` and the `.utx` extension indicates that the contents of the file are textures. The `.utx` extension is only
a naming convention, as UT does not force this rule. You could have code in a `.utx` file, but this would be considered bad form.
You could store the texture in a `.u` package file, but again you want to try to stick to the naming conventions laid out by Epic.

So to import the texture from a texture package file you would use the following #exec statement:

```
#exec OBJ LOAD FILE="textures\MyTextures.utx" PACKAGE="MyTextures"
```

Now we've imported the texture and set the texture for the necessary meshmap, the final thing we need to do is to set the `Skin`
variable in the `defaultproperties` of the weapon. Now in the case of the flak cannon, the weapon itself is made up of multiple
textures as we mentioned above. The following would be what we'd use for our subclassed flak cannon (note it only sets the first
array value, you'd need multiple lines with values 0-3 if you wanted to set the texture for all the slots, as well as multiple 
`#exec`:

```
defaultproperties
{
  MultiSkins(0)=Texture'WeaponName.Skins.MyFlakCannonTexture';
}
```

If we were doing this for a weapon that only used a single texture you'd use the following instead:

```
defaultproperties
{
  Texture=Texture'MyTextures.Weapons.RazorSkin' Mesh=LodMesh'Botpack.RazorBlade'
}
```

This sets the texture for the skin that is on the razorblades shot by the ripper.

That should do it. For an example of this check out Meltdown's Sticky Grenade mod over at his site UnrealTower.
 
## 19. Multiskin, what exactly is this feature, what does it do and how do I use it?

Epic's Player Models have 4 skins associated with them. That's not a hard coded limit. Custom Plugin PlayerModels (PPMs) released
by the community will have skins associated with them. There are eight slots available, and the model's material tags dictate what
gets applied where on the model.

To utilize the Multiskins array, you must set `bIsMultiSkinned=true`, otherwise it will just use the default skin texture.
Look at `SetMultiSkin()` in `TournamentPlayer` and `Bot`. MultiSkin is supported for all the bots in Unreal Tournament. As a
matter of fact, you can change a skin using a direct call to `Bot.static.SetMultiSkin()`.
 
## 20. Is there an easy way to check to see if a player is currently dead?

Just check to see if they are in the `Dying` state - `if (IsInState('Dying'))`
