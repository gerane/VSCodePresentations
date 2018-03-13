Register-EditorCommand `
    -Name 'Demo.OpenProfile' `
    -DisplayName 'Demo 5: Open Profile' `
    -SuppressOutput `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        $Current = Split-Path -Path $profile -Leaf
        $List = @($Current, 'Microsoft.VSCode_profile.ps1', 'Microsoft.PowerShell_profile.ps1', 'Microsoft.PowerShellISE_profile.ps1', 'Profile.ps1') | Select-Object -Unique
        $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @($List)
        $Selection = ReadChoicePrompt -Prompt "Pl`ease Select a Profile" -Choices $Choices
        $Name = $List[$Selection]

        $ProfileDir = Split-Path $Profile -Parent
        $ProfileName = Join-Path -Path $ProfileDir -ChildPath $Name

        If (!(Test-Path -Path $ProfileName)) { New-Item -Path $ProfileName -ItemType File }

        $psEditor.Workspace.OpenFile($ProfileName)
    }