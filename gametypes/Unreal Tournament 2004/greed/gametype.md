In this new gametype, kills don't get you points. Instead killed people drop a coin. You must pick it up and take it to a drop point to
score it. However, to score faster, you should hoard your coins, as the scoring is like this:

- 1 coin = 1 point
- 2 coins = 2 points
- 3 coins = 4 points
- 4 coins = 7 points
- ...etc.

The drawback is when someone dies and they're holding coins, they'll drop all of them! So you must decide whether to go for the score or try
to get that extra kill.

Actually, the item doesn't have to be a coin. It can be a ring, a skull, whatever you want. You can choose from a few different items by
clicking "Configure Key Item" on the Game Rules tab or you can create your own and add them to the list. See Creating Custom Key Items for
more information on that.

There is a Free for All version and a Team version, called (surprise!) Team Greed. In Team Greed, your team tries to score in the drop
points of the same color, while defending the ones the other team can score in.

Bots completely understand how to play and will intelligently decide whether or not to go for the score. Sometimes they'll even camp the
drop point like a human player would.

In Team Greed keep in mind that the bots interpret Freelance and Attack to be the same thing (kill the enemy and take their coins to the
drop point), and that Defend means "defend the closest drop point to you that enemies can score at". Bots with the same Attack or Freelance
orders will group together and protect a single bot who will try to pick up as many coins as possible.

Greed & Team Greed can be played on ANY map. In Deathmatch, drop points are randomly generated, and in teamplay maps the drop points are put
where the flag, domination point, or goal would normally be. (You can also force random generation even on maps with these features)

Mapmakers can make Greed-specific maps simply by loading Greed.u in UnrealEd's Actor Class Browser, placing a GreedDropPoint where you want
and setting its LinkedNavPoint property to the NavigationPoint it sits on (it must sit on a nav point or the bots won't find it). Also,
while the game can automatically convert any normal Greed maps to Team Greed, I recommend assigning a Team value to them anyway.
