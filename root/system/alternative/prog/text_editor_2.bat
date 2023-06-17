@echo off
color f0
set that_set=1
set n=0
:main
set "file_name=unnamed"
set "file_ext=txt"
set "file_path=resourc\"
set show_num=0
set num=0
set num2=1
cls
type !GUIs!txt_ed_main.txt
:cho1
choice /c nble /n
if !errorlevel!==1 goto :main2
if !errorlevel!==2 goto :batch
if !errorlevel!==3 goto :lapis
if !errorlevel!==4 goto :exit
::
:main2
set "file_name=unnamed"
set "file_ext=txt"
set "file_path=resourc\"
set show_num=0
set num=0
set num2=1
cls
type !GUIs!txt_ed_main2.txt
:cho2
choice /c noe /n
if !errorlevel!==1 goto :new
if !errorlevel!==2 goto :open
if !errorlevel!==3 goto :exit

:new
cls
echo.
:input
::set/a num2=!num!
if !that_set!==0 set /a show_num=!num2!+1
if not !that_set!==0 set num2=!num!
::title N=!n! NUM=!num! NUM1=!num1! NUM2=!num2!  - "!Alt.Temp!"file_temp!num2!
set /a show_num=!show_num!+1
set "input="
set "state=def"
set/p "input=!show_num! "
call :checks
if "!input!"=="" (
	set state=undef
) else (
	set state=def
)
if "!state!"=="def" (
	echo !input!>>"!Alt.Temp!"file_temp!n!
) else (
	echo.>>"!Alt.Temp!"file_temp!n!
)
set/a num=!num!+1
type "!Alt.Temp!"file_temp!n!>"!Alt.Temp!"file_temp!num!
::
goto :input
:open
cls
:checks
if "!input!"=="-exit" goto save_as
if "!input!"=="-undo" goto undo
if "!input!"=="-redo" goto redo
goto :EOF
:undo
set/a show_num=!show_num!-1
set that_set=0
cls
set/a num3=!num2!-1
if not !num3!==0 (
 	if exist "!Alt.Temp!"file_temp!num3! (
		set/a num2=!num2!-1
		call :type
	)
)
goto :input
:redo
set/a show_num=!show_num!+1
cls
set/a num3=!num2!+1
if not !num3!==0 (
	if exist "!Alt.Temp!"file_temp!num3! (
		set/a num2=!num2!+1
		call :type
	)
)
goto :input
:type
set n=0
::type "!Alt.Temp!"file_temp!num2!
cls
for /f %%a in (!Alt.Temp!file_temp!num2!) do (
	set /a n=!n!+1
	echo !n! %%a 
)
goto :EOF
:save_as
cls
set/p "file_name2=File name: "
echo.
set/p "file_path2=Percorso: "
echo.
set/p "file_ext2=Estensione: "

if not "!file_name2!"==";" (
	set file_name=!file_name2!
)
if not "!file_path2!"==";" (
	set file_path=!file_path2!
)
if not "!file_ext2!"==";" (
	set file_ext=!file_ext2!
)

type "!Alt.Temp!"file_temp!n!>"root\system\alternative\!file_path!"!file_name!.!file_ext!
del /q !Alt.Temp!*
call :main2
:save

:exit
call !Sys.Alt!main.bat