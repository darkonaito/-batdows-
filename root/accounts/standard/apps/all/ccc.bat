@echo off


set/a s=00
set/a m=00
set/a one=1

set/a maxsm=60

:sass
cls
echo ===========
echo    =%m%==%s%=
echo ===========
set/a "s=%s%+01"


if %s% GTR %maxsm% (

set/a s=00
set/a m=%m%+%one%

)



timeout /t 1 /nobreak>nul
goto sass