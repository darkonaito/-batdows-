:all
 color 7f
 mode 20,10
 set "data=!Alt.Prog_D!batchmon\"
 set "saves=!data!saves\"
 start !data!controls.bat %*
 
:game
 goto :main

:main
 pause>nul
 cls
 REM call :all
 call :load
 call :new
 call :render
 call :control
 call :main

:load
 set "empty=O"
 
 goto :EOF
:new
 for /l %%i in (0,1,200) do (
	 set "box%%i=!empty!"
 )
 
 goto :EOF
:render
 echo !box0!!box1!!box2!!box3!!box4!!box5!!box6!!box7!!box8!!box9!!box10!!box11!!box12!!box13!!box14!!box15!!box16!!box17!!box18!!box19!
 for /l %%i in (1,1,9) do (
	 set/a n1=%%i
	 set/a n2=%%i+1
	 for /f "tokens=1,2" %%a in ("!n1! !n2!") do (
		 echo !box%%a0!!box%%a1!!box%%a2!!box%%a3!!box%%a4!!box%%a5!!box%%a6!!box%%a7!!box%%a8!!box%%a9!!box%%b0!!box%%b1!!box%%b2!!box%%b3!!box%%b4!!box%%b5!!box%%b6!!box%%b7!!box%%b8!!box%%b9!
	 )
 )
 goto :EOF
:control
 if exist !Alt.Temp!up (
	 del !Alt.Temp!up
	 set move=up
 )
 if exist !Alt.Temp!left (
	 del !Alt.Temp!left
	 set move=left
 )
 if exist !Alt.Temp!down (
	 del !Alt.Temp!down
	 set move=down
 )
 if exist !Alt.Temp!right (
	 del !Alt.Temp!right
	 set move=right
 )
 goto :checkmove
 goto :EOF

:checkmove
 if !move!==up set player_pose=!player_pose!-20
 if !move!==left set player_pose=!player_pose!-1
 if !move!==down set player_pose=!player_pose!+20
 if !move!==right set player_pose=!player_pose!+1