#!/bin/sh
brew update

# Install BlexMono Nerd Font
brew tap homebrew/cask-fonts
brew install font-blex-mono-nerd-font

# cli tools
brew install tree wget ripgrep procs tldr exa

# development tools
brew install neovim node git reattach-to-user-namespace tmux fzf zsh antigen git-delta stow
brew install romkatv/powerlevel10k/powerlevel10k

brew cask install alacritty
