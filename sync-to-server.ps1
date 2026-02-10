Write-Host "Iniciando sincronizacao automatica..." -ForegroundColor Green

$repoPath = "C:\Users\leona\OneDrive\Documentos\GitHub\DZ-The-LionZ-Server"
$serverPath = "D:\SteamLibrary\steamapps\common\DayZServer"

robocopy $repoPath $serverPath *.txt *.bat *.cfg *.xml /R:0 /W:0

Write-Host "`nSincronizacao concluida!" -ForegroundColor Green
Write-Host "Arquivos copiados para: $serverPath" -ForegroundColor Cyan
