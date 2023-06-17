for /f "tokens=2* delims=%dlms%" %%a in ("!ans!") do (
	color %%a
)
exit/b