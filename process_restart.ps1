#
#
# pName = Process Name
# rProcess = Running Process check

Param(
  [string]$pName
  )

$rProcess = Get-Process $pName -ErrorAction SilentlyContinue
$Execute = start-process $pName

if ($rProcess -ne $null) {      # evaluating if the program is running
    Write-Host "Process is running"
    Get-Process $pName | Select-Object Name,fileversion,productversion,company
}
else {
    $Execute
}