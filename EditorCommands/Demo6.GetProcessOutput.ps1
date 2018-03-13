Register-EditorCommand `
    -Name 'Demo.GetProcessOutput' `
    -DisplayName 'Demo 6: Get-Process Output to Console' `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        Get-Process Code*
    }