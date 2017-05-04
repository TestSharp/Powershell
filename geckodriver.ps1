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