:main
title Visualizing . . . - %0
cls
dir/b root\accounts\%USER%\apps\all
echo.
echo -----------------------
echo.
set/p "ANS=Insert app's name: "
call !Acc.User!apps\all\%ANS%.bat
call !Sys.Prim!deskt.bat