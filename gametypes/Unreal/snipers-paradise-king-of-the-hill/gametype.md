A King of the Hill game type for Unreal, as run on the Sniper's Paradise servers.

Maps carry one or more hill triggers. Standing on a hill accumulates time for you, and
the player with the most time on the hill wins the match. The current king is lit up so
that everybody can find them — the glow colour is configurable, and the game announces
"The King is glowing -GREEN-" (or red, white or yellow) whenever the crown changes hands.

Three scoring settings are offered:

- **Original KOTH mode**
- **Penalty mode**
- **Zero-Point mode**

Matches end on a hill time limit rather than a frag limit, though an optional frag limit
can be set as well. Frag scoring, monsters and human-only play are all switchable, and a
map list of the hill maps installed on the server is configured from the "KOTH Map List"
entry under Advanced Options.

## Installation

Extract the archive into your Unreal directory:

- `SP_KoTH.u` and the `.int` / `.ini` files go in `System`
- pick King of the Hill from the list of game types
