set "dlms2=-"
echo !ans!
for /f "tokens=2,3,4* delims=%dlms2%" %%a in ("!ans!") do (
	echo %%a
	set comm2=%%b
	set "ans2=%%c"
	if "%%a"=="alt" (
		call :alt
	) else (
		if "%%a"=="norm" (
			call :norm
		) else (
			goto :END
		)
	)
)
goto :END
:alt
if exist "!Alt.Comm!"!comm2!.bat (
	call !Alt.Comm!!comm2!.bat
) else (
	goto :END
)
:norm
echo NORM
:END