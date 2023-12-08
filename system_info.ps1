# Get system information using PowerShell

# Prompt user for input
$computerName = Read-Host -Prompt "Enter the computer name (press Enter for local machine):"

# Check if the user provided a computer name
if ($computerName -eq "") {
    $computerName = $env:COMPUTERNAME  # Use local machine if no input provided
}

# Get system information
$systemInfo = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $computerName

# Display system information
Write-Host "System Information for $computerName"
Write-Host "-----------------------------------"
Write-Host "Manufacturer: $($systemInfo.Manufacturer)"
Write-Host "Model: $($systemInfo.Model)"
Write-Host "Total Physical Memory: $([math]::Round($systemInfo.TotalPhysicalMemory / 1GB, 2)) GB"
Write-Host "Number of Processors: $($systemInfo.NumberOfProcessors)"
Write-Host "System Type: $($systemInfo.SystemType)"

