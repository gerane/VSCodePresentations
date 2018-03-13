Register-EditorCommand `
    -Name 'Demo.OpenPowerPoint' `
    -DisplayName 'Demo 1: Open PowerPoint' `
    -SuppressOutput `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        $Pptx = Get-ChildItem -Path $PSScriptRoot\..\*.pptx
        Invoke-Item -Path $Pptx
    }