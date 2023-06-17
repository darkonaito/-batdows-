dir /b !Alt.Auto!>!Alt.Temp!auto_exec_list
for /f %%a in (!Alt.Temp!auto_exec_list) do (
	call !Alt.Auto!%%a
)
del /q !Alt.Temp!auto_exec_list