#!/bin/bash

echo "installing dotfiles"

if [ ! -x "$(command -v brew)" ]; then
    echo "installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    echo "brewing all the things"
else
    echo "homebrew already install! skipping..."
fi

source install/brew.sh

echo "installing fzf keybindings and completions..."
$(brew --prefix)/opt/fzf/install --all

echo "running stow (with --verbose=3)"
stow --verbose=3 -R alacritty bat git nvim ssh tmux zsh ideavim vim

echo "linking config dir"
ln -sv $(PWD)/config/* ~/.config

if [ ! -d "${HOME}/.dotfiles/tmux/.tmux/plugins/tpm" ]; then
    echo "Add tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager already installed! skipping!"
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "updating OSX settings"
    source install/osx.sh
fi

echo "configuring zsh as default shell"
chsh -s $(which zsh)
