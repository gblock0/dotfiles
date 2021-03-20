#!/bin/sh
brew update

# Install BlexMono Nerd Font
brew tap homebrew/cask-fonts
brew install font-blex-mono-nerd-font

# cli tools
brew install tree wget ripgrep procs tldr exa

# development tools
brew install node git reattach-to-user-namespace tmux fzf zsh antigen git-delta stow
brew install romkatv/powerlevel10k/powerlevel10k

# Need luajit for neovim
brew install --build-from-source --HEAD luajit
brew install --build-from-source --HEAD neovim
brew cask install alacritty
