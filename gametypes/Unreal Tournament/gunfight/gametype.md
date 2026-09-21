Small squads. One life. The same random kit for everyone.

Gunfight is a round-based team elimination game type for Unreal Tournament
(1999). Play with 2, 3 or 4 teams of 1 to 4 players each. Everyone receives the
same weapons and round modifier, then the last surviving squad earns a point.
Bots, mixed DM/CTF/DOM map lists, optional ChaosUT content and Epic relics are
supported.

## How rounds and scoring work

1. Squads spawn together in separated areas of the map.
2. During the countdown you may look around, but cannot move or fire.
3. At GO, everyone receives the same random loadout and modifier and is
   released to move. You start at 100 health, or 199 on health-keg rounds.
4. Hunt the other squads. Map pickups and dropped weapons cannot be collected.
   One death eliminates you until the next round; you spectate while waiting.
   A Redemption rescue, when selected, is the special one-use exception.
5. Eliminating the final opposing team locks one point for the surviving
   squad. The round result is shown after any cinematic finish.
6. After the intermission, players and inventories reset and a new shared
   loadout is selected. Team round-win scores carry through the match.

### Locked wins and draws

Once the final enemy elimination establishes a surviving winning squad, that
win is fixed. A later rocket, fall or Vengeance explosion cannot turn it into
a draw, even if every member of the winning team subsequently dies. This rule
also applies with slow motion disabled.

A wipe with no previously established winning squad can still draw. If a
round times out, the team with the most living players wins. Among teams tied
for that lead, total remaining health breaks the tie. If the leaders are still
equal, the round is drawn. A drawn round awards no point and still counts
toward the configured match length. Set Round limit (sec) to 0 for no timer.

All configured rounds are played; the match is not a first-to-N series.
The team with the most round wins at the end wins the match. A tie for first
is a match draw, with no additional tiebreak round. Individual frags on F1 are
separate from the team round-win score.

## Weapons, ammo and fun loadouts

### Ordinary rounds

Everyone gets one lower-tier gun with its standard pickup ammo, one higher-tier
gun with a limited reserve, and the selected melee weapon. You begin holding
the lower-tier gun. Include Translocator can add a Translocator to this kit.

Standard lower tier and starting ammo:
Enforcer: 30; Bio Rifle: 25; Pulse Gun: 60; Ripper: 15; Minigun: 50.

Standard higher tier:
Shock Rifle, Flak Cannon, Rocket Launcher and Sniper Rifle: 5 ammo units.

When ChaosUT is enabled and installed, its supported guns join the pool:

- Lower tier: standard Crossbow (10), CAS12 (16), Fire/Ice utility guns (10),
  Air Gun (its native unlimited use).
- Higher tier: explosive/poison crossbows, AP/explosive CAS12, both Claw/Flak
  variants, Proxy Mines and both Chaos sniper variants: 5 units.
- TurretLauncher: 1 use.
- Vortex: 1 use, subject to the superweapon rules below.

Redeemer also has 1 shot when superweapons are enabled. "5 ammo units" does not
guarantee five trigger pulls: a volley, charged attack or combo may spend more
than one unit. Low-tier ammo is the normal pickup amount, not maximum capacity.
Ammo resets each round and does not regenerate during ordinary rounds.
The two guns cannot share an ammo pool, preventing one reserve from refilling
the other. Gunfight suppresses Chaos's extra sibling-weapon grants.

### Instagib rounds

The Enhanced Shock Rifle is included in the standard gun rotation. When
selected, everyone gets ONLY that rifle, with its native unlimited firing:
no second gun, melee or Translocator. The shared modifier still applies.
No Instagib mutator or Allow superweapons setting is required.

### Melee

Choose Impact Hammer, Chainsaw, Sword or Random. Random chooses one shared
melee weapon for the entire round. The default sword class is ChaosUT.Sword.
An unavailable sword falls back to Impact Hammer. Instagib rounds omit melee;
all five fun presets below retain it.

### Rare superweapons

Allow superweapons controls Redeemer and ChaosUT Vortex together. It defaults
off. When enabled, the default is one combined 5% chance per eligible normal
round, with at least 6 intervening rounds after a superweapon round. This
allows at most one superweapon round within any seven consecutive rounds.
The first round may be eligible, but a superweapon is never guaranteed.

If the roll succeeds, one available superweapon is selected. Vortex requires
ChaosUT to be installed and enabled. Supers cannot enter through the other
gun slot. Fun rounds count toward the waiting gap but never contain a super.
Instagib and TurretLauncher are outside this rare Redeemer/Vortex category;
the turret stays in the ordinary Chaos rotation with its one-use reserve.
The chance and waiting gap are adjustable in Rules > Weapons.

### Fun loadouts

By default, each round has a 25% chance of using a fun preset. The checked
presets have equal odds within that selection. At 100%, only enabled fun
presets play; with none checked, the ordinary rotation is used.

- **Shotty Sniper** — Flak Cannon (10), Sniper Rifle (5), selected melee.
- **Shotguns Only** — Flak Cannon (10), selected melee.
- **Snipers Only** — Sniper Rifle (8), selected melee.
- **Infinite Minigun** — Minigun with unlimited primary/secondary fire, plus melee.
- **Melee Only** — Selected melee, no guns.

All five retain the shared modifier and starting-armor setting. The optional
Translocator is allowed in Shotty Sniper; the other four presets omit it.
These presets use stock UT guns independently of the Standard UT guns and
ChaosUT gun-pool switches. Optional melee and modifiers still obey their
Chaos/relic settings. The infinite Minigun's ammo display remains full, and
its unlimited ammo does not carry into a later ordinary Minigun round.

## Modifiers and optional content

Enable random modifiers selects one shared bonus for everyone each round.
The available choices are:

- **No modifier** — No bonus; configured starting armor still applies.
- **Full armor** — 100 body armor.
- **Shield Belt** — 150 shielding.
- **Invisibility** — Native UT invisibility, lasting 50 seconds.
- **UDamage** — Native Damage Amplifier, lasting 30 seconds.
- **AntiGrav Boots** — Three boosted jumps.
- **Big Keg O' Health** — Start combat at 199 health instead of 100.
- **Chaos Gravity Belt** — Auto-activated belt; requires enabled, installed ChaosUT.
- **Chaos Grappling Hook** — Requires enabled, installed ChaosUT.
- **Epic relic** — One of the six enabled, installed relic types.

All players receive the same result. Effects and inventory reset next round.
Starting armor is separate from the random modifier. A full-armor or Shield
Belt modifier replaces that baseline rather than adding another armor item.
Turn off Enable random modifiers to disable every random bonus, including
Chaos gadgets and relics. With no eligible choices, the result is no modifier.

Relics enter the pool as one category, then a relic is picked within it.
Chaos gadgets also share one category. The list is therefore not an equal
chance for every individual relic and item.

## Default match

    Teams:                  2 teams of 2 players (2v2)
    Match length:           7 rounds
    Countdown:              5 seconds before each round
    Combat time limit:      120 seconds per round
    Intermission:           5 seconds after the round result
    Spawn area rotation:    Every 2 rounds
    Empty slots:            Filled with bots
    Health / base armor:    100 / 0
    Fun loadout chance:     25%, with all five presets enabled
    ChaosUT content:        Enabled if installed; stock fallback if missing
    Relics / superweapons:  Both disabled until selected
    Final kill slow motion: Enabled

Teams use Red, Blue, Green and Gold. Team size is a capacity, so 4 teams of
4 gives 16 total players. With bot filling disabled, a match can start with
at least one human on every participating team. A human joining a full
bot-filled match replaces a bot and enters combat in the next round.
Team changes are locked once a match starts.
