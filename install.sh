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
		curl -# --create-dirs -o ~/.dotfiles/config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

		echo "Add tmux plugin manager"
		git clone https://github.com/tmux-plugins/tpm tmux/tmux.symlink/plugins/tpm

		echo "Installing JS-Beautifier"
		npm install -g js-beautify

		echo "Fixing Terminfo for now. Look at https://github.com/neovim/neovim/issues/2048#issuecomment-78045837 for more details"
		infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
		tic $TERM.ti
fi


echo "configuring zsh as default shell"
chsh -s $(which zsh)

vim -c "PlugInstall"
