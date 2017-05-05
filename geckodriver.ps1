# Displayed by T#
# 05.04.2017 - Janos Szenfner
# Version 1.0

# PowerShell Kill Process
Clear-Host
# get Geckodriver process
$process = Get-Process geckodriver -ErrorAction SilentlyContinue
if ($process) {
  # try gracefully first
  $process.CloseMainWindow()
  # kill after five seconds
  Start-Sleep [-Seconds] 3
  if (!$process.HasExited) {
    $process | Stop-Process -Force
  }
}
Remove-Variable process