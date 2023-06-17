title calculator
cls
color 0a

:lab1
set/p "ANS=Inserire roba: "
if "%ANS%"=="quit" goto end
if "%ANS%"=="exit" goto end
set/a RESULT=%ANS%
echo %RESULT% & GOTO lab1
:end
::exit /B