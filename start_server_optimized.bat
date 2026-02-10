@echo off
:start
set serverName=The LionZ Server
set serverLocation="D:\SteamLibrary\steamapps\common\DayZServer"
set serverPort=2302
set serverConfig=serverDZ.cfg
set serverProfile=profiles
set serverCPU=4
set MOD_LIST=@CF;@Dabs-Framework;@VPPAdminTools;@DayZ-Expansion-Licensed;@DayZ-Expansion-Bundle

title %serverName%
cd %serverLocation%
echo (%time%) %serverName% iniciado.

REM Parametros otimizados para estabilidade
echo (%time%) Iniciando servidor DayZ...
start "DayZ Server" /high "DayZServer_x64.exe" -config=%serverConfig% -port=%serverPort% -profiles=%serverProfile% -cpuCount=%serverCPU% -mod=%MOD_LIST% -doLogs -adminLog -netLog -freezeCheck -noBE -noFilePatching -limitFPS=200 -maxMem=4096

REM Reinicio a cada 6 horas (21600 segundos) ao inves de 4
timeout 21600
echo (%time%) Reiniciando servidor...
taskkill /im DayZServer_x64.exe /F
timeout 30
goto start
