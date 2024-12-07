> [!IMPORTANT]
> This is a fork of [`gluons/powershell-git-aliases`](https://github.com/gluons/powershell-git-aliases), which lacked regular maintenance. 
>
> It also tries to be closer to functionality/behavior as the oh-my-zsh git plugin.
>
> But it has received some updates<sup>[1](#upstream)</sup> which were merged into this fork.

# Git aliases for PowerShell

[![license](https://img.shields.io/github/license/codyduong/powershell-git-aliases-plus.svg?style=flat-square)](./LICENSE)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/git-aliases-plus.svg?style=flat-square)](https://www.powershellgallery.com/packages/git-aliases-plus/)
[![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/git-aliases-plus.svg?style=flat-square)](https://www.powershellgallery.com/packages/git-aliases-plus/)

A [PowerShell](https://microsoft.com/powershell) module that provide partial **[Git](https://git-scm.com/)** aliases from [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)'s [git plugin](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git/).

> ℹ️ This module will replace some built-in PowerShell aliases with our Git aliases to **prevent** [conflict](https://github.com/gluons/powershell-git-aliases/issues?utf8=%E2%9C%93&q=is%3Aissue+label%3Aconflict).

__<a name="upstream">1</a>__: Merged [`007452c^..466070f`](https://github.com/gluons/powershell-git-aliases/commits/master/) in [`4adf9d8`](https://github.com/codyduong/powershell-git-aliases-plus/commit/4adf9d873fcb206429501448f3b026e149b8a753)

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

You have to import the module to use `git-aliases-plus` .

Add below command into your PowerShell profile.

```powershell
Import-Module git-aliases-plus -DisableNameChecking
```

Then restart your PowerShell.  
Now you can use Git aliases.

## 🔧 Integrations

### posh-git

Supports autocompletion within [posh-git](https://github.com/dahlbyk/posh-git)

If you want to enable tab completion enable posh-git's autocompletion for aliases.
Be aware that if you do want tab completion this way, posh-git **MUST** be imported after
git-aliases-plus

```powershell
Import-Module git-aliases-plus -DisableNameChecking
Import-Module Posh-Git -arg 0,0,1
```

### thefuck

This repository provides a custom [thefuck](https://github.com/nvbn/thefuck) rule which can be used to allow `fuck`
to work with some aliased commands.

Copy [git-aliases.py](./integrations/thefuck/rules/git-aliases.py) from [integrations/thefuck/rules](./integrations/thefuck/)
into `$HOME/.config/thefuck/rules`.
