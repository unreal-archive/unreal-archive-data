> Note that this patch is not required for the Unreal Anthology or Steam versions.

### Crash Fixes

- Updated DefOpenAL32.dll which should fix EAX-related PlaySound crashes.
- Fixed VerifyImport crash (occurred when level changed after game settings modified).
- Fix for IKey assertion (crash) due to "special" keys on some keyboards (e.g. internet enabled keyboards).
- Fixed crash if some items used after they've been destroyed (fixes crash in MM_Marsh if player destroys force field as squad leader tries to disable it for example).
- Additional fix for decolayer density change for Sulferon Assault (and other maps with corrupt terrain info's).
- Possible fix for DirectMusic-related "GetEventTool" crashes.
- Fixed bug report system sometimes crashing or silently failing due to long URLs.
- Fixed GetOggDuration crash if â€œnosound" used.
- Fix for sound-related crash when exiting some levels with DirectX 9.

### Performance

- 10% improvement in golem mesh rendering performance.
- Fixed unnecessary particle lighting overhead problem.
- For performance reasons, most carcasses are cleaned up more quickly now.
- For performance reasons (mainly in marsh) dropped energy rifles are cleaned up after 10 seconds.
- M08B: improved performance by making sure generator rotating movers only rotate when they are visible.
- MM_Marsh: added field generator and turret to PreCacheList to avoid hitches when these appear.
- M12: fixed particle overhead.
- Added new code/changes to limit overhead due to ragdoll deaths (see "Advanced Tips for Improving Performance" in the readme for details).

### Fixes

- Sound fixes. Should reduce occurrences of sound "stuttering" that some people have had due to sound overload / thrashing.
- Fixed player dodge speed and height. Can be modified via user.ini settings (see DodgeXYVelocityScale and DodgeJumpZScale in the [u2Pawn] section).
- M03A1: gave ammo to merc with grenade launcher.
- M08B: lowered carcasses, blood to floor.
- M09E: fix for 2 fems staying "inert" if the fem with the RL is killed before being triggered.
- Fixed damage warnings (accessed nones) along with fix for damage effects (blood) being spawned so far inside character's mesh that it doesn't show up (currently only affects mukhoggs).
- Sunlight fix (flickering in waterfront and potentially other places).
- MM_Waterfront: fall out of world fix.
- M12: fixed sun disappearing in opening cutscene with ParticleDensity=0. Also CS_Outro, PA_Acheron, PD_Acheron.
- Display gamma/brightness/contrast values when changed via F10/F11/F12 keys.
- Fix for inert skaarj lying prone on bank in M08B (skaarj will now react to hearing the player even if player bypasses trigger).
- Fix for "Joe's" script breaking in M10_Avalon in some cases.
- Fixed changing actor detail level in-game could result in invisible NPCs (in TutA).
- Made key bindings delete button more obvious (click on this to delete key bindings).
- Fix from Jason Yu for bots sometimes not respawning after being killed in botmatches.
- Added files needed to fix umod support. The umod registry settings will also need to be modified for Unreal II umods to work. We're working on making a separate downloadable installer for this but in the meantime, people who installed the game in the default folder can click on the .reg file in Unreal2Help.
- Increased crawling spider damage by 3x.
- Fixed rammers not attacking properly.
- Fix for Golem references being lost resulting in "invisible" NPCs if game saved/loaded prior to spawning in NPCs which use a mesh which is no longer in the level.
- Fixed music not playing issue with some levels.

### Changes for v1403

- Added carcass cleanup particle effect.
- Added support for modifying player movement speed via Unreal2.ini setting (for the duration of the game). For example, to increase the player's movement speed by 50% set PlayerSpeedRatio=1.5 in the [u2GameInfo] section.
- M08B: fixed trigger that player could avoid.
- Added 70 and 72 Hz to refresh rates options.
- Support for scaling the hud / ui to better support multiple monitor setups. This can now be controlled via the ScaleX, ScaleY, OffsetX, - OffsetY properties in the [uI.UIConsole] section in Unreal2.ini. For example, use ScaleX=0.333 and OffsetX=0.333 for three screen support.
- Added "mouse over" context information for the EAX check box. Warns against enabling EAX on non-Audigy / Audigy 2 cards and warns about possible performance issues.

### AI for v1403

- Mod authors can once again enable script warnings / errors by setting bDisableErrorMessages=false (by default all script warnings / errors are silent). These were completely disabled for RC7 with the intent of re-enabling these for the patch. Note that you have to enable the Component=Console.MessageArea line in UIScriptsUI.ui (remove the ";") to see debug messages in-game.

### Editor for v1403

- Fix for not being able to paint on terrain in editor.
- Fix for terrain build crash if no terrain map in level.
- Fixed editor "first run" (UnrealEd.ini added to system folder).
- Fixed WBrowserStaticMesh::UpdateMenu crash.
- Fixed crash if you clicked on delete in the decolayer terrain tool, without a decolayer actually being selected.

### Testing / Stats for v1403

- Improved in-game profiling support / logging.
- Improved in-game stats. Added "stat lock".

### Other

- Added Mike Lambert to in-game credits.
