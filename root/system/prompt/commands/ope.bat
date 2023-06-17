for /f "tokens=2* delims=%dlms%" %%a in ("!ans!") do (
	set calc=%%a
	call :oper
)
exit /b
:oper
set/a "result=%calc%">nul
set LAST_RES=%result%
echo %result%
goto :EOF