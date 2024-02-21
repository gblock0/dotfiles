####################
# functions
####################

# create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# open dotfiles in nvim
function nrc() {
    cd ~/.dotfiles && nvim -c GFiles
}

# remove all docker images
function drmi() {
	docker rmi -f $(docker images | grep '^<none>' | awk '{print $3}')
}

# cd into dotfiles folder
function cdd() {
    cd ~/.dotfiles
}

function update-language-servers() {
  npm update -g typescript pyright vim-language-server vscode-langservers-extracted typescript-language-server
}

# Git checkout to main or master whatever the current repository uses
function gcm() {
  if [ `git rev-parse --verify master 2>/dev/null` ]
  then
    git checkout master
    return
  fi

  if [ `git rev-parse --verify main 2>/dev/null` ]
  then
    git checkout main
    return
  fi

  RED='\033[0;31m'
  NC='\033[0m' # No Color
  echo -e "${RED}No master or main branch found!${NC}"
}
