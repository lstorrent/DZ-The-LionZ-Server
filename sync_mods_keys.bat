@echo off
echo Sincronizando chaves dos mods...

:: Limpar pasta keys existente
del /Q "keys\*.bikey" 2>nul

:: Copiar chaves dos mods
echo Copiando chaves do CF...
copy "@CF\keys\*.bikey" "keys\" 2>nul

echo Copiando chaves do Dabs-Framework...
copy "@Dabs-Framework\keys\*.bikey" "keys\" 2>nul

echo Copiando chaves do DayZ-Expansion-Licensed...
copy "@DayZ-Expansion-Licensed\keys\*.bikey" "keys\" 2>nul

echo Copiando chaves do DayZ-Expansion-Bundle...
copy "@DayZ-Expansion-Bundle\keys\*.bikey" "keys\" 2>nul

echo.
echo Chaves sincronizadas com sucesso!
echo.
dir "keys\*.bikey"
pause