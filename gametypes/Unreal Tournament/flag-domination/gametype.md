## How to play

- Step 1: find a flag
- Step 2: bring it to the designated spot for your team
- Step 3: steal any flags the other team(s) have captured

Repeat as necessary.

Flag Domination is, as you might guess, a cross between Domination and Capture the Flag.
The flags are not team flags; they're neutral, and they don't start out in any team's
posession. Each flag has a designated "receptacle" for each team, and the longer it's
there the more points your team gets, just like the control points in Domination.

## The flags

The maps included in this package have three flags, usually the Lion Flag, the Bat Flag,
and the Snake Flag. Mapmakers can make maps with as many flags as they want, with any
name and logo.

## The improvements

version 1.1:

- Added support for Flag Mutators
- Added the option to translocate without dropping flags. Your translocator beacon will
  be returned to you whenever you pick up a flag.
- When one team has all the flags, bots on the other team will tend to attack in waves.
- Changes to FD-November: moved the Snake Flag under the sub, and fixed some DefensePoint
  bugs, some of which are actually wrong in the original CTF-November (DPs in the Blue
  base are marked as team 0, Red).

## The maps

Before you play you might want to check out the maps, and maybe watch what the bots do,
so you don't end up wandering around like an idiot with a flag on your back.

**FD-Coret** - A converted version of CTF-Coret. I removed the damage amplifier since
that's where the Lion Flag went.

**FD-Face** - A converted version of CTF-Face. I removed the keg-o-health because that's
where the flags went.

**FD-November** - A converted version of CTF-November. This was a good candidate for
conversion because the bases are so big, allowing me to spread the flags out a bit more.
Lots of work went into the bot paths; they may even play better than in the original :)

**FD-Sesmar** - Another Domination conversion based on DOM-Sesmar. It was a bit of a
trick getting the bots to jump the gaps to get to the side Ankh rooms. I removed the
damage amplifier because it ended up being in the red team's corner. You'll notice in
this map that you're not restricted to the Lion, Snake, and Bat flags in your maps.

**FD-Rush** - A conversion of DOM-Rush, originally by Niklas "TheJokeR" Nolte. I think
this map works better for Flag Domination than for regular Domination :)

## Plans

Some ideas for improvement include having a time limit for each flag, setting how fast
each flag scores points, or a "monopoly limit" on how long a team can hold all three
flags.
