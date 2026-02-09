$repoPath = "C:\Users\leona\OneDrive\Documentos\GitHub\DZ-The-LionZ-Server"
$targetPath = "D:\SteamLibrary\steamapps\common\DayZServer"

Write-Host "Monitorando atualizacoes do repositorio..." -ForegroundColor Green

while ($true) {
    Set-Location $repoPath
    git fetch origin main
    
    $local = git rev-parse HEAD
    $remote = git rev-parse origin/main
    
    if ($local -ne $remote) {
        Write-Host "`nNova atualizacao detectada! Sincronizando..." -ForegroundColor Yellow
        git pull origin main
        robocopy $repoPath $targetPath /MIR /XD .git .github /XF .gitignore README.md /NFL /NDL /NJH /NJS
        Write-Host "Sincronizacao concluida!" -ForegroundColor Green
    }
    
    Start-Sleep -Seconds 60
}
