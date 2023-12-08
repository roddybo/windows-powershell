# Specify the path to your CSV file
$csvFilePath = "C:\Users\Administrator\Documents\student_name.csv"

# Import CSV file
$userData = Import-Csv -Path $csvFilePath

# Specify the domain and set up credentials
$domain = "roddybo.com"
$adminUsername = "Administrator"
$adminPassword = ConvertTo-SecureString "Alienbaby5150$" -AsPlainText -Force
$adminCreds = New-Object System.Management.Automation.PSCredential ($adminUsername, $adminPassword)

# Loop through each row in the CSV and create users
foreach ($user in $userData) {
    $firstName = $user.FirstName
    $lastName = $user.LastName
    $username = $firstName.Substring(0,1).ToLower() + $lastName.ToLower()

    # Create the user using New-ADUser
    New-ADUser -SamAccountName $username -GivenName $firstName -Surname $lastName -UserPrincipalName "$username@$domain" -Name "$firstName $lastName" -DisplayName "$firstName $lastName" -Description "User created from CSV" -Enabled $true -AccountPassword (ConvertTo-SecureString -AsPlainText "DefaultPassword" -Force) -PassThru | Set-ADUser -HomeDirectory "\\$domain\$username" -HomeDrive "H:" -City "City" -State "State" -Country "US" -PostalCode "12345" -Title "Title" -Company "Company" -Department "Department"
}
