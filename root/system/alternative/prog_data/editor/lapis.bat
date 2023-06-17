:main
 set "space=   "
 cls 
 type !GUIs!txt_main3.txt

:cho1
 choice /c ne /n
 if !errorlevel!==1 goto :new
 if !errorlevel!==2 exit/b
 
:new
 (
  set "file_name=untitled"
  set "file_path=!Alt.Res!"
  set nline=1
  set "string="
 )
 (
  cls
  echo.
  set/p "file_name=File name: "
  echo.
  set/p "file_path=File path: "
  echo.
 )
 cls
 goto :write
 
:compile
 
 
:write
 set "string="
 set/p "string=!nline! "
 set/a nline=!nline!+1
 if "!string!"=="-exit" (
	goto :save_exit
 ) else (
	 if "!string!"=="-opts" (
	 ) else (
		 if "!string!"=="" (
		goto :opts
			 echo.>>!file_path!!file_name!.lap
		 ) else (
			if "!string!"=="-comp" (
				 goto :compile
			 ) else (
				 echo !string!>>!file_path!!file_name!.lap
			 )
		 )
	 )
 )
 goto :write


:END
 goto :main