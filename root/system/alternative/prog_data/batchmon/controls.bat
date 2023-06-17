@echo off
setlocal enabledelayedexpansion
mode 10,5
:main
 cls
 echo !Alt.Prog_D!
 choice /c wasd /n
 if "!errorlevel!"=="1" echo.>!Alt.Temp!up
 if "!errorlevel!"=="2" echo.>!Alt.Temp!left
 if "!errorlevel!"=="3" echo.>!Alt.Temp!down
 if "!errorlevel!"=="4" echo.>!Alt.Temp!right
 goto :main