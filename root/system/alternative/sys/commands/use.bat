for /f "tokens=2* delims=%dlms%" %%a in ("!ans!") do (
	call !Alt.Path!%%a
)