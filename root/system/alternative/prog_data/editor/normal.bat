:main
 set "space=   "
 cls 
 type !GUIs!txt_main2.txt

:cho1
 choice /c noe /n
 if !errorlevel!==1 goto :new
 if !errorlevel!==2 goto :open
 if !errorlevel!==3 exit/b
 
:new
 (
  set "file_name=untitled"
  set "file_path=!Alt.Res!"
  set nline=1
  set "string="
  set "file_ext=.txt"
 )
 (
  cls
  echo.
  set/p "file_name=File name: "
  echo.
  set/p "file_path=File path: "
  echo.
  set/p "file_ext=File extension: "
 )
 cls
 goto :write
 
:open
 (
  cls
  set "file_name=untitled"
  set "file_path=!Alt.Res!"
  set nline=1
  set "file_ext=.txt"
 )
 (
  cls
  echo.
  set/p "file_name=File name: "
  echo.
  set/p "file_path=File path: "
  echo.
  set/p "file_ext=File extension: "
 )
 cls
 type !file_path!!file_name!!file_ext!
 echo.
 pause>nul
 goto :main


:write
 set "string="
 set/p "string=!nline! "
 set/a nline=!nline!+1
 if "!string!"=="-exit" (
	goto :main
 ) else (
	 if "!string!"=="-opts" (
		goto :opts
	 ) else (
		 if "!string!"=="" (
			 echo.>>!file_path!!file_name!!file_ext!
		 ) else (
			 echo !string!>>!file_path!!file_name!!file_ext!
		 )
	 )
 )
 goto :write


:END
 goto :main