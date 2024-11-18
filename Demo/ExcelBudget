#Import the ImportExcel module
Import-Module ImportExcel

#Define the file path for the budget Excel sheet
$excelFilePath = "$PSScriptRoot\Budget.xlsx"

#Define budget categories and data
$data = $(
    @{ Category = "Housing"; Estimated = 1500; Actual = 1400; Difference = 100}
    @{ Category = "Transportation"; Estimated = 300; Actual = 320; Difference = -20}
    @{ Category = "Food"; Estimated = 500; Actual = 450; Difference = 50}
    @{ Category = "Utilities"; Estimated = 200; Actual = 190; Difference = 10}
    @{ Category = "Entertainment"; Estimated = 100; Actual = 120; Difference = -20}
    @{ Category = "Savings"; Estimated = 500; Actual = 500; Difference = 0}
)

#Convert data to export to Excel
$budgetTable = $data | ForEach-Object {
    [PSCustomObject]@{
        "Category" = $_.Category
        "Estimated" = $_.Estimated
        "Actual" = $_.Actual
        "Difference" = $_.Difference
    }
}

#Export data to Excel
$budgetTable | Export-Excel -Path $excelFilePath -WorksheetName "Budget" -AutoSize -Title "Monthly Budget" -TitleBold -FreezeTopRow

#Open the file
Start-Process $excelFilePath