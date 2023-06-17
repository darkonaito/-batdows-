::var_ str:frase 'Ciao a tutti'
::var_ int:numero 12
set "dlms2=^:^'"
for /f "tokens=1,2,3,4* delims=:' " %%a in ("!ans!") do (
	::echo A="%%a",B="%%b",C="%%c",D="%%d"
	set "mode=%%b"
	set "var=%%c"
	if "%%b"=="str" (
		set "!var!=%%d"
	)
	if "%%b"=="int" (
		set /a "!var!=%%d"
	)
)
goto :END
:string
goto :EOF
:number

:END