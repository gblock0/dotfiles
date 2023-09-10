#!/bin/sh
brew update

# Install BlexMono Nerd Font
brew tap homebrew/cask-fonts

# Tap for terraform
brew tap hashicorp/tap

# Install terraform and its languageserver
brew install hashicorp/tap/terraform hashicorp/tap/terraform-ls

# development tools
brew install neovim node git reattach-to-user-namespace\
             tmux fzf zsh antigen git-delta stow bottom\
             romkatv/powerlevel10k/powerlevel10k rust tree\
             wget ripgrep procs tldr eza htop nvm hyperfine\
             gnupg cmake yarn rtx bat

# Need this for nvm
mkdir ~/.nvm
 
# Split these out because they will stop the install if they already exist
brew install alacritty
brew install font-blex-mono-nerd-font
