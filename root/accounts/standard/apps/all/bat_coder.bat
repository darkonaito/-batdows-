@echo off
color 17
set "EL_CASE=) else ("
set "C_PAR=)"
set "path=testi"
echo %EL_CASE%>elc & echo %C_PAR%>cpa
attrib +h elc & attrib +h cpa
:start
set "ex="
color 17
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDEL
cls
echo =======================================================
set/p name=Nome file Batch : 
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDELISI
if "%name%"=="END" (
goto END
) else (
if "%name%"=="ERROR" (
goto ERR
)
)
echo -------------------------------------------------------
set/p ex=Estensione file []: 
if "%ex%" == "" (
set ex=bat
) else (
if "%ex%"=="END" (
goto END
) else (
if exist %name%.%ex% (
goto SECall
)
)
)

if exist %name%.%ex% goto SECall
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDEL
echo -------------------------------------------------------
set/p fc=
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDEL
if "%fc%"=="END" (
goto END
) else (
if "%fc%"=="DELE" (
del %path%\%name%.%ex%
goto start
) else (
if "%fc%"=="CPAR" (
type cpa>>%path%\%name%.%ex%
) else (
if "%fc%"=="ELSE" (
type elc>>%path%\%name%.%ex%
) else (
if "%fc%"=="EDI" (
goto :ec
) else (
if "%fc%"=="REN" (
goto rena
) else (
if "%fc%"=="EX" (
goto ex
) else (
if "%fc%"=="RUN" (
start %path%\%name%.%ex%
goto :start
) else (
if "%fc%"=="TYPE" (
goto TYP
) else (
echo %fc%>%name%.%ex%
)
)
)
)
)
)
)
)
)

:ec
color 17
set/p ec=
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDEL
if "%ec%"=="END" (
goto END
) else (
if "%ec%"=="DELE" (
del %path%\%name%.bat
goto start
) else (
if "%ec%"=="CPAR" (
type cpa>>%path%\%name%.%ex%
goto :ec
) else (
if "%ec%"=="ELSE" (
type elc>>%path%\%name%.%ex%
goto :ec
) else (
if "%ec%"=="BACK" (
goto start
) else (
echo %ec%>>%path%\%name%.%ex%
goto :ec
)
)
)
)
)


:rena
color 1e
cls
echo =======================================================
set/p name2=Nuovo nome file Batch [nome attuale: %name%]: 
echo -------------------------------------------------------
echo [nome precedente: %name%... nome nuovo: %name2%]
ren %path%\%name%.%ex% %name2%.%ex%
set name=%name2%
goto start

:ex
color 12
cls
echo =======================================================
set/p ex=Attuale estensione file [""="bat"]:
echo -------------------------------------------------------
set/p ex2=Nuova estensione file []: 
echo []
if '%ex%' == '' (
set ex=bat
)
ren %path%\%name%.%ex% %name%.%ex2%
set ex=%ex2%
goto start

:TYP
cls
echo =======================================================
type %path%\%name%.%ex%
echo =======================================================
pause>nul
goto start

:ERR
title   ERROR  }{ File : %name% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDELISI
color ce
echo.
echo -------------------------------------------------------
echo --------------------- E R R O R ! ---------------------
echo -------------------------------------------------------
echo.
echo Qualcosa e' andato storto e il programma e' stato 
echo bloccato.
echo.
pause>nul
exit



:SECall
color 18
echo -------------------------------------------------------
set/p fc=
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDEL
if "%fc%"=="END" (
goto END
) else (
if "%fc%"=="DELE" (
del %path%\%name%.%ex%
goto start
) else (
if "%fc%"=="CPAR" (
type cpa>>%path%\%name%.%ex%
) else (
if "%fc%"=="ELSE" (
type elc>>%path%\%name%.%ex%
) else (
if "%fc%"=="REN" (
goto rena
) else (
if "%fc%"=="EX" (
goto ex
) else (
if "%fc%"=="RUN" (
start %path%\%name%.%ex%
goto :start
) else (
if "%fc%"=="TYPE" (
goto TYP
) else (
echo %fc%>>%path%\%name%.%ex%
)
)
)
)
)
)
)
)

:ec2
color 18
set/p ec=
title  File : %name% }{ Ex : %ex% }{ First String : %fc% }{ Current String : %ec% }{ EDitore di tEsto per MoltepLIci uSI - EDEL
if "%ec%"=="END" (
goto END
) else (
if "%ec%"=="DELE" (
del %path%\%name%.%ex%
goto start
) else (
if "%ec%"=="CPAR" (
type cpa>>%path%\%name%.%ex%
goto :ec
) else (
if "%ec%"=="ELSE" (
type elc>>%path%\%name%.%ex%
goto :ec
) else (
if "%ec%"=="BACK" (
goto start
) else (
echo %ec%>>%path%\%name%.%ex%
goto :ec
)
)
)
)
)

:END
color 07
exit /b 




