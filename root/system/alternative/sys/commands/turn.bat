for /f "tokens=2,4* delims=%dlms%" %%a in ("!ans!") do (
	if "%%b"=="true" (
		set %%a=%%b
	) else (
		if "%%b"=="false" (
			set %%a=%%b
		) else (
			goto :END
		)
	)
)
:END