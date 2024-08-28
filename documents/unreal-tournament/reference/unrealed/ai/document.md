## Porting Unreal I maps to Unreal Tournament

Unreal I content is automatically replaced by Unreal Tournament content if you run an Unreal I DM map with one of the Unreal Tournament gametypes.  However, we recommend that you manually replace the Unreal I inventory items in your level with their UT equivalents and release an updated version of the map.  Otherwise, both the Unreal I and UT versions will be loaded on the content, which will cause swapping on clients with low amounts of memory.

## The Navigation Network

### Creating the Navigation Network

Unreal Tournament bots use a system of waypoints to navigate the level.  Using waypoints allows UT to minimize the CPU cycles used by the AI, and gives level designers maximum control over how the AI navigates their levels.

These waypoints are defined by placing actors which are subclassed from **NavigationPoint** in the level.  This includes actors such as **PlayerStart**s and **Teleporter**s which designers will place to make their level playable.  Certain NavigationPoints, such as **InventorySpot**s and **WarpZoneMarker**s are automatically placed when the designer "defines" the paths (described below).   Other NavigationPoints are intended for Unreal I style single player situations and are not used at all in UT.  These include **AlarmPoint**s, **ButtonMarker**s, **PatrolPoint**s, **QueenDest**s, **SpawnPoint**s, **Transporter**s, and **TriggerMarker**s.

Once the level geometry is complete, the level designer should fully map the level into the navigation network using PathNodes.  Place PathNodes at intersections and turns so that there is as much clearance as possible from corners (at least 50 world units if possible).  Paths need a line of sight to each other, clear to the width of the maximum width (2 \* collisionradius) of creatures which will use this path.  PathNodes should not be placed more than 700 units apart.  Since PlayerStarts and Inventory will be placed on the navigation network, the designer can (and should) not place PathNodes where these other NavigationPoints can substitute.  On stairs and ramps, the PathNodes should only be 350 units apart.  The objective should be to use a minimum number of PathNodes to completely cover a level. 

Version 402 of Unreal Tournament has an automatic PathNode generator which will do part of the work of placing paths automatically.  It will attempt to cover the level with paths, but will not place special NavigationPoints such as playerstarts, liftcenters, etc..  To use the automatic PathNode generator, open your level in UnrealEd.  Select the Window menu, and from it the log.  At the prompt type 'Paths Build' (no quotes).  This will take 5 to 10 minutes for a typical level.

To navigate around the level, bots will first find the nearest reachable NavigationPoint, and move to it.  They will then move toward their destination, going from NavigationPoint to NavigationPoint.  It is important that some NavigationPoint is reachable (there are no obstructions in the way) from any location a bot may reasonably get to in the level.  If a bot can't find a valid path, either because it can't find a way to get on the network, or there is no valid way to get from the network to its destination, or the path on the network is broken, then the bot will wander (walking) around its current area.

The final step in setting up the navigation network is performing a PATHS DEFINE.   This can be done by typing PATHS DEFINE into the UnrealEd console, or pressing the "Paths Define" button in the lighting section of the rebuild window.  The designer can examine the network generated in any of the UnrealEd world view windows by selecting "Show Paths" from that window's "View" menu.   NavigationPoints which are successfully connected will have either blue or red lines between them.  Bots will use either blue or red paths, but blue paths are preferable - they indicate a cleaner, more obstruction free path.  Each time geometry is changed or NavigationPoints are added or moved (including inventory, since paths are generated from inventory items), a PATHS DEFINE should be performed.

There are several common problems that result from assumptions and approximations made by the AI to minimize CPU overhead.  Make sure that all NavigationPoints are separated by at least 50 world units.  If two pathnodes are too close together, a bot may get stuck on them.  The editor log window will display warnings during a PATHS DEFINE if paths are too close together.  This problem commonly occurs with InventorySpots, which are automatically placed near all inventory items.  Don't place PathNodes  too near to inventory.

In some situations, bots may get stuck on the edge of a ledge where it runs into a wall.  This occurs because of a threshold problem.  Bots won't jump off   ledges until the angle of their destination is greater than 45 degrees from the ledge direction.  If they run into a wall right around this threshold, they may get confused.  The solution is to adjust the NavigationPoint they were trying to reach, or add an intermediate PathNode.

Bots will have problems if the NavigationPoints are too high off the ground.  Make sure that the NavigationPoint is no more than 1.5x the bot's collisionheight off the ground.  This will normally be the case automatically, but in a few situations (such as very steep ramps), the level designer may need to manually adjust the Z position of the NavigationPoint.

PathNodes for the bots to use while swimming must be _in_ the water.   Placing paths above the water's surface will result in bots bobbing at that spot, attempting unsuccessfully to levitate to the PathNode's location.

WarpZones should be at least 70 units deep to allow the AI to handle them properly.

#### Adding Support for Lifts

There are two special NavigationPoint classes used to help bots understand how to use lifts, **LiftCenter**s and **LiftExit**s. Give the lift a unique tag.   Place a LiftCenter on the lift, and set its LiftTag attribute to be the tag of the lift.  At each exit from the lift, far enough away so that bots standing at that spot won't interfere with the lift, add a LiftExit.  Each LiftExit should have its LiftTag set to the tag of the lift.

The default state for movers is BumpOpenTimed.  **_Do not_** use this state for lifts!  Bots misinterpret movers that are BumpOpenTimed as being doors.  Instead, use the StandOpenTimed state for most lifts.  Bots will also understand triggered lifts (TriggerOpenTimed, TriggerToggle, etc.).  In many cases, they will use triggered lifts without any further help.  However, for certain complex situations, such as when a delayed dispatcher is used to control the lift, bots may need a hint.  In these cases, set the LiftCenter's LiftTrigger attribute to the tag of the trigger the bot should use to control this lift.

There are two other configurable LiftCenter attributes of interest.  These should be modified only if absolutely necessary.  MaxZDiffAdd, which defaults to 0, specifies an additional allowable difference in height between the bot and the LiftCenter for the bot to consider that LiftCenter reachable.  This is useful if the bot must stand below the lift (down stairs or a ramp) while waiting for it.  MaxDist2D is the maximum distance between the bot and the LiftCenter.  It defaults to 400 world units.

#### NavigationPoint Attributes

The only configurable NavigationPoint attribute that should be modified is bOneWayPath.   bOneWayPath can be set to true so that paths will only be valid in the direction the NavigationPoint is facing.  Turn on the bDirectional attribute of the NavigationPoint to adjust the direction it faces.

#### Special Purpose NavigationPoints

Several special purpose NavigationPoints exist to provide tactical or game specific positions or to provide support for special movement modes such as using translocators and jumpboots.  Game specific NavigationPoints will be described in the section of this document devoted to that game type.

**PlayerStart**s specify allowed spawning locations for players and bots.   There are two relevant configurable attributes in PlayerStarts.  The TeamNumber attribute specifies which team is allowed to spawn at that PlayerStart in teamgames where team specific PlayerStarts are enforced.  The bEnabled attribute, which is true by default, can be toggled to enable or disable the PlayerStart by triggering the PlayerStart.

**AmbushPoint**s are used to specify good camping spots.  They are directional and should be pointed in the direction the bot should be looking while using that AmbushPoint.  AmbushPoints have two configurable attributes, SightRadius and bSniping.  SightRadius specifies how far out the bot should be looking for enemies when camped at the AmbushPoint.  bSniping specifies that bots using this ambushpoint should stay at this point and snipe after acquiring an enemy, rather than chasing after the enemy. 

**DefensePoint**s are a subclass of AmbushPoint used in team games.   DefensePoints have three additional configurable attributes, Team, Priority, and FortTag.  The Team attribute specifies which team should use this defensepoint (0=Red, 1=Blue, 2=Green, 3=Gold).  The Priority attribute is used in team games to determine which DefensePoints will be manned first (higher priorities are manned earlier).   The FortTag attribute is used in Assault games to associate a defensepoint with a particular FortStandard.

**BlockedPath**s are used to keep bots from attempting to follow routes which are initially blocked (such as a bridge which must be lowered).  . When triggered, the BlockedPath is unblocked.  Once unblocked, a BlockedPath cannot be re-blocked.  If using a BlockedPath, make sure that there aren't any path connections which bypass the BlockedPath and render it useless.  AS-Mazon has some good examples of the use of BlockedPaths.

**TranslocDest**s are a special type of LiftCenter which are not associated with a mover.  TranslocDests are used to define places that bots can use a translocator to cut a route short.  A lifttexit should be placed at the spot where the bot should stand a use his translocator, and a TranslocDest should be placed where the Translocator Target should be thrown.  Another liftexit should be placed near the TranslocDest, as an "exit" from this "lift".  The LiftExits and the TranslocDest should be given the same LiftTag.

Bots will assume that any LiftExit with the same LiftTag as a TranslocDest can be directly reached from the TranslocDest, without any special action on the bot's part.   If the bot must use the translocator to get from the TranslocDest to one of the LiftExits, replace that LiftExit with a **TranslocStart**.

**JumpSpot**s are similar to TranslocDests, and are also placed in conjunction with LiftExits all given the same LiftTag.  Bots understand that in low gravity areas, or in JumpMatch, or if they have JumpBoots, they can also jump to reach JumpSpots.  In addition, if the bImpactJump attribute of the JumpSpot is true, higher skill bots will impact jump (using the impact hammer) to reach the JumpSpot.  If the bAlwaysAccel attribute is true, bots will use air control to reach the JumpSpot (try this only if they are failing without it).

**Teleporter**s send any pawn which touches them instantly to their destination teleporter, as specified by their URL attribute. If the URL attribute is empty, the teleporter acts only as a teleporter destination.  If it contains the same string as the tag of another teleporter in the level, that teleporter will be the destination.  If it contains a string in the form of  LevelName/TeleporterName, it will teleport to a different level on this server (single player only).  If it contains a string in the form of Unreal://Server.domain.com/LevelName/TeleporterName, it will teleport to a different server on the net.

If a teleporter's bEnabled attribute is false, then it will not teleport pawns which touch it, although it can still act as a teleporter destination. The bEnabled attribute is toggled by triggering the teleporter.  If the bChangesYaw attribute is true, pawns arriving at this teleporter will have their yaw changed to the teleporter's yaw.  If the bChangesVelocity attribute is true, pawns arriving at this teleporter will have their velocity set to the teleporter's TargetVelocity.

#### Tweaking and Debugging the Navigation Network

After placing and "defining" the navigation network, the level designed should tweak and debug it by watching bots play the level.  The designer should the game as a spectator, and add first one and then later several bots to the level.  The designer can watch them play, advancing through the bot cameras using the fire button, and looking for problem areas.  If the bot currently being viewed seems to be acting strangely, using the console command _verbose_ will indicate what it is thinking.   After the play session, reviewing the log file may also provide insight to problems.

If the bots don't seem to understand how to get to a certain destination, the designer can use the _rememberspo_t and _showpath_ console commands to look for breaks in the navigation network.  When the rememberspot command is used, the current location is saved.  Subsequent showpath commands will cause the best visible NavigationPoint on the path to the remembered location to become visible.  If no NavigationPoint becomes visible, there is no valid path to the remembered location.

If a player cannot fit in the position specified by a PlayerStart, then the player cannot properly enter the game and will either wander as a spectator or the game will crash.  The log file for that play session will have information on which PlayerStart caused the failure.

## UT Game Types

The Unreal Tournament team games require special actors to be placed in the level.

### Domination

Domination requires **ControlPoint**s, which are a type of NavigationPoint, to be placed at strategic locations in the level.  As with all NavigationPoints, these must not be placed too close to another navigation point, and they must be placed at ground level or bots will be confused by them. 

ControlPoints have several editable attributes of interest.  When a player gains control of a ControlPoint (by touching it), the optional event related to the player's team is triggered.  These events are specified by the RedEvent, BlueEvent, GoldEvent, and GreenEvent attributes.  The bSelfDisplayed attribute specifies whether the ControlPoint mesh (which depends on which team controls it) is visible.  The PointName attribute gives a human readable name to the ControlPoint.  The ControlSound attribute specifies the sound to be played when control of the ControlPoint changes.

### Capture the Flag

Capture the Flag requires **FlagBase**s, which are a type of NavigationPoint to specify the home location of the flag for each CTF team.  There can only be two CTF teams, and each can only have one FlagBase.  The team attribute of the FlagBase specifies to which team the FlagBase is associated, with 0=Red, and 1=Blue.

**AlternatePath**s are used to indicate alternate routes that bots can use to enter an opponent's base.  The AlternatePath's team attribute should be the same as the team of the FlagBase for which the AlternatePath is pointing out a route.  The AlternatePath's SelectionWeight is used to modify the likelihood of bots using that path.   Bots use AlternatePaths by first moving along the shortest route to the AlternatePath they have chosen, and then moving along the shortest route from their to the FlagBase.  If the AlternatePath is set up so that the shortest route to the AltermatePath involves running right by the FlagBase, bots will do that (a bad thing!).   The location of AlternatePaths may need to be adjusted to provide the desired results.  AlternatePaths with the bReturnOnly flag set true are used by bots with the same team number returning to their base with a flag.

### Assault

The **FortStandard** is used to define the objectives in the Assault map.  There can be multiple FortStandards in a map.  The bFinalFort attribute if true specifies that when the FortStandard is destroyed, the level is completed even if there are other FortStandards still active.  The DefensePriority attribute specifies the order in which the FortStandards should be defended, with the highest DefensePriority FortStandards defended first.  The NearestPathNodeTag attribute should always be used to provide bots a hint about how to get to the FortStandard.  Set it to the tag of the nearest reachable PathNode.  The optional FallBackFort attribute specifies which fort defenders should fallback to if the FortStandard is destroyed (set the FallBackFort to the tag of the desired FortStandard).  The bTriggerOnly attribute specifies that the FortStandard should be triggered (using a trigger or by touching it) rather than shot.

The bSelfDisplayed attribute specifies that the FortStandard is visible (using its mesh).  This is typically turned off and the FortStandard is displayed with level geometry.  The bFlashing attribute specifies that the FortStandard should flash when it is damaged.  The bSayDestroyed attribute specifies that bots should announce when they have destroyed this FortStandard (turn this off if the FortStandard marks a strategic location, and not a visible objective).  If the DestroyedMessage is not empty, it will be displayed on everyone's HUD when the FortStandard is destroyed.  The DamageEvent\[\] and DamageEventThreshold\[\] arrays are used to specify events which occur when the FortStandard has incurred specific amounts of damage.

The ChargeDist and bForceRadius attributes are advanced AI tweaks used to determine how aggressively bots will go after a FortStandard, when they feel they don't have adequate backup.

One of the FortStandards in the level should have the DefenseTime attribute (the total time the base needs to be defended) set.  Also, one FortStandard should have the EndCamTag attribute (the tag of the spectatorcam to use when the game ends).

The **TeamCannon** can be placed in Assault levels to support defenders.  The **MinigunCannon** is a minigun version of the TeamCannon.

Every Assault level must have an **AssaultInfo** somewhere in it.  The AssaultInfo contains the text (in the ObjDesc\[\] array) and screenshots (in the ObjShots\[\] array) which describe the objectives for the level.  The NumObjShots should be se to the number of text/screenshot elements.

The **AssaultRandomizer** can be used to force bot attackers to vary their entry routes randomly.  Place an AssaultRandomizer in a spot along the shortest path, making sure there are no connections around it along that path.  Set the ToggledCost attribute to an appropriate value to increase the distance cost of that path.  The use a trigger to toggle the AssaultRandomizer on and off as desired, causing the path to appear longer or shorter.  Never use a negative value for the ToggledCost.  

## The Level Info

The LevelInfo contains several properties which should be set to describe the level, including the Title string, the Author string, and the IdealPlayerCount string.  

Import a screenshot and set it as the ScreenShot texture. Your preview screenshot must be a 256 x 256 pixel, 256 color .PCX or .BMP file.  In UnrealEd select Textures in the Browser window and then click the Import button to import your screenshot. A file dialog will pop up. Browse to the location where your preview is stored and select it, then click the OK button. The Import Texture dialog will pop up. In the "Name:" field enter "screenshot" and in the "Package:" field enter "MyLevel". Uncheck the "Generate MipMaps" option and then click the OK Button.  After UnrealEd works for a moment you should see the "MyLevel" package displayed in the browser with your preview screenshot shown in the browser texture window.  Go to Level Properties from the Ued's drop down menus and there's a field called "Screenshot" (or something like that); you need to click on your newly created textured screenshot in the Browser window to have the name come up\] Rebuild and save your map. (Thanks Steve Keene for this explanation.)

When you run UT and select your map (when starting a practice session or network game) you should see your screenshot displayed just as it does with all of the maps that came with UT.

RecommendedEnemies, RecommendedTeammates, and the LevelEnterText are not used.

The LevelInfo is the default ZoneInfo for zones that don't have their own ZoneInfo.  See the section on ZoneInfos below.

## Trigger

The Trigger actor is  used to trigger events.  When a Trigger is activated, it broadcasts its event to all other actors in the level.  Any actors whose tag matches this event will be triggered.

The TriggerType of a Trigger specifies what situations will cause a trigger to activate.  The possible settings of TriggerType are

    TT\_PlayerProximity    Trigger is activated by player (or bot) proximity.  
    TT\_PawnProximity      Trigger is activated by any pawn's proximity.  
    TT\_ClassProximity     Trigger is activated by actor of the class specified by the Trigger attribute ClassProximityType.  
    TT\_AnyProximity       Trigger is activated by any actor in proximity.  
    TT\_Shoot,             Trigger is activated by player shooting it.  The optional DamageThreshold attribute specifies the minimum damage                                           required for triggering (instantaneous, not cumulative).

The attribute ReTriggerDelay specifies the minimum time before a trigger can be triggered again.  The bTriggerOnceOnly attribute, when true, specifies that the trigger should only activated once and then go dormant.

There are several possible states for the Trigger actor.  The desired state is set using the InitialState attribute (in the Object section of the Trigger properties).   The alternate states are used for Trigger actors that are turned on or off by other triggers, in conjunction with the bInitiallyActive property.  If bInitiallyActive is false, the Trigger will be disabled initially.  The possible states for the Trigger actor are:

    NormalTrigger         Triggering the Trigger has no effect.  
    OtherTriggerToggles   When triggered, the Trigger will toggle its bInitiallyActive property on and off.  
    OtherTriggerTurnsOn   When triggered, the Trigger will turn be come active.  
    OtherTriggerTurnsOff  When triggered, the Trigger will turn be come inactive.  
  
RepeatTriggerTime, if set to a value greater than zero, causes the trigger to send out its event at an interval of RepeatTriggerTime seconds while the triggering actor remains within the trigger’s radius.

### Special Trigger Types

The **TimedTrigger** is not triggered by being touched like other triggers.  Rather, it triggers at a fixed interval after the level starts, specified by its DelaySeconds attribute.  If its bRepeating attribute is true, the TimedTrigger will continue to trigger at every DelaySeconds interval.

The **TeamTrigger** is only activated by pawns which do _not_ belong to the team specified by its Team attribute.

## Triggers

Classes which are subclassed from Triggers, but are not subclassed from Trigger, are recipients rather than sources of trigger events.

The **SpecialEvent** has several possible states.  The desired state is set using the InitialState attribute (in the Object section of the SpecialEvent properties).

    DisplayMessage          Just displays the message in the Message attribute.  
    DamageInstigator        Damages the instigator who triggered this event.  The Damage attribute specifies the amount of damage.                                The                                    DamageType and DamageString attributes are also relevant for this state.  
    KillInstigator          Kills the instigator, using the DamageString for his death message if the DamageType is _SpecialDamage_.  
    PlaySoundEffect         Plays the sound specified by the Sound attribute at the SpecialEvent's location.  
    PlayersPlaySoundEffect  All players play this sound effect at their location on the client side (so they hear it at full volume).  
    PlayAmbientSoundEffect  Places the SpecialEvent's AmbientSound on the instigating player.  
    PlayerPath              Sends the instigating actor on a spline path through the level as specified by InterpolationPoints placed in the level.  

If the Message string is not empty, it will be sent to the instigating player, unless bBroadcast is true in which case it will be broadcast to all players.  This will happen in any SpecialEvent state.

TBD: TriggerLight, DistanceViewTrigger, Kicker, Dispatcher, Counter

## ZoneInfos

This section describes the attributes of  ZoneInfos which are relevant to gameplay.   For more information on the importance of properly zoning your level for rendering performance, review [Zones.htm](Zones.htm).  Every zone can optionally include a ZoneInfo which specifies special attributes of that zone.  Zones with no ZoneInfo in them use the LevelInfo's zon attributes.

There are several pre-defined ZoneInfo classes which should be used when possible, including **WaterZone**s, **LavaZone**s, and **SlimeZone**s.   The relevant attributes for these ZoneInfo classes are already properly set.   While any zone can be filled with water simply by setting its bWaterZone attribute to true, the zone will not have all the normal characteristics of WaterZones, such as entry and exit splashes.

Several ZoneInfo attributes affect physics within the zone.  These include ZoneGravity (for which only the Z component is relevant), ZoneGroundFriction (used for walking), ZoneFluidFriction (used for swimming in water zones), ZoneVelocity (constant velocity added to moving actors in this zone), ZoneTerminalVelocity (which specifies the maximum falling velocity), and bWaterZone (which causes the zone to be filled with water if true).  If a zone has a ZoneVelocity, the bMoveProjectiles attribute specifies whether this velocity should be imparted to projectiles and effects.

Zones with bWaterZone true can also specify an EntrySound, an ExitSound, an EntryActor (such as a splash effect), and an ExitActor.

Zones can be set to damage actors that enter them by setting the bPainZone attribute to true, and specifying a DamagePerSec value and a DamageType.  Setting the bDestructive attribute to true will prevent fragments and gibs from hanging around in the zone, while settingthe bNoInventory attribute to true will prevent dropped inventory items from hanging around in the zone.  The actual damage inflicted on a pawn depends on the DamagePerSec value and how much of the pawn is immersed in the zone.  If the DamageType is  _SpecialDamage_, then the DamageString will be used to describe deaths.

Zones with bKillZone set to true will instantly kill any pawn that enter them.   Pawns will not take damage in zones with bNeutralZone set to true.

The ZonePlayerEvent is triggered whenever a player enters the zone.

The ZoneName (in the LocationStrings section of the ZoneInfo properties)  is used to identify the location of teammates on the scoreboard or when giving orders to bots.   In large zones, a level designer can place **LocationID** actors in the zone to provide a finer granularity of location descriptions.  The CollisionRadius of the LocationID (in world units) determines the area in which the LocationID's LocationName will supercede the zone's ZoneName.

The ZoneTag is used to tag a zone which is to be triggered by a **ZoneTrigger**. **WarpZone**s can be triggered to sequence through an array of destinations specified in their properties. Other zones will toggle the bPainZone attribute on and off when triggered.

The ViewFog and ViewFlash properties (in the ZoneLight section of the ZoneInfo properties) allow the level designer to change the player’s display color/fogging while the player is in that zone. ViewFog is used to color the screen. It is a vector whose components are RGB values between 0 and 1.

As ViewFog increases the brightness of the screen, ViewFlash should be used  to keep it from over-brightening.  ViewFlash is a vector whose components should be between 0 and –1 (for example (-0.5, -0.5, -0.5). It reduces the brightness of the screen. Typically, all the components will have the same value, which should have a magnitude about the same as the average magnitude of the ViewFog components to keep the screen from changing brightness.

### Special Zone Types

When a player enters a **TeleporterZone**, he is teleported by the associated teleporter (specified by the TeleporterZone’s TeleporterTag).

TBD: PressureZone, VacuumZone, WarpZone

## AI Difficulty Differences

Unreal Tournament has 8 AI skill levels, along with a continuous range of intermediate skill levels.  Skill levels 0 to 3 are called "novice" skills, because bots at these skill levels move more slowly than players and their weapons do less damage than player weapons.  Bots with skill levels between 4 and 7 move at the same speed as players and their weapons do the same amount of damage.

Lower skill bots turn more slowly, and take longer to acquire an opponent.  They also have worse peripheral vision.  Higher skill bots have better aim, and do a better job of leading opponents.  Higher skill bots are also better able to strafe, or to move toward an objective while firing at an enemy at the same time. Low skill bots move much more slowly when strafing.   Higher skill bots are less disoriented when hit, and tend to fire their weapons faster (although never faster than players can).

High skill (non-novice) bots also understand the special moves with weapons, including the shock rifle combo move, the sniper rifle headshot, and impact jumping with the impact hammer. 

## Console commands useful for tweaking levels

### These commands can be typed into the console.

*   **PlayersOnly**   Only player actors are ticked.  Everything else in the level is frozen in place.
*   **AddBots n**    Adds n bots to the level.
*   **ViewClass xxx**    View the game from the point of view of a member of class "xxx". Successive executions of this function will iterate through the class. For  example, ViewClass Bot  will show you the game from the point of view of a Bot in the level, if there is one.  If you are a spectator, you can viewclass any bot or player in the level.  If you are on a team in a team game, you can only viewclass teammates.
*   **CheatView xxx**  This is used to viewclass bots on the opposing team in a single player game.
*   **Verbose**  Shows you what the bot you are currently viewclassing is thinking.
*   **KillAll xxx**     Destroys all actors of class xxx (including subclasses). For example, KillAll Inventory will remove all inventory, including all weapons  and   pickups..
*   **Fly** Allows you to fly around the level.
*   **Walk**  Returns you to the normal walking state.
*   **Ghost**  Allows you to fly around the level and go through walls.   While ghosting, you cannot pick up any items.
*   **Loaded** Gives you all the UT weapons except for the Redeemer.
*   **AllAmmo**  Gives you 999 ammo for all the weapons you have.
*   **Invisible b**  With b=1 makes you invisible, while b=0 makes you visible.
*   **God**  Toggles god mode.
*   **BehindView b**  Toggles your view from first person (b=0) to third person (b=1).
*   **SloMo f**  Changes the rate of time in the game. 1.0 is normal speed. 2.0 is twice normal speed. and 0.2 is one fifth normal speed.
*   **KillPawns**  Removes all pawns from the game.
*   **Summon xxx**  Adds an actor of class ‘xxx’ right in front of you. This can be anything (a weapon, ammo, a creature, etc.).  By default, the class is assumed to be in the botpack package.  If it is in another package, you must prefix the package name, e.g. 'summon unrealshare.vase'.
*   **RememberSpot**  Remember your current location (see ShowPath below).
*   **ShowPath**  Show the recommended path back to location remembered by RememberSpot.


