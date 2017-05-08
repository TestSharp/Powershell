# Displayed by T#
# 05.08.2017 - Janos Szenfner
# pName = Process Name
# rProcess = Running Process check

Param(
  [string]$pName
     )

Write-Host "Created by T#" -ForegroundColor Green
Write-Host "Use the pName parameter for the searchable process"
Write-Host "Example: .\process_restart.ps1 -pName xy"

try {
    $rProcess = Get-Process $pName -ErrorAction SilentlyContinue
}
catch {
    Write-Host "Error: Wrong parameter" -ForegroundColor Yellow
}

try {
    $Execute = start-process $pName -ErrorAction SilentlyContinue
}
catch {
    Write-Host "Error: Missing Parameter, unable to start the process" -ForegroundColor Yellow
}


if ($rProcess -ne $null) {      # evaluating if the program is running
    Write-Host "Process is running"
    Get-Process $pName | Select-Object Name,fileversion,productversion,company
}
else {
    $Execute
}