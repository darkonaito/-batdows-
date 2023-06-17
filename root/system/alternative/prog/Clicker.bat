@echo off
title Clicker in Batch! :D (by Andrecraft)
color 02
:ini
set Data=!Alt.Prog_D!clicker\
set "name="
:menu
cls
echo.
echo  Clicker in Batch.
echo.
echo.
echo    [N]ew Game
echo.
echo    [L]oad Game
echo.
echo    [O]ptions
echo.
echo    [E]xit
echo.
:cho1
choice /c nloe /n
if "!errorlevel!"=="1" (
	goto :new_game
)
if "!errorlevel!"=="2" (
	goto :load_game
)
if "!errorlevel!"=="3" (
	goto :options
)
if "!errorlevel!"=="4" (
	goto :END
)
:new_game
cls
echo.
set/p "name=Che nome vuoi utilizzare? "
::
call :check
echo.
echo Ciao, !name!, benvenuto in Clicker^^!
echo.
pause>nul
call !Data!new.bat
call !Data!click.bat
pause>nul
goto :END
:check
if not "!name!"=="" (
	title !name!
	goto :new_game
) else (
	if not exist "!Data!users\"!name! (
		md !Data!users\!name!
	) else (
		goto :load_game !name!
	)
)
goto :EOF
:load_game
:options


:END
set help=true
call !Alt.Sys!desk.bat