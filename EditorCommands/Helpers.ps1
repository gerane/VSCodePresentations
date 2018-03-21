## Editor Commands
using namespace Microsoft.PowerShell.EditorServices.Protocol.MessageProtocol
using namespace Microsoft.PowerShell.EditorServices.Protocol.Messages
using namespace Microsoft.PowerShell.EditorServices


function ReadInputPrompt
{
    param([string]$Prompt)
    end
    {
        $result = $psEditor.Components.Get([IMessageSender]).SendRequest([ShowInputPromptRequest]::Type,[ShowInputPromptRequest]@{
            Name  = $Prompt
            Label = $Prompt
        },$true).Result

        if (-not $result.PromptCanceled)
        {
            $result.ResponseText
        }
    }
}
function ReadChoicePrompt
{
    param([string]$Prompt, [System.Management.Automation.Host.ChoiceDescription[]]$Choices)
    end
    {
        $choiceIndex = 0
        $convertedChoices = $Choices.ForEach{
            $newLabel = '{0} - {1}' -f ($choiceIndex + 1), $_.Label
            [ChoiceDetails]::new($newLabel, $_.HelpMessage)
            $choiceIndex++
        } -as [ChoiceDetails[]]

        $result = $psEditor.Components.Get([IMessageSender]).SendRequest([ShowChoicePromptRequest]::Type,[ShowChoicePromptRequest]@{
                Caption        = $Prompt
                Message        = $Prompt
                Choices        = $convertedChoices
                DefaultChoices = 0
            },$true).Result

        if (-not $result.PromptCanceled)
        {
            $result.ResponseText | Select-String '^(\d+) - ' | ForEach-Object { $_.Matches.Groups[1].Value - 1 }
        }
    }
}

function AddIndent {
    [OutputType([string])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]] $Source,
        [string] $Indent = ' ',
        [int] $Amount = 4,
        [switch] $ExcludeFirstLine
    )
    begin {
        $stringList = [System.Collections.Generic.List[string]]::new()
    }
    process {
        if ($null -eq $Source) {
            return
        }

        $stringList.AddRange($Source)
    }
    end {
        $sourceText = $stringList -join [Environment]::NewLine
        if ($Amount -lt 1) {
            return $sourceText
        }

        $indentText = $Indent * $Amount
        # Preserve new line characters. Only works if not sent a stream.
        $newLine    = [regex]::Match($sourceText, '\r?\n').Value
        $asLines    = $sourceText -split '\r?\n'
        $first      = $true
        $indentedLines = foreach ($line in $asLines) {
            if ($first) {
                $first = $false
                if ($ExcludeFirstLine.IsPresent) {
                    $line
                    continue
                }
            }

            # Don't indent blank lines or here-string ending tags
            $shouldNotIndent = [string]::IsNullOrWhiteSpace($line) -or
                               $line.StartsWith("'@") -or
                               $line.StartsWith('"@')
            if ($shouldNotIndent) {
                $line
                continue
            }

            $indentText + $line
        }

        return $indentedLines -join $newLine
    }
}