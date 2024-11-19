#Import Active Directory Module
Import-Module ActiveDirectory

#Define The Username And Action
$username = "john doe" #Replace with the target username (sAMAccountName)
$action = "Disable" #Change to "Enable" if desired

#Find the User in Active Directory
$user = Get-ADUser -Identity $username -ErrorAction SilentlyContinue

if (-Not $user) {
    Write-Host "User $username not found in Active Directory." -ForegroundColor Red
    return
}

#Perform the specified action
if ($action -eq "Disable") {
    Disable-ADAccount -Identity $username
    Write-Host "User account $username has been disabled." -ForegroundColor Yellow
} elseif ($action -eq "Enable") {
    Enable-ADAccount -Identity $username
    Write-Host "User account $username has been enabled." -ForegroundColor Green
} else {
    Write-Host "Invalid action. Please specify 'Enable' or 'Disable'." -ForegroundColor Red
}
