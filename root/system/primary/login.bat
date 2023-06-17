@echo off
set "title=  Welcome!"
title !title!
cls
color 0f
echo.
set "ERROR= "
:main
set "USER="
cls 
echo.
if "%ERROR%" NEQ " " echo   %ERROR% 
set "ERROR= "
echo.
echo  ----------------------
echo  -                    -
echo  -     [N]ew          -
echo  -                    -
echo  -     [L]ogin        -
echo  -                    -
echo  -     [E]xit         -
echo  -                    -
echo  -                    -
echo  -   [A]lternative    -
echo  -                    -
echo  ----------------------
echo.
echo.
choice /c NLEA /n /m " >>"
if %errorlevel%==1 goto new
if %errorlevel%==2 goto login
if %errorlevel%==3 (
	cls
	call :enter
	(
		title Bye Bye!
		echo    C i a o    c i a o   !
		echo.
		timeout /t 1 /nobreak>Nul
		color 07
		timeout /t 1 /nobreak>Nul
		color 08
		timeout /t 1 /nobreak>Nul
	)
	exit
)
if %errorlevel%==4 goto :altern
:altern
call !Sys.Alt!main.bat
goto :END
:new
title  New User
cls
echo.
set/p "USER= << Type your username: "
if "%USER%"=="" goto main
if exist "!Accs!%USER%" (
	set "ERROR=User '%USER%' Already Exist"
	goto main
)
echo.
set/p "PASS= << Type your password: "
if "%PASS%"=="" goto main
md "!Accs!"%USER%
echo %PASS%>"!Accs!%USER%\"pass
xcopy /e "!Accs!standard\"* "!Accs!%USER%\"
call "!Sys.Prim!"deskt.bat
:enter
for /l %%g in (1,1,3) do (
	echo.
)
goto :EOF
:login
title Log-In
cls
echo.
echo   ---------------------
echo.
set/p "USER=Type your username: "
if "%USER%"=="" goto main
if not exist "!Accs!%USER%" (
	set "ERROR='%USER%': Unexisting User"
	goto main
)
set/p "PASS=Type your password: "
if "%PASS%"=="" goto main
for /f %%a in (!Accs!%USER%\pass) do (
	if "%PASS%" NEQ "%%a" (
		set "ERROR=Wrong password"
		goto main
	)
)
call !Sys.Prim!deskt.bat
:END