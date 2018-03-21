Register-EditorCommand `
    -Name 'EditorCommand.NewEditorCommandToFile' `
    -DisplayName 'New Editor Command File' `
    -SuppressOutput `
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]$context)

        $Name = ReadInputPrompt 'Please Type the Name of the Editor Command. Ex: Module.Command'
        $DisplayName = ReadInputPrompt 'Please Type the DisplayName of the Editor Command'

        $List = @('Yes', 'No')
        $Choices = [System.Management.Automation.Host.ChoiceDescription[]] @($List)
        $Selection = ReadChoicePrompt -Prompt "Do you want to Suppress Output?" -Choices $Choices
        $SuppressOutput = $List[$Selection]

        if ($SuppressOutput -eq 'Yes')
        {
            $Command = @"
Register-EditorCommand ``
    -Name "$Name" ``
    -DisplayName "$DisplayName" ``
    -SuppressOutput ``
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]`$context)

        # Enter Code Here
        
    }
"@
        }
        else
        {
            $Command = @"
Register-EditorCommand ``
    -Name "$Name" ``
    -DisplayName "$DisplayName" ``
    -ScriptBlock {
        param([Microsoft.PowerShell.EditorServices.Extensions.EditorContext]`$context)

        # Enter Code Here
        
    }
"@
        }

        $Command | Out-File -FilePath "$($psEditor.Workspace.path)\EditorCommands\$($Name).ps1"

        Open-EditorFile "$($psEditor.Workspace.path)\EditorCommands\$($Name).ps1"
        $context.SetSelection(9,9,9,9)
    }
