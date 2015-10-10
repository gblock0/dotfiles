#!/bin/bash

echo "installing dotfiles"

echo "initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "running on OSX"

    echo "installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo "brewing all the things"
    source install/brew.sh

    echo "updating OSX settings"
    source install/osx.sh

    echo "installing node (from nvm)"
    nvm install stable
    nvm alias default stable

		echo "install plug.vim"
		curl -# --create-dirs -o ~/.dotfiles/vim/vim.symlink/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


echo "configuring zsh as default shell"
chsh -s $(which zsh)

vim -c "PlugInstall"
