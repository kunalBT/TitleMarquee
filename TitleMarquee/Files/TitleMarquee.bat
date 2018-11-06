@Echo off
SetLocal EnableDelayedExpansion

REM THis version is just a test for the MarqueeTitle Function for batch...
REM Offcial version will be launched after perfecting things... :)
REM #Kvc

REM Visit www.thebateam.org For more...

REM It is an upgrade to the older getlen.exe function, which was created using cpp's getlen function...
Set ver=1.0

REM Checking for various inputs to the fucntion...
IF /i "%~1" == "" (Goto :End)
IF /i "%~1" == "/h" (Goto :Help)
IF /i "%~1" == "/?" (Goto :Help)
IF /i "%~1" == "-h" (Goto :Help)
IF /i "%~1" == "Help" (Goto :Help)
IF /i "%~1" == "ver" (Echo.%ver% && Goto :EOF)

Set "_OriginalTitle=%~1"
Set _Direction=+

CAll Getlen "!_OriginalTitle!"
Set _Len=%Errorlevel%
Set _TMPvar=%_Len%

FOR /L %%A In (1,1,%~2) Do (Set "_Space=!_Space! ")
Set "_CompleteTitle=!_Space!!_OriginalTitle!"
Set _Title=!_OriginalTitle!

:Loop
If /I "!_Title!" == "!_OriginalTitle!" (Set _Direction=+)
IF /I "!_Title!" == "!_CompleteTitle!" (Set _TMPvar=%_Len%&&Set _Direction=-)

IF /I "!_Direction!" == "-" (Set "_Title=%_Title:~1%")
IF /I "!_Direction!" == "+" (
	Set /A _TMPvar+=1
	For %%A In (!_TMPvar!) Do (Set "_Title=!_CompleteTitle:~-%%A,1!!_Title!")
	)

Title .%_Title%
batbox /w %~3
goto :Loop


:Help
Echo.
Echo. Make your batch programs AWESOME by animating title of CMD.
Echo.
Echo. Syntax: Call TitleMarquee [TitleText] [WallLength] [AnimationDelay]
Echo. Where
Echo.
Echo. TitleText:		Text to Display as Title of CMD Console.
Echo. WallLength:		Max. width Upto which TitleText can Animate.
Echo. AnimationDelay:	Delay of time in ms, to move TitleText one step ahead.
Echo.
Echo.
Echo. Try these lines in a Batch file: [E.g.]
Echo.
Echo. Call TitleMarquee TheBATeam 120 40
Echo.
Echo. Visit More at: www.TheBATeam.org
ECHo. #TheBATeam 
Goto :End

:End
exit /b