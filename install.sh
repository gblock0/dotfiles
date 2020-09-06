#!/bin/bash

echo "installing dotfiles"

echo "initializing submodule(s)"
git submodule update --init --recursive

echo "installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "brewing all the things"
source install/brew.sh

echo "running stow (with --verbose=5)"
stow --verbose=5 -R ag alacritty git install nvim tmux vim zsh

echo "installing node (from nvm)"
nvm install stable
nvm alias default stable

echo "install plug.vim"
curl -# --create-dirs -o ~/.dotfiles/config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Add tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm tmux/tmux.symlink/plugins/tpm


if [ "$(uname)" == "Darwin" ]; then
    echo "updating OSX settings"
    source install/osx.sh
fi

echo "configuring zsh as default shell"
chsh -s $(which zsh)

nvim -c "PlugInstall"
