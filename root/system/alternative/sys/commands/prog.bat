for /f "tokens=2,3* delims=%dlms%" %%a in ("!ans!") do (
	set arg1=%%a
	set arg2=%%b
	if "!arg1!"=="see"   goto :see
	if "!arg1!"=="start" goto :start
)
goto :END
:see
echo - PROGRAMS:
for %%a in ("!Alt.Prog!*") do echo %%~na
echo -
goto :EOF
:start
if exist !Alt.Prog!!arg2!.bat (
	call !Alt.Prog!!arg2!.bat
) else (
	echo Programma inesistente.
	goto :END
)
:END