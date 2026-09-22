Welcome to Flag Domination 2004! For those that are new to this, the idea is, as you may
have guessed, a cross between Capture the Flag and (Double) Domination. A map has either
two or three flags, each of which starts in a neutral location somewhere in the middle.
Each flag has a designated spot for each team to capture it, and (except in Scavenger or
Incursion mode) flags may be stolen once they are captured.

Capture points are marked with a rotating hologram showing the flag's symbol. Press the M
key while carrying a flag to see the route to your capture point. The HUD will also show
you in which direction the capture point lies, and in Vehicle Flag Domination the radar
map will hilite the capture point's location.

## Vehicle Flag Domination

VFD plays on Onslaught maps, with flags and capture points placed automatically where the
power nodes and cores would be.

These are the vehicle rules:

- As in Vehicle CTF, if you enter a Manta, Raptor or Cicada while carrying any flags, you
  will drop your flags.
- Vehicles around a flag base are neutral, but can only be used by a flag carrier -
  except of course for Mantas and Raptors.
- In the Rounds and Timed modes (see below), capturing a flag activates all nearby
  vehicle factories and turrets, just like completing a power node. The effect of
  stealing a flag is determined by the Vehicle Expiration option.

## Scoring modes: Rounds, Timed, Scavenger, and Incursion

**Rounds** (as in Double Domination)

A team must hold two flags for ten seconds to score a point. Some maps have three flags,
which adds another dimension to it:

- The first two flags you capture are the ones that count; they will flash in the HUD.
- To break a domination, you must steal one of those dominated flags.
- If you have all three flags when the countdown ends, you get 2 points instead of 1. It
  even counts if you capture the third flag at the last second.
- If you have all three flags and a dominated flag is stolen, the countdown resets.

**Timed** (as in UT Domination)

A captured flag scores one point every 10 seconds, or 15 in VFD. The interval is
controlled by the Time To Score interval.

**Scavenger**

You score a point each time you capture a flag. The flag reappears at its home base after
10 seconds.

**Incursion**

Like Scavenger, but inverted - you must go to the enemy capture points.

## Flag Points

With the Flag Points option, each flag has a limited number of points that can be scored
from it. This means that the pace and strategy of the game will change over time as the
easy flags get used up.

If the flags do not have enough total points left for the losing team to catch up, the
game ends. A bar in the HUD will show this: the colored portion shows how far ahead a
team is, and the white portion indicates the total points left before the game ends.

## Installation

**.ut4mod package**: Double-click on the `FlagDomination.ut4mod` file and follow the
instructions.

On the Mac version, you'll need to use the Terminal to install the files. Assuming UT2004
is in your Applications folder, and the Flag Domination package is on your desktop, the
command will be as follows (all on one line):

```
/Applications/Unreal\ Tournament\ 2004.app/System/ucc-bin umodunpack -x ~/Desktop/FlagDom/FlagDomination.ut4mod
```

**.zip package**: Extract the contents of the archive into your UT2004 directory.

On the Mac version, you can use the "Merge contents into destination" option in StuffIt
Expander's destination preferences, or you can install manually: expand the archive and
then copy the contents of the folders into corresponding folders in your
`[home]/Library/Application Support/Unreal Tournament 2004/` folder, creating any that
don't already exist. Don't replace any folders that are already there (like System); just
add to their contents.
