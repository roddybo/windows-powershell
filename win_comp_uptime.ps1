# Get the system uptime
$uptime = Get-WmiObject Win32_OperatingSystem | Select-Object LastBootUpTime

# Calculate the time the computer has been running
$uptimeDateTime = [System.Management.ManagementDateTimeConverter]::ToDateTime($uptime.LastBootUpTime)
$uptimeDuration = (Get-Date) - $uptimeDateTime

# Display the result
Write-Host "Computer has been running for: $($uptimeDuration.Days) days, $($uptimeDuration.Hours) hours, $($uptimeDuration.Minutes) minutes, $($uptimeDuration.Seconds) seconds."

