
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}
# Dracula Prompt Configuration

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Robbyrussell

Function hst {code C:\Windows\System32\drivers\etc\hosts}
Function get {kubectl get pods}
Function srv {kubectl get services}
Function dpl {kubectl get deployment}
Function aplicar {kubectl apply}
Function servicio {kubectl describe service}
Function reiniciar {kubectl rollout restart deployment}
Function listar {(ls -n) -split "`n" -join " "}
Set-Alias -Name ll -Value listar
Set-Alias -Name k -Value kubectl
Set-Alias -Name kr -Value reiniciar
Set-Alias -Name kds -Value servicio
Set-Alias -Name kgp -Value get
Set-Alias -Name kgd -Value dpl
Set-Alias -Name kgs -Value srv
Set-Alias -Name ka -Value aplicar

Set-Alias -Name hh -Value hst
#if ($host.Name -eq 'ConsoleHost')
#{
#    function ls_git { & 'C:\Program Files\Git\usr\bin\ls' --color=auto -hF $args }
#    Set-Alias -Name ls -Value ls_git -Option Private
#}

$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
$GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue
