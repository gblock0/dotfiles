# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.zsh
export EVENT_NOKQUEUE=1

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

source /usr/local/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# load all zsh config files
for config ($ZSH/*.zsh) source $config


# TODO: Need to set this up
if [[ -a ~/.localrc ]]; then
    source ~/.localrc
fi

export VISUAL='nvim'
export EDITOR='$VISUAL'

# adding custom scripts to path directory
export PATH=~/.tmux/bin/bash:$PATH

# Add sbin to path for Homebrew
export PATH="/usr/local/sbin:$PATH"

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NVM settings
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm use default
