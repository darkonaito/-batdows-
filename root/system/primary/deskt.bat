:main
call !Sys.Prim!ini.bat
set n=1
title Desktop  (%USER%)
color 0f
mode 130,35
goto cho1

:chos
choice /c ASROF >nul
if %errorlevel%==1 goto arrow
if %errorlevel%==2 goto shutdown
if %errorlevel%==3 goto restart
if %errorlevel%==4 goto open
if %errorlevel%==5 goto refresh
goto :EOF

:cho1
cls
set sel=app
type "!GUIs!"selApp.txt
echo n=%n%
type "!GUIs!"main.txt
call :chos
:cho2
cls
set sel=resources
type "!GUIs!"selResources.txt
echo n=%n%
type "!GUIs!"main.txt
call :chos
:cho3
cls
set sel=prompt
type "!GUIs!"selPrompt.txt
echo n=%n%
type "!GUIs!"main.txt
call :chos



:arrow
set/a n+=1
if %n% GTR 3 set n=1
goto cho%n%

:shutdown
exit

:restart
call !Sys.Prim!reboot.bat
:open
if %sel%==app call "!Acc.User!apps\"visualize.bat
if %sel%==resources call "!Sys.Prim!"workspace.bat
if "%sel%"=="prompt" call "!Sys.Prompt!"MAIN.bat
goto main
:refresh
goto main

:prompt
cls
type "!GUIs!"Prompt.txt
type "!GUIs!"main.txt


