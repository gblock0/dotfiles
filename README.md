# Welcome to my Dotfiles!

testing

## What's in this repo?

- [alacritty] configuration
- [neovim] configuration
- [tmux] configuration
- [zsh] configuartion w/ [powerlevel10k]
- git configuration
- `install.sh`
  1. downloads/updates any submodules
  1. installs homebrew
  1. downloads my default homebrew packages ([`install/brew.sh`])
     - including BlexMono Nerd Font
  1. installs latest stable node
  1. downloads the [tmux plugin manager]
  1. if running on OS X, it will update some settings ([`install/osx.sh`])
  1. switch the default shell to `zsh`

## Install

1. `git clone https://github.com/gblock0/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `./install.sh`
1. Download [`packer.nvim`]

   
   `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`

1. Run `:PackerInstall` in Neovim
1. Change keyboard modifier keys to make `Caps Lock` be `Ctrl`

## TODO

- Migrate the rest of the nvim config to lua

[alacritty]: https://github.com/alacritty/alacritty
[neovim]: https://neovim.io
[tmux]: https://github.com/tmux/tmux
[zsh]: https://www.zsh.org/
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[`install/brew.sh`]: https://github.com/gblock0/dotfiles/blob/master/install/brew.sh
[vim-plug]: https://github.com/junegunn/vim-plug
[tmux plugin manager]: https://github.com/tmux-plugins/tpm
[`install/osx.sh`]: https://github.com/gblock0/dotfiles/blob/master/install/osx.sh
[`packer.nvim`]: https://github.com/wbthomason/packer.nvim
