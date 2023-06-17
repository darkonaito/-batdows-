cls
echo -----------------------------
echo ^|Checking system file  .    ^|
echo -----------------------------
timeout /t 2 /nobreak>nul
cls
echo -----------------------------
echo ^|Checking system file  . .  ^|
echo -----------------------------
timeout /t 2 /nobreak>nul
cls
echo -----------------------------
echo ^|Checking system file  . . .^|
echo -----------------------------

::----------------------------------

set "list=root\system\list.txt"

:check1
for /f %%g in (%list%) do (
	if exist "%%g" (
		set output=Exist&set object=%%g
	) else (
		if not exist "%%g" (
			set "output=FILE_NOT_EXIST" & set object=%%g
		)
	)
	::timeout /t 0 /nobreak>nul
	call :check2
)
echo.
echo Current User = %USER%
echo.
type root\system\info.txt
color 0c
exit/B
:check2
if "%output%"=="FILE_NOT_EXIST" set ERROR=TRUE
echo %object% = %output%


