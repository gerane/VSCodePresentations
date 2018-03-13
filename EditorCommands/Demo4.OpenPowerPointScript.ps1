Register-EditorCommand `
    -Name 'Demo.OpenPowerPointScript' `
    -DisplayName 'Demo 4: Open PowerPoint Script' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        Open-EditorFile "$PSScriptRoot\Demo1.OpenPowerPoint.ps1"
    }