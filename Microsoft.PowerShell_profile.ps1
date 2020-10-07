# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
  "Command"   = [ConsoleColor]::Green
  "Parameter" = [ConsoleColor]::Gray
  "Operator"  = [ConsoleColor]::Magenta
  "Variable"  = [ConsoleColor]::White
  "String"    = [ConsoleColor]::Yellow
  "Number"    = [ConsoleColor]::Blue
  "Type"      = [ConsoleColor]::Cyan
  "Comment"   = [ConsoleColor]::DarkCyan
}


# Dracula Prompt Configuration
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Emodipt
Set-Alias k kubectl

# Kubernetes Aliases
function global:Select-KubeContext {
  [CmdletBinding()]
  [Alias('kubectx')]
  param (
    [parameter(Mandatory = $False, Position = 0, ValueFromRemainingArguments = $True)]
    [Object[]] $Arguments
  )
  begin {
    if ($Arguments.Length -gt 0) {
      $ctx = & kubectl config get-contexts -o=name | fzf -q @Arguments
    }
    else {
      $ctx = & kubectl config get-contexts -o=name | fzf
    }
  }
  process {
    if ($ctx -ne '') {
      & kubectl config use-context $ctx
    }
  }
}

function global:Select-KubeNamespace {
  [CmdletBinding()]
  [Alias('kubens')]
  param (
    [parameter(Mandatory = $False, Position = 0, ValueFromRemainingArguments = $True)]
    [Object[]] $Arguments
  )
  begin {
    if ($Arguments.Length -gt 0) {
      $ns = & kubectl get namespace -o=name | fzf -q @Arguments
    }
    else {
      $ns = & kubectl get namespace -o=name | fzf
    }
  }
  process {
    if ($ns -ne '') {
      $ns = $ns -replace '^namespace/'
      & kubectl config set-context --current --namespace=$ns
    }
  }
}
