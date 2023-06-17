del /q !Alt.Temp!*
if !errorlevel! EQU 0 echo File eliminati con successo.
if !errorlevel! GEQ 1 echo Errore nella rimozione dei file.