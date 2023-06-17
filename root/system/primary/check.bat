title Checking Files . . .
cls
set "list=!Sys.Prim!list.txt"
set color=0a
:main
for /f %%g in (%list%) do (
	if exist "%%g" (
		color %color% & set output=OK&set "object=%%g"
	) else (
		if not exist "%%g" (
			color %color% & set "output=WRONG" & set "object=%%g"
		)
	)
	::timeout /t 0 /nobreak>nul
	call :eco
)
goto :end
:eco
if "%output%"=="WRONG" set ERROR=TRUE
if "%ERROR%"=="TRUE" set "color=0c"
color %color%
echo %object% = %output%
goto :EOF




:end
if "%ERROR%"=="TRUE" exit /b 90
exit /b