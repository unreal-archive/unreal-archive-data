The concept behind CTF4 is simple: Capture the Flag, but with 4 teams instead of 2. Why would
4 teams be better than 2 you ask? Simple: More action, more choices, more strategy.

With four teams the objective becomes more than just attacking the enemy flag and defending
your own. You must think carefully about which team to attack. Because other teams can get
points without ever attacking your base (they can attack the other teams instead) - it becomes
important to watch what all the teams are doing. Just because you have a strong defense does
not mean you will win!

CTF4 also comes with TDM4, which is Team Deathmatch with up to 4 teams.

## Playing the Game

Simply fire up UT2004, go to Instant Action or Host Game, and select "CTF4" for your gametype.

## Dedicated Server

To run a CTF4 dedicated server, add `?Game=OLTeamGames.OLCTFGame` to the commandline of your
server.

To run a TDM4 dedicated server, add `?Game=OLTeamGames.OLTeamDeathmatch` to the commandline of
your server. If you would like to only have 3 teams in your server, add `?NumTeams=3` to your
commandline.

## Skins

By default, if a skin does not have green and gold versions, then the skin will fall back to
the default model. This is so that you do not get players in the game whose team you cannot
identify. However, as of version 1.0.1.0, you can turn on a client side option that will allow
these "invalid" skins to load anyway.

To make a skin compatible, either include green and gold skins inside the skin package with the
suffixes `_2` for green and `_3` for gold, or put them in a separate package named
`<YourPackageName>_4teams.utx`.

## The 4Teams Compilation

The 2011 compilation release is not the work of the CTF4 team. It bundles CTF4 and TDM4
together with the other four team game types built on top of them:

- BR4 - four team Bombing Run, by David "Uncommon" Catmull, with up to eight balls per map and
  Team Balls rules that decide who may pick up or score which ball.
- VCTF4, VCTF3 and ONS4 - "Like CTF4, but with vehicles!" and Onslaught with four teams.
- Freon4 and TAM4 - four team versions of Freon and Team Arena Master, still in beta.

Versions in that package: CTF4 and TDM4 1.0.1.1, BR4 1.0, VCTF4 beta, 4spn beta. It expects
UT2004 patch 3369 and the ECE Bonus Pack.
