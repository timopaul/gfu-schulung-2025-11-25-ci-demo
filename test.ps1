Write-Output "Running generic tests..."
if (Test-Path -Path "src") {
  $files = Get-ChildItem -Path "src" -File
  if ($files.Count -gt 0) {
    Write-Output "Found source files:"
    $files | ForEach-Object { Write-Output $_.Name }
    Write-Output "OK"
    exit 0
  } else {
    Write-Output "No files in src - FAIL"
    exit 1
  }
} else {
  Write-Output "src folder not found - FAIL"
  exit 1
}
