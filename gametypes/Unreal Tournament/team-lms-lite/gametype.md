## Rationale

Currently, it seems that Unreal Tournament LMS style games have taken a backseat to most
other UT gametypes.

I believe there are two general reasons for this. The first is that most LMS type games
automatically award every player all the standard UT weapons, fill up all of their ammo,
and remove all of the items in the level. Right off the bat, this reduces the
replayability of LMS games to practically nothing. The match simply turns into a rocket
fest with players jumping through the air madly shooting in random directions hoping that
one of their fifty rockets will happen hit a target.

The second is that once a player is eliminated, he/she is 'out'. Unlike Deathmatch,
Domination, or CTF - that player cannot continue playing, and is forced to become a
spectator until the other players finish their game.

However, I have always been of the belief that LMS games are the most effective means of
testing 'true' skill among all of the other UT gametypes. It is the core concept behind
LMS that makes the LMS gametype superior - the actual implementation of LMS is actually
what players are finding to be problematic.

However, LMS does -not- have to be 'rocket fest'. This is where Team LMS Lite comes into
the play.

## Synopsis

Team LMS Lite is a downward scalable modification of Last Man Standing Team Game by
Connor "RiEvEr" Caple. It allows for team-specific/weapon-specific restrictions to be
imposed on players which serve to eliminate the main problem of LMS style games - gauche
weapon handouts for each player, full ammunition, and full armor.

## Tweaks

**Armor**: Specify how much armor every player should spawn with. Ranges: No Armor (0),
Thigh Pads (50), Full Armor (100), Shield Belt (150).

**Dry Levels** (Suggested Value: True): Generally speaking, if this box is checked, all
items (weapons, ammunition, powerups, medicine, etc.) will be removed from the maps.

A few notes about Dry Levels: Remember that killed players drop weapons, and that corpses
decompose (time it takes until they disappear). If you have dry levels selected and
happen to see a weapon lying around somewhere, it has probably been left there from a
killed player. These weapons are not 'spawned' - and they will have a limited amount of
ammunition associated with them when you pick them up.

**Max Ammo For Handouts** (Suggested Value: False): If checked, this will fill all of the
selected team(s) projectile weapon handouts with the maximum amount of ammunition
possible. There are four boxes - the first corresponds to the red team; second, to the
blue team; third, to the green team; fourth, to the gold team.

**Default Inventory** (Suggested Value: False): Team LMS Lite overrides the
'AddDefaultInventory' function in UT. This means that all players no longer receive the
standard default weapons that UT normally offers - that being an Enforcer and an Impact
Hammer.

However, certain mutators override these 'defaultweapon' items with their own custom
items. Even though you may have these mutators selected, you will never see these special
items while 'AddDefaultInventory' is being overridden. That is why this option has been
provided.

**Proprietary Scoreboard** (Suggested Value: True): Team LMS Lite comes packaged with its
own scoreboard. It is a bit different than the regular TeamGamePlus scoreboard -
specifically in font size and layout. The scoreboard was designed to accomodate the full
list of players for each team (up to 16 w/ TeamSize Mutator).

## Requirements

Unreal Tournament v 4.36 - (Untested on Previous Versions)

Optional Mod/Mutator Interfaces (Recommended):

- Kakutou Mutator by PsychoKick
- Unreal 4Ever (U4E) v 6.02
- Mr. Pants' Excessive Overkill 1.0
- ChaosUT GOTYE

## Installation

Simply double-click on the UMod file and enter/verify the path to your UnrealTournament
directory. The process will install the mod automatically.
