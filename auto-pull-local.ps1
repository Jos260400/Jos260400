# Auto-pull local para Jos260400
$repoPath = "C:\xampp\htdocs\Jos260400"

Write-Host "Auto-pull activo en: $repoPath" -ForegroundColor Cyan
Write-Host "Revisando cada 10 segundos... Ctrl+C para detener" -ForegroundColor Yellow

while ($true) {
    Set-Location $repoPath
    $result = git pull origin main 2>&1
    
    if ($result -notmatch "Already up to date") {
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Cambios recibidos!" -ForegroundColor Green
        Write-Host $result -ForegroundColor White
    } else {
        Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Sin cambios..." -ForegroundColor DarkGray
    }
    
    Start-Sleep -Seconds 10
}