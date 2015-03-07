@echo off
title TTU Game Launcher
set /P PPYTHON_PATH=<PPYTHON_PATH

rem Get the user input:
echo Choose your game server!
echo #1 - Localhost
echo #2 - DenialMC
echo #3 - Custom
echo #4 - Custom w/ RemoteDB
echo.
set /P INPUT=
set TTU_GAMESERVER=unset

if %INPUT%==1 set TTU_GAMESERVER=127.0.0.1
if %INPUT%==2 set TTU_GAMESERVER=5.15.21.225
if %TTU_GAMESERVER%==unset (
    echo.
    set /P TTU_GAMESERVER=Gameserver: 
)

echo.
set /P ttuUsername=Username: 

if %INPUT%==4 (
    echo.
    set /P ttuPassword=Password: 
)

set TTU_PLAYCOOKIE=%ttuUsername%

echo ===============================
echo Starting Toontown Unlimited...
echo ppython: %PPYTHON_PATH%
echo Username: %ttuUsername%
echo Password: %ttuPassword%
echo Gameserver: %TTU_GAMESERVER%
echo ===============================

if %INPUT%==4 (
    %PPYTHON_PATH% -m toontown.toonbase.ClientStartRemoteDB
) else (
    %PPYTHON_PATH% -m toontown.toonbase.ClientStart
)

pause