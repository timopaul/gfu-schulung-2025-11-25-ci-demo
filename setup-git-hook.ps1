# PowerShell Script to Install Git Hooks
# Run this script to activate the pre-commit hook

Write-Host "🔧 Starting Git Hook setup..." -ForegroundColor Cyan

# Check if we are in a Git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: This is not a Git repository!" -ForegroundColor Red
    Write-Host "   Run 'git init' first." -ForegroundColor Yellow
    exit 1
}

# Create .git/hooks directory if it doesn't exist
$hooksDir = ".git/hooks"
if (-not (Test-Path $hooksDir)) {
    New-Item -ItemType Directory -Path $hooksDir | Out-Null
    Write-Host "✅ Created hooks directory" -ForegroundColor Green
}

# Copy the pre-commit hook
$sourceHook = ".githooks/pre-commit"
$targetHook = "$hooksDir/pre-commit"

if (-not (Test-Path $sourceHook)) {
    Write-Host "❌ Error: File '$sourceHook' not found!" -ForegroundColor Red
    Write-Host "   Make sure you're in the project root directory." -ForegroundColor Yellow
    exit 1
}

Copy-Item $sourceHook $targetHook -Force
Write-Host "✅ Pre-commit hook copied to $targetHook" -ForegroundColor Green

# Make the script executable on Linux/Mac
if ($IsLinux -or $IsMacOS) {
    chmod +x $targetHook
    Write-Host "✅ Hook made executable" -ForegroundColor Green
}

Write-Host ""
Write-Host "🎉 Git hook successfully installed!" -ForegroundColor Green
Write-Host ""
Write-Host "The pre-commit hook will now run on every 'git commit' and:" -ForegroundColor Cyan
Write-Host "  • Warn about TODO comments" -ForegroundColor White
Write-Host "  • Prevent committing files larger than 1MB" -ForegroundColor White
Write-Host ""
Write-Host "Test the hook with:" -ForegroundColor Yellow
Write-Host "  echo '# TODO: Test' > test-file.txt" -ForegroundColor White
Write-Host "  git add test-file.txt" -ForegroundColor White
Write-Host "  git commit -m 'Test commit'" -ForegroundColor White
Write-Host ""
Write-Host "To bypass the hook, use: git commit --no-verify" -ForegroundColor Gray
