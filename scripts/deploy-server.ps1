# The LionZ Server - Deploy Script PowerShell
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " The LionZ Server - Deploy Script" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$sourceRepo = "C:\Users\leona\OneDrive\Documentos\GitHub\DZ-The-LionZ-Server"
$serverPath = "D:\SteamLibrary\steamapps\common\DayZServer"

Write-Host "Copiando arquivos do repositorio para o servidor..." -ForegroundColor Green
Write-Host ""

try {
    Write-Host "[1/2] Copiando mpmissions..." -ForegroundColor Yellow
    Copy-Item "$sourceRepo\mpmissions\*" "$serverPath\mpmissions\" -Recurse -Force
    Write-Host "✓ mpmissions copiado com sucesso!" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "[2/2] Copiando profiles..." -ForegroundColor Yellow
    Copy-Item "$sourceRepo\profiles\*" "$serverPath\profiles\" -Recurse -Force
    Write-Host "✓ profiles copiado com sucesso!" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host " Deploy concluido com sucesso!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
}
catch {
    Write-Host "❌ Erro durante o deploy: $($_.Exception.Message)" -ForegroundColor Red
}

Read-Host "Pressione Enter para continuar"