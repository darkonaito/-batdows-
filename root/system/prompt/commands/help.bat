dir /b !Prompt.Comm!*>!Sys.Prompt!list
set "list=!Sys.Prompt!list"
set n=0
for /f "tokens=1* delims=" %%a in (!list!) do (
	if "%%~na" NEQ "This." (
		if "%%~na" NEQ "MAIN" (
			if "%%a" NEQ "help" (
				if "%%a" NEQ "list" (
					if "%%~na" NEQ "check" (
						if not "%%~xa"==".lap" (
							if not "%%~na"=="interpreter" (
								echo %%~na;
							)
						)
					)
				)
			)
		)
	)
)		