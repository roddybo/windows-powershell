# Install the Active Directory Domain Services feature
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Promote the server to a domain controller
$adminCreds = Get-Credential -Message "Enter domain administrator credentials"
Install-ADDSForest -DomainName "roddybo.net" -DomainNetBiosName "RODDYBO" -ForestMode Win2012R2 -DomainMode Win2012R2 -InstallDns -Credential $adminCreds

# Configure DNS settings for the domain controller
$dnsSettings = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -ne $null }
$dnsSettings.SetDynamicDNSRegistration("FALSE")
$dnsSettings.SetDNSServerSearchOrder("127.0.0.1")

# Restart the server to apply changes
Restart-Computer -Force

