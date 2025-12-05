@echo off
echo ========================================
echo  The LionZ Server - Deploy Script
echo ========================================
echo.

echo Copiando arquivos do repositorio para o servidor...
echo.

echo [1/2] Copiando mpmissions...
robocopy "C:\Users\leona\OneDrive\Documentos\GitHub\DZ-The-LionZ-Server\mpmissions" "D:\SteamLibrary\steamapps\common\DayZServer\mpmissions" /E /XO /R:3 /W:1

echo.
echo [2/2] Copiando profiles...
robocopy "C:\Users\leona\OneDrive\Documentos\GitHub\DZ-The-LionZ-Server\profiles" "D:\SteamLibrary\steamapps\common\DayZServer\profiles" /E /XO /R:3 /W:1

echo.
echo ========================================
echo  Deploy concluido!
echo ========================================
pause