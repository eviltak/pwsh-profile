oh-my-posh init pwsh --config "$PSScriptRoot/theme.omp.yaml" | Invoke-Expression

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord 'UpArrow' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord 'DownArrow' -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete

Import-Module git-completion