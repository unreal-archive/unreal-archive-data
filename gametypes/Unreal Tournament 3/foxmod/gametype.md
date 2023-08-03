Improved AI, Hor+ FOV widescreen support, proper splitscreen support and improved gamepad support for Unreal Tournament 3.

### General Additions:

 - Hor+ FOV support - automatically scales FOV based off aspect ratio and "Desired FOV" setting, with server-configurable FOV clamps
 - First-person weapons rendered correctly for wider aspect ratios
 - New menu options for most new features within reorganized options menu
 - Fixed crash when picking up dropped weapons as a network client
 - Campaign mutator support
 - Team-colored death messages for all modes
 - Safeguards to prevent profile corruption when the online profile isn't immediately retrieved

### Control Improvements:

 - Players can now cancel an engaged Scorpion boost by pulling back on the throttle
 - Translocator can now switch to previous weapon by pressing fire while holding alternate fire, and vice versa (like UT'99 / 2kX)
 - Working look-to-steer controls and associated "Vehicle Controls" option, rewritten to account for movement stick/keys heading
 - Adjustable controller deadzone
 - Special mode for improved "Mouse-Like Joystick usage" on a Steam Controller
 - Additional bindable controls:
   - Drop Flag / Weapon (Hold)
   - Toggle Crouch / Dodge
   - Toggle Impact Hammer
   - Fine Aiming (Gamepad)
   - Weapon Picker (Gamepad)
   - Show Base Path
   - Network Statistics
   - Screenshot

### Audio Improvements:

 - Fixed issues where certain sounds would play twice (translocation, weapon-switching, etc.), particularly for network clients (jumping, landing, etc.)
 - Music now correctly plays for network clients and features configurable action/tension music times
 - Music tracks are now always played under the "Music" audio group and guaranteed to loop (fixes issues with certain custom music in custom maps)
 - Fixed non-looping action music in DM-Deck (and any map that uses GoDown as music)
 - New voice messages for most vanilla characters
 - Subtle pitch randomization for voice messages
 - Ensure all voice messages of a particular category (taunts, status updates, etc.) have been played before allowing them to be reused
 - New SendSpeech console command for broadcasting specific voice clips, optionally to team only

### Splitscreen Support:

 - Drop-in / drop-out splitscreen support via "Splitscreen Players" menu slider - dynamically select number of splitscreen players from 0 to 3
 - Local profile system for splitscreen players to automatically save/load their settings
 - Proper settings configuration - settings such as A/V and Network settings can only be set by first player
 - Fully functional splitscreen audio - including music, dialogue and announcement support
 - Proper voting support - local players all mirror each other's votes
 - Automatic guest-style player renaming - "fox", "fox(2)", "fox(3)" instead of "Player258"

### Enhanced Gamepad Support:

 - Tighter looking and aiming controls, with adjustable quick-turn sensitivity
 - Optional "Fine Aiming" bindable control to shrink the crosshair and set finer aim sensitivity (not bound by default)
 - Subtle auto-aim and control tweaks for inputs received from a gamepad - gamepads can be used in tandem with a keyboard/mouse - features toggle as appropriate
 - Revamped default control setup
 - Analog stick quick-configuration - southpaw, legacy, etc.
 - Fully remappable gamepad controls - some were mysteriously missing

### AI Improvements:

 - Anti-stuck measures for bots, fixing issues such as getting stuck in DM-Turbine
 - Better follow behavior - bots utilize Link Gun properly when following and break off for combat/items when appropriate (within range and line-of-sight to leader)
 - Reliably engage targets (enemies and objectives) when flying through the air (e.g. from jump pads etc.)
 - Attack any visible part of objects (helps tremendously on attacking Power Nodes / Cores - AI can now complete Confrontation with the Leviathan)
 - Keep charging weapons charged as long as possible when target can not be attacked (shot blocked etc.)
 - Avoidance Mapping system that allows bots to choose potentially longer, but safer paths when running an objective (potentially expensive)
 - Look around more when idle for better situational awareness (requires Avoidance Mapping to be enabled)
 - Better use of level geometry as cover during fights
 - Crouch more often, particularly if it allows hitting a target that could not otherwise be hit
 - Try to jump and wall-dodge more often in combat
 - Avoid lifts if they have already been used and would need to wait
 - Greater avoidance of areas where deaths have occurred that match
 - Allow use of hunting and "devious" behavior in team games and when large numbers of bots are present
 - Utilize defensive spots that erroneously have no objective defined (just assume closest objective)
 - Organize larger squads for better coordination (by default, one squad per order)
 - Pick new squad leader more often, based on leader distance to objective (helps push objectives)
 - Randomly assigned initial orders; influenced by other bots' orders and whether team is lead by a player
 - Periodically reassign orders on all-AI teams / after last human player leaves team
 - Always hunt super pickups, no matter how far away, in games with no objective (e.g. Deathmatch) or if freelancing
 - Always pick up nearby useful inventory, regardless of goal (configurable - enabled by default)
 - Extended vehicle pathfinding; AI will now attempt to drive vehicles anywhere they'll fit
 - Improved vehicle usage all-around, particularly in combat
 - Intelligently use any vehicle of opportunity (based on current vehicle if appropriate), not just squad vehicles
 - Prefer enemy unlocked vehicles to help tip vehicle usage in their team's favor
 - Prefer certain vehicle types according to effectiveness - generally prefer flying vehicles, fast vehicles for objective capping, artillery, etc.
 - Move in position to tow the flag carrier when appropriate and in a fast vehicle - Scorpion, Manta, etc.
 - Try harder to get a vehicle unstuck before simply abandoning it
 - Remain in vehicles if near an objective and someone else nearby is on foot (to help cover them)
 - Use Leviathan more effectively and move it more often
 - Get out of stationary vehicles/turrets for pending Titan transformation, or if an enemy is too close to shoot
 - Utilize track turrets based on how enemies are visible to nodes along the track
 - More intelligent use of Hoverboards and tow cables, particularly in Warfare
 - Don't randomly engage Scorpion self-destruct and use jumping ability of vehicles more often (Manta, Viper, Scavenger, etc.)
 - Attack empty locked enemy vehicles to thin out base defenses
 - Honk horn when looking for passengers
 - Attempt to fetch passengers when flying an air vehicle and not in combat - optimal Cicada usage for starters
 - Attempt to get out and heal vehicles when not busy
 - Attempt to toss flags and weapons when appropriate - will toss flags to stronger teammates closer to base, weapons to very weak teammates
 - Prefer to grab the enemy flag when attacking even if the friendly flag is taken (more realistic)
 - Improved general Translocator usage (use it more often, don't sit still when waiting for Translocator discs, etc.)
 - Leave Translocator discs around to possibly teleport to later (e.g. to escape danger, or immediately teleport back to enemy flag after a successful flag run)
 - Shoot Translocator discs to disrupt them more often
 - Improved jumping out of water behavior
 - Improved Orb handling
 - Improved Warfare teleporter usage
 - Keep a Hold Position order after respawning
 - Taunt and give praise on cool actions (flag captures, multi-kills, sprees, etc.)
 - Improved shootable door behavior (like on Turbine) - use Enforcer or other weapon guaranteed to open door if possible
 - Use Impact Hammer on invulnerable or heavily shielded enemies to knock their powerups off if appropriate
 - Allow use of Stinger secondary fire at close range
 - Necris and Krall bots no longer randomly spout human speech - particularly incoming vehicles
 - Krall bots now speak subtle grunts over the comms (bored, in combat, etc.) instead of RAWR all the time
 - Say "Incoming" instead of calling for backup when near teammates and outgunned
 - Various bug fixes over vanilla AI, and probably some new bugs :)
