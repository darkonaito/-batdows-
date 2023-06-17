set "dlms2=' "
for /f "tokens=2,3,4,5* delims=%dlms2%" %%a in ("!ans!") do (
	if "%%a"=="n" set %%b=%%c
	if "%%a"=="a" set /a %%b=%%c
	if not "%%d"=="_" echo !%%b!
)