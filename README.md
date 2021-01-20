# Welcome to my Dotfiles!

## What's in this repo?
- [Alacritty](https://github.com/alacritty/alacritty) configuration
- git configuration
- `install.sh`
    1. downloads/updates any submodules
    1. installs homebrew
    1. downloads my default homebrew packages ([`install\brew.sh`](https://github.com/gblock0/dotfiles/blob/master/install/brew.sh))
    1. installs latest stable node
    1. downloads [vim-plug](https://github.com/junegunn/vim-plug)
    1. downloads the [tmux plugin manager](https://github.com/tmux-plugins/tpm)
    1. if running on OS X, it will update some settings ([`install\osx.sh`](https://github.com/gblock0/dotfiles/blob/master/install/osx.sh))
    1. switch the default shell to `fish`
    1. opens neovim and runs `PlugInstall`
- (neo)vim configuration
- [tmux](https://github.com/tmux/tmux/wiki) configuration
- [Fish](https://fishshell.com/) configuration
    - [Tide](https://github.com/IlanCosman/tide) must be installed separately
    - [Dracula Theme](https://draculatheme.com/fish) must be installed separately

## Install

1. `git clone https://github.com/gblock0/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `./install.sh`
1. Download a [Nerd Font](https://www.nerdfonts.com/) (I'm deciding between SauceCodePro and BlexMono)
1. Change terminal font to downloaded Nerd Font **NOTE: If you're using [Alacritty](https://github.com/alacritty/alacritty) you can skip this step**
1. Change keyboard modifier keys to make `Caps Lock` be `Ctrl`
