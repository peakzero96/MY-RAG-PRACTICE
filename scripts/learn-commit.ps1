# 按commit学习的辅助脚本

param(
    [Parameter(Mandatory=$true)]
    [string]$Commit,
    [string]$ReferenceDir = "E:\code\McpRagServer\MODULAR-RAG-MCP-SERVER"
)

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  学习Commit: $Commit" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# 查看commit信息
Write-Host "📄 Commit信息:" -ForegroundColor Yellow
Set-Location $ReferenceDir
$log = git log -1 --format="%H%n%an%n%ad%n%s%n%b" $Commit
Write-Host $log
Write-Host ""

# 查看文件变更
Write-Host "📁 文件变更:" -ForegroundColor Yellow
git show $Commit --stat
Write-Host ""

# 查看具体代码变更
Write-Host "💻 代码变更:" -ForegroundColor Yellow
git show $Commit
Write-Host ""

Write-Host "✅ 现在可以在学习目录中实现对应功能了！" -ForegroundColor Green
