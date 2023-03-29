# Git aliases for PowerShell

[![license](https://img.shields.io/github/license/codyduong/powershell-git-aliases-plus.svg?style=flat-square)](./LICENSE)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/git-aliases-plus.svg?style=flat-square)](https://www.powershellgallery.com/packages/git-aliases-plus/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/git-aliases-plus.svg?style=flat-square)](https://www.powershellgallery.com/packages/git-aliases-plus/)

A fork of [ `powershell-git-aliases` ](https://github.com/gluons/powershell-git-aliases) that adds all missing aliases, see: https://github.com/gluons/powershell-git-aliases/issues/32, https://github.com/gluons/powershell-git-aliases/issues/38, ...and more.

It also adds an support for a [thefuck](https://github.com/nvbn/thefuck) rule to allow `fuck` to work on aliased commands

A [PowerShell](https://microsoft.com/powershell) module that provide partial **[Git](https://git-scm.com/)** aliases from [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)'s [git plugin](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git/).

> ℹ️ This module will replace some built-in PowerShell aliases with our Git aliases to **prevent** [conflict](https://github.com/gluons/powershell-git-aliases/issues?utf8=%E2%9C%93&q=is%3Aissue+label%3Aconflict).

## ⚙️ Installation

Install from [PowerShell Gallery](https://www.powershellgallery.com/packages/git-aliases-plus/)

```powershell
Install-Module git-aliases-plus -Scope CurrentUser -AllowClobber
```

---

⚠️ If you haven't allowed script execution policy, set your script execution policy to `RemoteSigned` or `Unrestricted` .

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 🛂 Usage

You have to import the module to use `git-aliases` .

Add below command into your PowerShell profile.

```powershell
Import-Module git-aliases-plus -DisableNameChecking
```

Then restart your PowerShell.  
Now you can use Git aliases.

## 🔧 Integrations

### [posh-git](https://github.com/dahlbyk/posh-git)

If you want to enable tab completion enable posh-git's autocompletion for aliases.
Be aware that if you do want tab completion this way, posh-git **MUST** be imported after
git-aliases-plus

```powershell
Import-Module git-aliases-plus -DisableNameChecking
Import-Module Posh-Git -arg 0,0,1
```

### [thefuck](https://github.com/nvbn/thefuck)

If you would like your aliases to still be corrected with the `fuck` command, 
copy [git-aliases.py](./integrations/thefuck/rules/git-aliases.py) from [integrations/thefuck/rules](./integrations/thefuck/)
into `$HOME/.config/thefuck/rules`.
