:main
 @echo off
 cls
 color f9
 REM  Mostra il menu' principale.
 type !GUIs!txt_main.txt
 goto :cho1
 
:cho1
 choice /c nble /n
 if !errorlevel!==1 goto :normal
 if !errorlevel!==2 goto :batch
 if !errorlevel!==3 goto :lapis
 if !errorlevel!==4 goto :END

:normal
 call !Alt.Prog_D!editor\normal.bat
 goto :main

:batch
 call !Alt.Prog_D!editor\batch.bat
 goto :main

:lapis
 call !Alt.Prog_D!editor\lapis.bat
 goto :main


:END
REM Esce dal programma e reindirizza al prompt alternative.
call !Sys.Alt!main.bat