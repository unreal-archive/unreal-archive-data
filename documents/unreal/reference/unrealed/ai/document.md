## AI Attributes

Typically, you will use the default values for the parameters below, with the following exceptions:

*   Tag, Orders, Ordertag,TeamTag, bTeamLeader, AlarmTag and sometimes Aggressiveness. AttitudeToPlayer, and Combatstyle.

### Actor attributes menu:

*   OddsOfAppearing Likelihood that creature (or other actor) will appear in relevant game modes. Range is 0.0=Never to 1.0=Always (default is 1.0).

### Display attributes menu:

*   DrawScale: If the drawscale of a creature is changed from its default value, its collision box (collisionheight and collisionradius) and health will be scaled by the new value at the start of gameplay.

### Movement attributes menu:

*   JumpZ: How far a pawn can jump. If you don’t want a pawn to jump that can normally jump (for example, you want to keep a specific Skaarj up on a ledge), set its JumpZ to -1.

### AI attributes menu:

*   bHasRangedAttack: specifies whether creature can attack from beyond melee range.
*   bMovingRangedAttack: specifies whether creature can use his ranged attack while moving (assuming creature supports this mode).
*   bCanStrafe: Specifies whether creature can strafe.
*   bFixedStart: If true, creature always starts from where it was placed. If false, then may start from alternate position depending on its orders (see below).
*   bQuiet: If true, makes less noise when wandering around
*   bTeamLeader: Leader of his team (as defined by the TeamTag). There should be only one per team.
*   bIgnoreFriends: Default false. If true, creature doesn’t react to friend's noises.
*   bDelayedPatrol: If true, and creature’s orders are Patroling, then the creature will begin his patrol only when it is triggered. However, it will break off this patrol and react to the player if it sees him. To force the creature to continue to his destination, you can also specify the patrol destination in the creature’s alarmtag.
*   bHateWhenTriggered: Creature will change its attitude to hate the player when triggered by the player.
*   TeamTag: Creature team to which this creature belongs. As long as the team leader is alive, creatures on the same team will coordinate with each other.. If the species can speak, then creatures on the team will talk to each other.
*   Skill: Added skill of this creature. Default is 0. For example, if Skill = 1, then the creature will act like a difficulty 2 creature when the difficulty setting = 1.
*   SightRadius: Maximum sight distance. Creature’s likelihood of seeing other pawns depends on how far away the other pawn is relative to the creature’s sight radius. the other pawn’s visibility, and (soon) how well lit the other pawn is.
*   PeripheralVision: The cosine of the maximum angle of peripheral vision. A creature which can see 90 degrees to each side (180 degrees total) would have PeripheralVision = ?.
*   HearingThreshold: Minimum scaled noise loudness which can be heard. While the exact hearing range depends on the creature’s alertness, a good rule of thumb is that creatures can hear a typical loud noise if there is a line of sight to the noise location, and HearingThreshold \< 200 / (distance to the noise in Unreal units). For example,   a creature with HearingThreshold = 0.4 could typically hear noises if they were no more than 500 units away. A hearing threshold of 0.2 translates to a max hearing distance of 1000 units. Creatures can never hear noises which are more than 2800 units away.
*   Orders: See Orders section below.
*   OrderTag: See Orders section below.
*   TimeBetweenAttacks: Time in seconds between ranged attack barrages (which may include multiple shots).
*   MeleeRange: Maximum distance from target (not including collision radius of this creature or its target) to launch a melee attack.
*   Aggressiveness: Typically in the range 0.0 to 1.0. Primarily affects attitude changes (more aggressive creatures will continue to fight, even against a stronger player, less aggressive creatures will be more quick to flee). May also have an effect on tactical combat decisions. Note that creatures will only run away if they have a home base (except for Nali and cow)
*   Visibility: How visible is this pawn to other creatures (note - does not affect rendering!) 0 = invisible, 128 = normal, 255 = highly visible.
*   AttitudeToPlayer: Initial attitude to player (may change depending on player’s actions, and creature's aggressiveness.
    *   ATTITUDE\_Fear - creature will try to run away
    *   ATTITUDE\_Hate - creature will attack player
    *   ATTITUDE\_Frenzy - Indiscriminate, berserk attack (no fear, lower accuracy)
    *   ATTITUDE\_Threaten - Creature will assume a threatening posture
    *   ATTITUDE\_Ignore - Creature will ignore player
    *   ATTITUDE\_Friendly - Creature will fight player’s enemies
    *   ATTITUDE\_Follow - Creature will follow player (not yet implemented).
*   Intelligence: Creature’s intelligence
    *   BRAINS\_None - amoeba like - only reacts to immediate stimulus
    *   BRAINS\_Reptile
    *   BRAINS\_Mammal
    *   BRAINS\_Human
*   ReFireRate: Likelihood of firing again immediately after a ranged attack (values from 0 to 1 with higher values indicating a higher probability).
*   CombatStyle: Tactical decision making during combat. Value between 0.0 and 1.0 Higher means the creature is more likely to charge, try to melee, etc.
*   AlarmTag: If AlarmTag is set, when the creature sees the player, it will (at all costs) first go to the actor with the same Tag as its AlarmTag. Friendly creatures will wait for the player as they move towards this actor. This can be used either to have friendly creatures lead the player to some area or object, or for unfriendly creatures to try to trigger events or set up initial attack formations. For example, you could have three Kraal in a room. Two attack you, while the other runs for a button which will lock the door behind you and sound an alarm. Alternatively, you could have them spread out in formation, seeking cover or advantageous positions when they see you. AlarmPoints (see below) are designed to provide extensive scripting control when used with the AlarmTag.
*   SharedAlarmTag: For each group of creatures who have the same string in this field, one of them will choose it to be his alarmtag (overriding any existing alarmtag). You can use this to provide some randomness in which creature performs some important action.
*   DropWhenKilled: Creature will drop one of these when it is killed.
*   FirstHatePlayerEvent: Creature will trigger this event the first time he decides to attack the player.

## Orders

The following initial orders can be given to all creatures. After killing an enemy, they will attempt to continue to execute these orders. Some orders (patroling, guarding) are associated with other actors in the level. For these, you should set the creature’s OrderTag to the tag of the associated actor.

### Waiting

The default orders for all creatures. Creature will wait in place, playing various waiting animations, until it receives some external stimulus (sight or sound).

### Patroling

Patroling creatures will patrol along a set of Patrolpoints (a subclass of NavigationPoint) specified by the level designers. The creature’s OrderTag should contain the tag of the first Patrolpoint in its patrol. When a creature reaches a Patrolpoint, it will pause for the PauseTime specified in the patrol point, facing in the direction the Patrolpoint is oriented. While pausing, it will play waiting/patrolstop animations. If a PatrolAnim is specified, the creature will play that specific animation the number of times specified by NumAnims. Each time it plays the animation, it will also play the PatrolSound if one is specified. Note that the amount of time creatures playing a PatrolAnim pause depends on how long it takes to play the animation NumAnims times, and not the pause time. However, the PauseTime must still be set to a positive number. It will then continue to the Patrolpoint specified in the current Patrolpoint’s NextPatrol. If a creature cannot reach the next patrol point, it will wait at its current position. If bFixedStart is false, the creature will start at some random point along his patrol route (not yet implemented).

### Guarding

Guarding creatures will guard the actor whose tag equals their OrderTag. They will remain near, and try to return the guarded actor after combat. If their initial attitude is ATTITUDE\_Threatening, they will threaten the player, and try to remain between the player and the guarded object. If the player touches the object they will attack.

### Ambushing

The creature is waiting, but more alert than in the waiting state (and possibly playing different animations). If bFixedStart is false and there are Ambushpoints (a subclass of Navigationpoint) with the same tag as the creature, the creature may randomly pick one of these as its starting point. The orientation of the Ambushpoint determines the orientation of a creature using it. Ambushpoints may also be used by creatures that decide to ambush rather than pursue a player.

### Swarm AI Pawns

Horseflies, biterfish, and blobs all use variations of swarm AI. Do not place individual Horseflies and biterfish in your map. Rather, place horseflySwarms and biterfishSchools, and specify in their properties how many individual creatures they should contain. For blobs, add a parentBlob and a number of bloblets, and give them all the same tag.

### PathNode placement

You can place pathnodes manually, or you can use PATHS BUILD LOWOPT from the console to get a first pass placement done automatically. In any case, you must do a PATHS DEFINE from the console to create the connections between pathnodes.

To use the navigation system, a creature must first choose the best nearby node to "get on" the network. For performance reasons, creatures limit their search for path nodes to those within an 800 unit radius (see FSortedPathList::FindVisiblePaths in UnRoute.cpp). This is because the test to determine if a creature can reach a path is very expensive. However, once creatures are "on the network", travelling from pathnode to pathnode, they use the reachspec tables in each pathnode to determine reachable nodes. There is no distance limit for reachspecs, so paths may be defined between two pathnodes which are any arbitrary distance apart. For performance reasons, paths between distant pathnodes which have a suitable alternate  
path using intermediate path nodes (with a low added cost) are culled from the path network.  
  
I recommend that paths should be less than 700 units apart, so that creatures don't ever start off going in the wrong direction to get on the network. In addition, paths on stairs and ramps should be closer together (<350 apart) Given that, you should use the minimum number of paths needed to cover the area for which you want intelligent navigation. Note that all navigation points are equally used as paths, so there is no need to place pathnodes redundantly near patrolpoints, etc..  
  
Paths should in general be placed at intersections, making sure that they have the maximum visibility in all potential directions. Paths need a line of sight to each other, clear to the width of the maximum width (2 \* collisionradius) of creatures which will use this path. You should also place paths on ledges, with a line of sight to paths below, so that creatures can intelligently navigate jumping off ledgest. Vertical line of sight has no extent requirement.  
  
In UnrealEd, look at the Properties menu in the map view window. There is an option to show the path connections. These are best looked at using the overhead view. Note that a connection between two Navigation points indicates that at least some creatures can use this path. However larger creatures, or creatures which do not support certain movement modes (e.g. the bCanJump, bCanSwim, etc. attributes of pawns) may not be able to use these paths.

## Thing Factories and Creature Factories

Creature and thing factories may be triggered by a trigger whose event equals the creature factory’s tag, or will trigger themselves if a player touches it. Since zone changes can cause an event, you could for example cause a creature factory to start producing razorfish as soon as a player enters the water. The first creature spawns instantly. Creature and thing factories use Spawnpoints ( a type of navigation point) as the locations to create actors. Up to 16 spawnpoints can be associated to a given factory. Spawnpoints and creature factories are associated by giving them the same tag. If a Spawnpoint has a tag in its event field, that event will occur when a creature is spawned from that spawnpoint. By default, creature factories are covert, which means they will only spawn actors at a spawnpoint no player can see. A creature from a factory has its event set to the factory’s tag (so its death will trigger the factory). Thing and creature factory properties are:

*   prototype: The class of actors produced by this factory.
*   maxitems: The maximum number of active actors from this factory at any time. If it is a creature factory, new creatures will only produced either initially, or when a creature dies, to get back up to maxitems until the factory capacity is reached.
*   Capacity: The maximum number of actors this factory can ever produce (-1 = no limit). After reaching this limit, the factory shuts down.
*   AddedCoopCapacity: Extra items to produce if the game type is CoopGame.
*   Interval: The average time interval between spawns.
*   timeDistribution: The distribution of the interval between spawns.
    *   DIST\_Constant - constant interval (always equal to Interval).
    *   DIST\_Uniform - uniform interval (random time between 0 and 2 x interval)
    *   DIST\_Gaussian - Gaussian distribution, with mean = interval
*   bOnlyPlayerTriggered: Only a player can trigger this factory (true by default).
*   bCovert:; Only do hidden spawns (true by default for Creature factories, false by default for thing factories).
*   bStoppable: Stops producing when untouched.
*   Orders: (Creature factory only) Creatures from this factory will have these orders
*   OrderTag: and ordertag. By default they will attack the instigator of the factory.
*   ItemTag: Tag given to items produced by this factory.
*   AlarmTag: (Creature factory only) AlarmTag given to creatures produced by this factory.

## Navigation Points

All navigation points have a bPlayerOnly attribute. If set to true, it means that only Players (bots) will use this path for navigation. Its not perfect, but if you put two in a row along a hallway with turns, it will probably keep the creatures from going through that hall. Exceptions are if the creature is close behind a player and in hot pursuit, or if he is already very close to the path when he tries to use navigation.

### Homebase

Homebase of creatures whose tag is the same as the Homebase actor. Creatures who fear the player will flee to their homebase if they have one. There, they will turn and fight. When a creature reaches its homebase, it will face in the direction specified by the homebase’s orientation. Also, it will check for nearby ambushpoints whose tag = the creature’s tag, and if any are found will go to them.

### Ambushpoint

See Ambushing orders.

### InventorySpot

Automatically inserted during PATHS DEFINE to identify location of inventory (for bots.

### Teleporters

### PlayerStart

### SpawnPoint

See Thing and Creature factories.

### PatrolPoints

See Patroling orders.

### LiftCenter

Place this Navigation Point at the spot on a lift you want the creature to stand while using the lift. Its LiftTag should be set to the tag of the lift it is on.

### LiftExit

LiftExits should be place at the spots you want creatures to wait before getting on a lift. Their LiftTag should be set to the tag of the lift they are associated with.

### AlarmPoints

Alarmpoints are designed to be used in conjunction with the alarmtag to cause creatures to perform complex actions upon seeing a player. If the Alarmpoint’s event is set, it will trigger all creatures with that tag when the alarm creature reaches the Alarmpoint. The attributes are:

*   NextAlarm: The next alarmpoint to go to after this one. If none, the creature will revert to normal AI after completing the actions specified by this point.
*   PauseTime: How long to pause at this alarmpoint.
*   DuckTime: How long to pause after playing the AlarmAnim (only used if an AlarmAnim is specified). Its called ducktime, because a typical use would be to have the creature duck, wait for ducktime, and then stand up and shoot (if bAttackWhilePaused is true). If you want to the creature to track the player while ducking, be sure to set bAttackWhilePaused.
*   AlarmAnim: If specified, the creature will play this animation upon reaching the alarmpoint, as well as the AlarmSound if specified.
*   bStrafeTo: If true, and the creature can strafe, then the creature will strafe to this AlarmPoint, facing the enemy player. If the creature has a moving attack, it will fire while strafing if it has a clear shot.
*   bAttackWhilePaused: If true, the creature will shoot at the player while paused (unless he has a ShootTarget). If the player is not visible, the creature will fire at where he last saw the player.
*   bNoFail: If true, the creature will never give up trying to get to this Alarmpoint (just as it never gives up trying to get to other alarmtag actors). If false, and the creature gets knocked off its path, it may give up if it can no longer easily get to the alarmpoint.
*   bStopIfNoEnemy: If true, and the enemy is not visible, creature will stop at this Alarmpoint until it sees the enemy again. Otherwise, it will continue progessing through the Alarm actions.
*   bKillMe: Any creatures that are triggered by this alarmpoint (their tag = the alarmpoint’s event) will hate and kill the triggering creature, even if they wouldn’t normally.
*   bDestroyAlarmTriggerer When a creature reaches this alarmpoint (and it is the creature’s alarmtag destination), the creature is immediately destroyed.
*   ShootTarget: If bAttackWhilePaused is true and ShootTarget has the tag of some actor, the creature will fire at that actor rather than the player.
*   AlarmSound: If an AlarmAnim is specified, the AlarmSound will be played in conjunction with the AlarmAnim.

## Physics Notes

Creatures may be able to walk over any opening up to 3X their CollisionRadius. If you want something to definitely fall in, or not be able to cross without jumping, make it bigger than this. Also, make sure that most hallways, and particularly intersections and corners are at least (4 x CollisionRadius + 10) of the largest creature you want to navigate it (so that two creatures won’t get hung up with each other. Ideally, hallways should be at least 6x the CollisionRadius of the largest creature which may navigate it. Also WarpZones should be at least 70 units deep ideally to allow the AI to handle them properly.

## Triggering creatures

Creatures that have not engaged an enemy can be triggered by a trigger whose event equals the creature’s tag. Creatures that are triggered will make whatever instigated the trigger their enemy. You can use this to have creatures ignore the player until a certain event happens, such as crossing some threshold (using ATTITUDE\_Ignore) - if bHateWhenTriggered is true, the creature will change its attitude to hate the instigator. Creatures will also trigger their event when they die. You can use triggers in conjunction with bDelayedPatrol to cause a creature to start a scripted set of actions when triggered by the player (without noticing the player).

## Triggers

Two new trigger types have been added. TT\_PawnProximity will allow any pawn, not just players to use the trigger. TT\_ClassProximity will only allow actors of the class ClassProximityType to use the trigger. For example, you might make a certain switch only operable by a Nali. Also, triggers with type TT\_Shoot now also have an optional DamageThreshold value. This is the minimum damage required for triggering (instantaneous, not cumulative). The optional attribute ReTriggerDelay specifies the minimum time before a trigger can be triggered again.

RepeatTriggerTime, if set to a value greater than zero, causes the trigger to send out its event at an interval of RepeatTriggerTime seconds while the triggering actor remains within the trigger’s radius.

### EarthQuake

The EarthQuake keypoint can be triggered to shake the player’s view for a specified duration, as well as possibly tossing players around. It has no effect on other actors. To simultaneously toss around other actors, use the ThrowStuff keypoint. Earthquake attributes are:

*   magnitude: Specifies the amount to roll the player’s view, and the amount to throw him if bThrowPlayer is true. A magnitude of 2000 is a pretty strong quake.
*   duration: Time in seconds quake lasts.
*   radius: Radius for which players are affected. A player who goes beyond the radius will continue to have his view shaken for the duration of the quake, but he will no longer get thrown around.
*   bThrowPlayer: If true, players are thrown around during the quake.

### ThrowStuff

The ThrowStuff keypoint can be used to cause actors whose tag matches the ThrowStuff keypoint’s event to be tossed using the vector specified in throwVect. If Numthrows is larger than 1, the actors will be thrown again after the specified interval. If bRandomize is true, the throwVect will be randomly altered for every toss. Having Numthrows > 1 and bRandomize can be useful for making stuff get tossed around during an earthquake. Other potential uses for a ThrowStuff keypoint include launching a creature in a specified direction when triggered by the player, or turning the physics on of actors when a brush they are on tips and you want them to slide/fall off (in this case, use a ThrowVect of (0,0,0), and they will just be set to falling).

### MakeNaliFriendly

When triggered, this keypoint makes all Nali in the level friendly. This is useful for cases when the player may have scared the nali previously, or to set up situations where the Nali will reward the player after he does something (such as killing a skaarj which was threatening the Nali).

### Jumper

When triggered, this trigger makes the triggering creature jump in the direction it is pointing. It can be limited to trigger once only, or to only affect a certain class of creatures. The Jumper trigger has a JumpZ variable which specifies how high the triggered creature should jump (giving you control over where it lands).

### FearSpot

This trigger causes creatures to avoid an area (not perfectly).If you use this, make sure there are also no paths going through the area you want them to avoid. The FearSpot keypoint has a bInitiallyActive attribute, which can be turned on and off by triggering it.

## Movers

Two new booleans have been added to Movers. bUseTriggered indicates that the brush is activated by a player doing a use (exec grab) on it. BDamageTriggered indicates that damage to the brush will trigger it. The optional attribute DamageThreshold specifies the minimum (instantaneous, not cumulative) damage needed to trigger a bDamageTriggered brush.

Mover bump types are now supported, specifying which types of actors can trigger a mover by bumping it (for movers which are activated by bumping).

By default, all the movers with the same tag will return or stop if one returns or stops because of encroachment. To prevent all the movers with the same tag from acting this way, you can divide them into sub-groups using the ReturnGroup attribute.

## Special Creature Features

### Mercenary

The mercenary has several special sets of idle animations accessible through the following attributes - bButtonPusher, bTalker, and bSquatter. If one of these attributes is set true, then these animations will play whenever the mercenary is stopped (waiting, or stopped on patrol, etc.). Note that for bTalker and bSquatter, the mercenary should be talking to teammates (so that the conversation will be synchronized).

bHasInvulnerableShield, bCanFireWhileInvulnerable, and invulnerableCharge are parameters which can be used to adjust the Mercenary’s invulnerability capabilities.

### Skaarj

The Skaarj has a special set of animations accessible through the attribute bButtonPusher, which work in an analogous fashion to the mercenary bButtonPusher animations. Also, bFakeDeath tells the skaarj to remain laying down until a little after he sees the player. Note that skaarj using bFakeDeath should be placed slightly above the floor, so they don’t adjust out of the floor on first seeing the player (thereby giving away the fact that they are not really a carcass).

### Krall

The Krall has a special set of animations accessible through the attribute bDicePlayer. Krall using these animations should be teamed with several other Krall and closely arranged in a circle. The bSleeping attribute will make a Krall play a sleeping animation and be very un-alert while waiting.

### Nali

A Nali with orders "Guarding" will play his praying animations. A Nali with orders "Ambushing" will play his meditating animation.

The bNeverbow attribute should only be used with Nali who have a homebase (and only in well tested situations). When enabled, the Nali will not stop and bow while retreating.

### Birds

Although birds are flockpawns, they are added individually. They have several different selectable behaviours. By default, they will fly around randomly in an area whose size is determined by their CircleRadius attribute. Note that this area should be relatively free of obstructions, as birds are not smart. If bCircle is set, they will soar around a circle with radius CircleRadius. If GoalTag is set, they will not move until triggered, and then quickly fly to their GoalActor. Birds are now unlit by default. If you want a bird to show off cool light/shadows, then set its bUnlit property to false. Birds that you don’t see no longer cost anything. However, be sure not to use birds in big open areas where they can be seen from far away, as the full cost of rendering their mesh still exists, even if they are smaller than a pixel.

### Cow and Rabbit

The bStayClose attribute (on by default) specifies whether the creature will wander around within its WanderRadius, rather than wandering randomly anywhere.

### Pupae

Pupae can be placed and rotated onto any wall or ceiling initially. When they see the player, they will drop off the wall/ceiling and go at the player.

### Brute

The bTurret attribute when true will make the Brute stay in place and just fire at the player.

### Warlord

The Mutilating orders are for hub one. The Warlord has a new attribute, bTeleportWhenHurt, which causes him to teleport away rather than dying.

### BiterFishSchool

The bNonAggressive attribute when true will make the fish ignore the player.   BiterFishSchools have a fishcolor attribute. 0 to 6 makes all the fish in the school the same color, while a value larger than 6 gives them a random mix of colors.

## Carcasses

You can add permanent creature and player carcasses (they are a subclass of decoration). If a creature has multiple death animations, you can select the death pose by changing AnimSequence in the Display properties.

Carcass management note: Carcasses are destroyed more quickly in zones that already have reached their limit of carcasses. In less cluttered zones, carcasses will never disappear or change forms before your eyes. The MaxCarcasses attribute of zones sets the limit for "uncluttered" carcasses in a zone. The default is now 3, which should be optimal for most situations.

## Zones

The ZoneTag is used to tag a zone which is to be triggered by a ZoneTrigger. WarpZones can be triggered to sequence through an array of destinations specified in their properties. Other zones will toggle bPainZone when triggered. The ZoneFog and ZoneFlash properties in ZoneLight allow you to change the player’s display color/fogging for a given zone.

The ZoneTerminalVelocity attribute changes the maximum falling speed of players in the zone.

There are now also EntrySound, EntryActor, and ExitSound attributes for zones. Zones with bWaterZone set will play these as pawns enter/leave the zone. These are modified for special water zones, such as lava or slime.

When a player enters a TeleporterZone, he is teleported by the associated teleporter (specified by the TeleporterZone’s TeleporterTag).

## Screen Flashes

There are two components used to create screen flashes. ViewFog is used to color the screen. It is a vector whose components are RGB values between 0 and 1. As ViewFog increases the brightness of the screen, you need to use ViewFlash to keep it from over-brightening.

ViewFlash is a vector whose components should be between 0 and –1 (for example (-0.5, -0.5, -0.5). It reduces the brightness of the screen. Typically, all the components will have the same value, which should have a magnitude about the same as the average magnitude of the ViewFog components to keep the screen from changing brightness.

## AI Difficulty Differences

Write this.

## Scripted Execs and Cheats

### Game Commands

*   FeignDeath pretend to be dead
*   Grab Pick up a decoration or "use" a mover
*   Say "xxx" Send message "xxx" to all players
*   RestartLevel
*   ThrowWeapon Toss out your current weapon.
*   Kick "name" Kick player named "name" off of server (only from bAdmin)
*   Pause
*   SwitchWeapon n Switch to weapon in weapon group n
*   Fire
*   AltFire
*   Jump
*   Suicide
*   AlwaysMouseLook b If b=1, always mouse look (and turn off SnapToLevel and
*   LookUpStairs. If b=0 turn off AlwaysMouseLook.
*   SnapView b If b=1, snap view back to horizontal when MouseLook is unpressed (and turn off AlwaysMouseLook). b=0 turns it off.
*   StairLook b If b=1, turn on automatic view orientation up and down stairs/slopes.
*   SetDodgeClickTime f Modify the dodgeclicktime (time between button presses for dodge move. F must be less than 0.3. A negative value disables the dodge move.
*   SetName "xxx" Change your name to "xxx".
*   SetTeam "xxx" Change your team to "xxx".
*   PlayersOnly Only players allowed in the level.
*   ViewPlayer "xxx" View the game from the point of view of the player named "xxx".
*   The view is only changed if you are allowed to see through this player’s eyes (e.g. a teammate in team play or coop mode).
*   SetAutoAim f Adjust autoaim. Setting it to 1.0 disables it.
*   SetHand xxx Set weapon hand to xxx= left, right, or center.
*   Taunt xxx Play the taunt animation xxx (wave, victory1, taunt1)
*   NeverSwitchOnPickup b Default is 0. If set to 1, then you never automatically switch to a picked up weapon.
*   PrevWeapon Switches to the next lower priority weapon.
*   NextWeapon Switches to the next higher priority weapon.
*   InvertMouse b Default is 0. If set to 1, then your mouselook is inverted.
*   ShowScores Toggles the display of the scoreboard in multiplayer games.
*   ShowMenu Cause the menu to be displayed.
*   SetSensitivity f Changes the mouse sensitivity scaling to f (a float).
*   SetBob f Changes the bob value to f (default is 0.016).
*   AddBots n Adds n bots to the level (game must be a DeathMatchGame or Subclass).

### Cheats

*   ViewClass xxx View the game from the point of view of a member of class "xxx". Successive executions of this function will iterate through the class. For example, ViewClass class’SkaarjWarrior’ will show you the game from the point of view of a Skaarj in the level, if there is one.
*   KillAll xxx Kills all actors of class xxx (including subclasses)
*   Amphibious Makes you amphibious (no limit to underwater time).
*   Fly
*   Walk
*   Ghost
*   ListInv Print a list of your inventory items to the log.
*   AllAmmo Gives you 999 ammo for all the weapons you have.
*   Invisible b b=1 makes you invisible. b=0 makes you visible.
*   TempStatus b b=1 turns the temporary status bar ( at the top of your screen) on. b= 0 turns it off.
*   God Toggles god mode.
*   BehindView b
*   SloMo f Changes the rate of time in the game. 1.0 is normal speed. 2.0 is twice normal speed. 0.2 is one fifth normal speed…
*   Players Prints a list of players and their current score.
*   JumpZ Changes your jumping height (260 is default).
*   KillPawns Removes all pawns from the game.
*   CheatAdd class’xxx’ Adds an actor of class ‘xxx’ right in front of you. This can be anything (a weapon, ammo, a creature, etc.), as long as an actor of that class exists or is referenced in your level.
*   RememberSpot Remember your current location (see ShowPath below).
*   ShowPath Show recommended path back to location remembered by
*   RememberSpot. Displays a beacon. When you touch that beacon, it shows the next one.
*   SetDesiredFOV f Sets your field of view to f (a value between 1 and 179).


