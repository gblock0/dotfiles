export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh

export VISUAL='nvim'
export EDITOR='$VISUAL'
export NEOVIM_JS_DEBUG="~/.nvim_js_debug"
export FZF_DEFAULT_COMMAND='ag -g ""'

export PATH=/usr/local/bin:$PATH

export THEME="base16-atelierheath"
if [ -z "$BACKGROUND" ]; then
	export BACKGROUND="dark"
fi

# add /usr/local/sbin
if [[ -d /usr/local/sbin ]]; then
	export PATH=/usr/local/sbin:$PATH
fi

# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
	export PATH=~/bin:$PATH
fi

# source nvm
export NVM_DIR=~/.nvm

export API_URL=$(ipconfig getifaddr en0)
export NEW_API_URL=$(ipconfig getifaddr en0)

export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/Users/gregoryblock/.boot2docker/certs/boot2docker-vm
