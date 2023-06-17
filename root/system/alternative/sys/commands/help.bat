for /f "tokens=2* delims=%dlms%" %%a in ("!ans!") do (
	set comm2=%%a
	if exist "!Prompt.Comm!!comm2!.bat" (
		if exist "!Alt.Help!!comm2!.txt" (
			echo.
			type !Alt.Help!!comm2!.txt
			echo.
			goto :END
		) else (
			echo Nessun aiuto disponibile per questo comando.
			goto :END
		)
	) else (
		echo Comando inesistente.
	)
)
goto :END
:n_help
echo.
type !GUIs!altComm.txt
echo.
echo.
:END

REM if exist "!Prompt.Comm!!comm!.bat" (
REM echo.
	REM type !Alt.Help!!comm2!.txt
	REM echo.			echo.
REM ) else (
	REM goto :END
REM )