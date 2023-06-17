:main
cls
set/p "ans= File da leggere: "
echo.
::
if "!ans!"=="quit" (
	exit/b
)
if exist "!Alt.Res!!ans!" (
	type "!Alt.Res!"!ans!
	echo.
	echo.
	pause>nul
) else (
	goto main
)

::
goto :main