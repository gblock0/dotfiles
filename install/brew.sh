#!/bin/sh
brew update

# Install BlexMono Nerd Font
brew tap homebrew/cask-fonts

# development tools
brew install neovim node git reattach-to-user-namespace\
             tmux fzf zsh antigen git-delta stow bottom\
             romkatv/powerlevel10k/powerlevel10k rust tree\
             wget ripgrep procs tldr exa htop nvm hyperfine\
             pyenv gnupg antigen
 
# Split these out because they will stop the install if they already exist
brew install alacritty
brew install font-blex-mono-nerd-font
