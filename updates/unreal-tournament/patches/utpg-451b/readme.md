## About UTPG

> UTPG are a group of programmers and server admins from the UT community who 
> got together and approached Epic about the possibility of maintaining the 
> Unreal Tournament code base. Since their goal of maintaining the game and 
> fixing obvious problems, while keeping all the major game-play systems 100% 
> intact, were right along with Epic's goals, Epic granted them access to the 
> source which allowed them to undertake this project. UTPGs focus is general 
> maintenance with some time spent dealing with security issues in the Unreal
> Tournament engine.
>
> Special thanks to Epic and specifically Joe (Dr. Sin) and Ryan (Linux guru) 
> for the support and assistance they gave to this project.

## Unreal Tournament version 451b Release Notes

Version 451b is completely network compatible with all previous public releases of UT. Server requires clients to be at least version 432.

- UnrealEd fixed
- Fixed a couple of bugs that caused the client and server to crash when invalid classes are loaded

## Unreal Tournament version 451 Release Notes

Version 451 is completely network compatible with all previous public releases of UT. Server requires clients to be at least version 432.

- WebAdmin fixed, linux server should have a working webadmin again
- Package code execution exploit fixed
- LogMaxConnPerIPPerMin defaults to false
- IRC chat client fixes
  - \n bug fixed
  - long lines are wrapped
  - wrapped lines are indented for better readability
- Added protection against brute forcing the admin login:
	```
	[Engine.GameInfo]
	LoginDelaySeconds=0.0   Number of seconds after an incorrect login before login is allowed again.
	MaxLoginAttempts=0      Maximum number of login attempts before an action is taken
	ActionToTake=           What to do when the maximum number of login attempts has been reached

	Values for ActionToTake:
	DO_Nothing
	DO_Log                  Will log the player's name, IP, and number of attempted logins to server's log
	DO_DisableLogin         Player will be unable to perform adminlogin for remainder of match
	DO_KickPlayer           Player will be kicked from server
	DO_KickBanPlayer        Player will be banned from the server
	
	ex: ActionToTake=DO_DisableLogin
  ```
- Added a caching system to the webadmin to reduce the impact on the running game
- Added `-logprefix` option to `ucc`. Enabled preflush log prefixes
- Extended IP ban list to allow 256 entires
- Fixed several bugs which allowed malicious clients to lag the server
- Clamped DefaultFow to values between 80 ~ 130
- Added bLogAdminActions to `[Engine.GameInfo]` - provides information about kick/bans/logins
- Fixed chat messages not appearing when game is paused
- Limit in-game name changes to 10 per map
- Fixed player details server query response
- Fixed mutators not appearing in server browser
- Added additional console commands for admins - kicklist, kickid, and kickbanid
- Added current map name to all pages in "Current" section of webadmin
- Added time remaining to pages in "Current" section of webadmin for timed matches
- Fixed LoginSeconds display in web admin to only show max number of allowed characters in textbox
- Added 'AdminAction' prefix to all log entries written by admin actions
- Improved the console functions 'get' and 'set' to allow editing of array config variables
  **Usage:** to get an value of an array item use the following command:
  ```
  get Engine.GameInfo IPPolicies #
  ```
  Where `#` is the number starting from 0, if you omit the number the first element is returned
  ```
	set Engine.GameInfo IPPolicies # new value
  ```
  Where `#` is the number starting from 0, you must specify the number
- Items in the open location box are moved up in the list when reused
- Fixed the scroll whell when using Logitec drivers (EM_EXEC)
- The download percentage for compressed redirects is displayed correctly now (the real percentage)
- Fixed spaces in redirected package names (note: you should NOT use spaces in package names)
- Fixed incorrect F6 details
- Added IRC half-ops support
- Netspeed command is limited to once every 15 seconds (as with UT2003)
- Fixed server lag exploit from chatting. Added a config variable "bLogTypingEvents" to the Engine.StatLog class. If the server does not wish to be vulnerable to this exploit, setting this variable to false will cause the resulting ngStats logs (both world and local) to not record player chatting events.
- Fixed lag exploit possible through replication statement error
- Fixed lag exploit with ShowInventory command
- Fixed lag exploit in the ShowPath command, only admins can use this command
- Server lag exploit possible from viewing players fixed
- Added refering game server to HTTP redirect request with the form: Referer: server-IP:port
- Merged Daniel Vogel's OpenGL driver with the source
- Added a new config option to set the minimal client version
  ```
	[Engine.GameEngine]
	MinClientVersion=432
  ```

## Unreal Tournament version 440 Release Notes

Version 440 is completely network compatible with all previous public releases of UT (versions 400, 402, 405b, 413, 420, 425, 428, 432 and 436). Server requires clients to be at least version 432.

- Implemented fixes provided by Epic to resolve exploit holes in UT Core files.
  - Resource "lunch" bug fixed
  - DoS bug fixed
  - Fake Player bug fixed
  - GameSpy Query loop
- Added Team information to query protocol
- Fixed backslahes in status query replies
- Fixed mutator listing in status query replies
- Fixed ucc buffer overflow
