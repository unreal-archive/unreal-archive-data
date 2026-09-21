A pack of add-on game types and mutators for Tactical Ops: Assault on Terror 3.4. Each
game type is launched from Tactical Ops' own "Mod" menu, or set on a server with a
`game=` parameter against `TacticalOps.ini`. The base Tactical Ops mod is required.

## Tactical Ops: Assault

This new mod for TO is more like an addons. It add player class based system.

There is 3 differents player classes:

**Support**, can carrying:

- for SF: [M16, M4A1] [Spas, Desert Eagle, Beretta] [HE, Conc, Smoke] [Night-Vision] [Armour] [Knives]
- for terrorists: [M16, AK47] [Mossberg, Desert Eagle, Glock] [HE, Conc, Smoke] [Night-Vision] [Armour] [Knives]

**Sniper**, can carrying:

- for SF: [MSG90] [SMG II, Desert Eagle, Beretta] [Smoke] [Night-Vision] [Armour] [Knives]
- for terrorists: [MSG90] [Uzi, Desert Eagle, glock] [Smoke] [Night-Vision] [Armour] [Knives]

**Assault**, can carrying:

- for SF: [MP5SD, Spas] [Beretta] [Conc, Flash, TearGas] [Night-Vision] [Armour] [Knives]
- for terrorists: [MP5, Mossberg] [Glock] [Conc, Flash, TearGas] [Night-Vision] [Armour] [Knives]

There is no more money, you can buy which weapons, of your class, you want.

For LAN or standalone, use the "Mod" menu of TO, you will see "Start new Tactical
Assault game".

## Tactical Ops: Capture the flag

This new mod for TO remove all classics TO maps scenarios to do a classic CTF game.
Each team has his own flag, in them base.

You must capture the flag of the opposite team and pass in your flag in your base to
score.

New commands:

- `ToggleAutoAnnouncer`: The Announcer give time remaining before end of 'God' state
- `s_kAutoBuyArmor`: Enabled as default, buy automaticaly full armor when you are respawned

For LAN or standalone, use the "Mod" menu of TO, you will see "Start new Tactical Flags
game".

## Tactical Ops: Death Match

This new mod for TO remove all classics TO maps scenarios to do a classic deathmatch
game. Where there is no rules, kill everybody without team distinction.

You are spawned randomly somewhere in the map, there's no more team/home base/etc...

New commands:

- `ToggleAutoAnnouncer`: The Announcer give time remaining before end of 'God' state.
- `ToggleMyCurrentScore`: Display at right bottom, your number of frags.
- `s_kAutoBuyArmor`: Enabled as default, buy automaticaly full armor when you are respawned

For LAN or standalone, use the "Mod" menu of TO, you will see "Start new Tactical Match
game".

## Tactical Ops: Monster Attack

A round-based monster survival game type. Monsters are spawned each round, optionally
only at the terrorist start point or randomly across the map, and can be configured to
carry Tactical Ops weapons. Settings are configured from the "TOMA Settings" tab when
launched from the "Mod" menu, or from `TOMA2.ini` on a server.

It is compatible with the Midnight Assault mutator, but you must use another class name
to associate it: `TOMA2.TOMA_MAMutator`, or choice "TOMA: Operation: MidnightAssault"
in the mutator list.

## Tactical Ops: Escort the VIP

This is a mutator for Tactical Ops: Assault on Terror v3.4. It replace scenario map by
an escort the vip scenario. Each round, a special forces is choice to be the VIP.

The VIP can't buy, he have 150 Health Point, full armor and a Desert Eagle. He must
reach the escape zone. The others SF must help him, and the terrorists must kill him.

The escape zone is the "hostages rescue zone" when it's a rescue hostages map scenario,
or the "bombspot" when it's a C4 scenario map.

The mutator is simply added to the "Mutator" list.

## TOExtra

TOExtra integrate some various small mutators. All Works on TOST4.1.

- `HostageDown`: Add the "Hostage down" radio sound when a hostage is killed, like in SWAT1.1
- `TOBulletTime`: Add bullet time in game.
- `WeatherMap`: Add special weather in map, "Snow" or "Rain".
- `PathNodeGlowStick`: Automaticaly draw the pathnode of map with some glowstick, funny for MidnightAssault Mutator
- `KeepTheFlag`: A Capture The Flag variant, requires the CTF packages and game type.
- `TOSgtNutzPlayerModels`: Replace all player models by the Sergent Nutz :))

## Installation

Copy the `System`, `Textures`, `Sounds` and `Help` folders over a Tactical Ops 3.4
installation. For a dedicated server the relevant packages must be added to
`ServerPackages` in `[Engine.GameEngine]` of `TacticalOps.ini`, and the game type
selected with its class name, for example:

```
UCC.exe server TO-Scope.unr?game=TOCTF.TFMod INI=TacticalOps.ini
```

A `MODTOSTMap` package is included for TOST 4.1 map vote compatibility: change your
map handling from `TOSTTools.TOSTMapHandling` to `MODTOSTMAP.MODTOSTMapHandling`.
