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
  npm update -g typescript pyright vscode-css-languageserver-bin vscode-html-languageserver-bin vim-language-server
  brew upgrade efm-langserver
}
