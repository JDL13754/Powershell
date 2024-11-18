#Import Active Directory Module
Import-Module ActiveDirectory

#Define the current date
$currentDate = Get-Date

#Get all user accounts where the account expiration date is set and has passed
$expiredAccounts = Get-ADUser -Filter * -Property AccountExpirationDate | Where-Object {
    $_.AccountExpirationDate -and ($_.AccountExpirationDate -lt $currentDate)
}

#Display the expired accounts
if ($expiredAccounts) {
    Write-Host "Expired User Accounts:" -ForegroundColor Green
    $expiredAccounts | Select-Object Name, SamAccountName, AccountExpirationDate | Format-Table -AutoSize
} else {
    Write-Host "No expired user accounts found." -ForegroundColor Yellow
}
