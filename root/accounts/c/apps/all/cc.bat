@echo off
setlocal enabledelayedexpansion
set n=0
:startu
cls
set sas=!sas!+

timeout -t 0 /nobreak>nul
goto startu