# Displayed by T#
# 05.05.2017 - Janos Szenfner
# Version 1.0

#Clean out the Display
Clear-Host

#Get Information about the disks
Get-WmiObject Win32_logicaldisk | Format-Table DeviceID, `
@{Name="Size(GB)";Expression={[decimal]("{0:N3}" -f($_.size/1gb))}}, `
@{Name="Free Space(GB)";Expression={[decimal]("{0:N3}" -f($_.freespace/1gb))}}, `
@{Name="Free (%)";Expression={"{0,6:P0}" -f(($_.freespace/1gb) / ($_.size/1gb))}} `
-AutoSize