# Dotfiles

Welcome to my Dotfiles. This is a collection of vim, tmux, and zsh configurations.

![screenshot](https://i.imgur.com/BFrGO2W.png)

## Contents

+ [Initial Setup and Installation](#initial-setup-and-installation)
+ [Vim and Neovim Setup](#vim-and-neovim-setup)
+ [Tmux](#tmux-configuration)

## Initial Setup and Installation

First, you may want to backup any existing files that exist so this doesn't overwrite your work.

Clone the dotfiles repository and move `tunes.js` and `base16.sh` to a new folder `.dotfiles`

```bash
➜ git clone https://github.com/Yeshwanthyk/Dotfiles.git
➜ cd Dotfiles
➜ mkdir ~/.dotfiles
➜ mkdir ~/.dotfiles/applescripts && cp applescripts/tunes.js ~/.dotfiles/applescripts/
➜ mkdir ~/.dotfiles/tmux && cp tmux/base16.sh ~/.dotfiles/tmux
```

Update `.tmux.conf` with the settings in `Dotfiles`

## Vim and Neovim Setup

[Neovim](https://neovim.io/) is a fork and drop-in replacement for vim. in most cases, you would not notice a difference between the two, other than Neovim allows plugins to run asynchronously so that they do not freeze the editor, which is the main reason I have switched over to it. Vim and Neovim both use Vimscript and most plugins will work in both (all of the plugins I use do work in both Vim and Neovim). For this reason, they share the same configuration files in this setup. Neovim uses the [XDG base directory specification](http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html) which means it won't look for a `.vimrc` in your home directory. Instead, its configuration looks like the following:

|                         | Vim        | Neovim                    |
|-------------------------|------------|---------------------------|
| Main Configuration File  | `~/.vimrc` | `~/.config/nvim/init.vim` |
| Configuration directory | `~/.vim`   | `~/.config/nvim`          |

### Installation

Vim is likely already installed on your system. If using a Mac, MacVim will be installed from Homebrew. Neovim will also be installed from Homebrew by default on a Mac. For other systems, you may need to install Neovim manually. See their [web site](https://neovim.io) for more information.

vim and neovim should just work once the correct plugins are installed. To install the plugins, you will need to open Neovim in the following way:

```bash
➜ nvim +PlugInstall
```

## Tmux Configuration

Tmux is a terminal multiplexor which lets you create windows and splits in the terminal that you can attach and detach from. I use it to keep multiple projects open in separate windows and to create an IDE-like environment to work in where I can have my code open in vim/neovim and a shell open to run tests/scripts. Tmux is configured in [~/.tmux.conf](tmux/tmux.conf)
