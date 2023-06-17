set "dlms2='^|"
for /f "tokens=2,3,4* delims=%dlms2%" %%a in ("!ans!") do (
	set string=%%a
	set choices=%%b
	set variable=%%c
	if "!string!"=="/n" (
		choice /c %%b /n
		set %%c=!errorlevel!
	) else (
		if not "!string!"=="/n" (
			choice /c %%b /m "%%a" /n
			set %%c=!errorlevel!
		)
	)
)