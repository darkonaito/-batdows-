for /f "tokens=2,3* delims=%dlms%" %%a in ("!ans!") do (
	set arg1=%%a
	set arg2=%%b
)
if "!arg1!"=="see"   goto :see
if "!arg1!"=="change" goto :change
goto :END
:see
echo - CURRENT VIRTUAL PATH:
echo "!Alt.Path!"
goto :EOF
:change
set "dlms2=^\"
for /f "tokens=1* delims=\" %%a in ("!arg2!") do (
	set arg3=%%a
	call :check2
)
goto :EOF
:check2
if not "!arg3!"=="root" (
	echo Percorso inesistente\invalido.
	goto :END
) else (
	if exist "!arg2!" (
		set Alt.Path=!arg2!
	) else (
		echo Percorso invalido.
		goto :END
	)
)
goto :EOF
:END