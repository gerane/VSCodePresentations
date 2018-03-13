Register-EditorCommand `
    -Name 'Demo.OpenPsm1' `
    -DisplayName 'Demo 2: Open Demo Module Psm1' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        Open-EditorFile "$PSScriptRoot\*.psm1"
    }