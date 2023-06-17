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