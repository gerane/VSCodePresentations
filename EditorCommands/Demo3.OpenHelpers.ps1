Register-EditorCommand `
    -Name 'Demo.OpenHelpers' `
    -DisplayName 'Demo 3: Open Helpers Script' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        Open-EditorFile "$PSScriptRoot\EditorCommands\Helpers.ps1"
    }