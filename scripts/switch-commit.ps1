# 切换到指定commit进行学习

param(
    [Parameter(Mandatory=$true)]
    [string]$Commit,
    [switch]$ReturnToMaster
)

$LEARNING_DIR = "E:\code\McpRagServer\my-rag-practice"
Set-Location $LEARNING_DIR

if ($ReturnToMaster) {
    Write-Host "返回master分支..." -ForegroundColor Yellow
    git checkout master
    Write-Host "✅ 已返回最新代码" -ForegroundColor Green
} else {
    Write-Host "切换到commit: $Commit" -ForegroundColor Yellow
    git checkout -b "learn-$Commit" $Commit
    Write-Host "✅ 已切换到学习分支: learn-$Commit" -ForegroundColor Green
    Write-Host ""
    Write-Host "学习完成后运行: .\switch-commit.ps1 -Commit $Commit -ReturnToMaster" -ForegroundColor Cyan
}
