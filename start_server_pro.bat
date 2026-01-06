@echo off
:start
set serverName=Meu Servidor DayZ
set serverLocation="D:\SteamLibrary\steamapps\common\DayZServer"
set serverPort=2302
set serverConfig=serverDZ.cfg
set serverProfile=profiles
set serverCPU=4
set MOD_LIST=@CF;@Dabs-Framework;@VPPAdminTools;@DayZ-Expansion-Bundle;@DayZ-Expansion-Licensed;@BaseBuildingPlus

title %serverName%
cd %serverLocation%
echo (%time%) %serverName% iniciado.

start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% -profiles=%serverProfile% -cpuCount=%serverCPU% -mod=%MOD_LIST% -doLogs -adminLog -netLog -freezeCheck -noBE

timeout 14400
taskkill /im DayZServer_x64.exe /F
timeout 10
goto start