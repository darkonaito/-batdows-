@echo off&color 09&setlocal enabledelayedexpansion&cls
::mode 50,25
title Off
:vars
set "ans="
set "comm=null"
set "dlms= "
set "ans="
goto :ask
:ask
title Off
if !help!==true (
	cls
	type !GUIs!altComm.txt
	echo.
	set help=false
)
set "result=null"&set "ans=null"
set/p ans=#
if "%ans%"=="" goto ask&if not defined "!ans!" goto ask
goto :read
:read
for /f "tokens=1* delims=%dlms%" %%Z in ("!ans!") do (
	set comm=%%Z
	if "%%Z"=="prompt" (
		call :prompt
	)
	if "%%~xZ"==".lap" (
		call :external2
	) else (
		if "%%Z"=="quit" (
			goto :END
		) else (
			call :external
		)
	)
	goto :vars
)
goto :ask
:external2
set file=!ans!
set "pat=!Sys.Prompt!interpreter.bat"
::echo FILE:!file! PATH:!pat!
call !pat!
goto :EOF
:external
if exist "!Prompt.Comm!"!comm!.bat (
	title On
	call "!Prompt.Comm!"!comm!.bat
) else (
	set "ERR=1"
	call "!Prompt.Comm!"error.bat
	goto :vars
)
goto :EOF
:prompt
set "dlms2= "
for /f "tokens=2* delims=%dlms2%" %%a in ("!ans!") do (
	set pat5=%%a
	call :sets
)
goto :END
:sets
if "!pat5!"=="alt" (
	set "Prompt.Comm=root\system\alternative\sys\commands\"
) else (
	if "!pat5!"=="norm" (
		set "Prompt.Comm=root\system\prompt\commands\"
	) else (
		if exist !pat5! (
			set "Prompt.Comm=!pat5!\"
		)
	)
)
:END