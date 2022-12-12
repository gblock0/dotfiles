# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTFILES=$HOME/.dotfiles
export ZSH=$HOME/.zsh
export EVENT_NOKQUEUE=1

source $(brew --prefix)/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting >/dev/null
antigen bundle zsh-users/zsh-autosuggestions >/dev/null
antigen apply >/dev/null

# load all zsh config files
for config ($ZSH/*.zsh) source $config

bindkey -e

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

# Add poetry to path
export PATH=~/.poetry/bin:$PATH

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# Add ctrl+f to move forward one word (includes in autocomplete)
bindkey '^f' forward-word

# Add ctrl+b to move backward one word (includes in autocomplete)
bindkey '^b' backward-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NVM settings
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

function set_nvm() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
  fi
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

chpwd_functions+=(set_nvm)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
