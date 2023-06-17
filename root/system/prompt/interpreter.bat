@echo off
set "pat3=C:\Users\dark0\Desktop\#batdows#\root\system\prompt\commands"
setlocal enabledelayedexpansion
set "Prompt.Comm=root\system\prompt\commands\"
if not "%~1"=="" (
	set def=true
) else (
	set def=false
)
::set pat2=!Prompt.Laps!!file!
if "!def!"=="true" (
	set "pat2=%~1"
	set "file=%~nx1"
) else (
	set "pat2=root\system\prompt\lapis\!file!"
)
::echo PAT2=!pat2! DEF=!def!  PERC1=%~1 FILE=!file!
for /f "tokens=* delims=" %%a in (!pat2!) do (
	::echo %%a
	set comm=%%a
	call :vars
	call :for2
)
goto :END
:vars
set ans2=!comm!
goto :EOF
:for2
set "dlms= "
for /f "tokens=1* delims=%dlms%" %%a in ("!ans2!") do (
	set A=%%a
	set ans=!comm!
	if "!def!"=="false" (
		if exist "!Prompt.Comm!"%%a.bat (
			call "!Prompt.Comm!"%%a.bat
		) else (
			!ans!
		)
	) else (
		if exist "!pat3!\"%%a.bat (
		call "!pat3!\"%%a.bat
		) else (
			!ans!
		)
	)
)
goto :EOF
:END