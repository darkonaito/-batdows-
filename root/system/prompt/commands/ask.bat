set "dlms2='"
for /f "tokens=2,3* delims=%dlms2%" %%a in ("!ans!") do (
	set/p "%%b=%%a"
)