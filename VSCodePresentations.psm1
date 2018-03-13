if ($psEditor)
{
    Get-ChildItem $PSScriptRoot\EditorCommands\*.ps1 | Sort-Object -Property name | ForEach-Object { . $_.FullName }
}