set "dlms2=^)^({}"
for /f "tokens=2,4* delims=%dlms2%" %%a in ("!ans!") do (
	set condition=%%a
	set cond_comm=%%b
	call :if
)
goto :END
:if
if %condition% (call :execute) else (goto :END)
goto :EOF
:execute
for /f "tokens=1* delims= " %%a in ("!cond_comm!") do (
	set "ans=!cond_comm!"
	call "!pat3!\"%%a.bat
)
goto :EOF
:END