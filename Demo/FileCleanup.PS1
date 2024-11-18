#path to folder to clean ip
$folderPath = "C:\Temp"

#files older than this will be deleted
$daysold = 30

#check if the folder exists
if (-Not (Test-Path -Path $folderPath)) {
    Write-Host "The folder $folderPath does not exist." -ForegroundColor Red
}

#Get the current Date
$currentDate = Get-Date

#Find files older than specified days
Write-Host "Looking for files in $folderPath older than $daysold days..." -ForegroundColor Yellow
$oldfiles = Get-ChildItem -Path $folderPath -File | Where-Object {
    ($currentDate - $_.LastWriteTime).Days -gt $daysold
}

#Confirm and delete files
if ($oldfiles.Count -eq 0) {
    Write-Host "No files older than $daysold days found in $folderPath." -ForegroundColor Green
} else {
    Write-Host "$($oldfiles.Count) files found. Deleting them..." -ForegroundColor Cyan
    $oldfiles | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
        Write-Host "Deleted: $($_.FullName)" -ForegroundColor Gray
    }
    Write-Host "Cleanup Complete!" -ForegroundColor Green
}