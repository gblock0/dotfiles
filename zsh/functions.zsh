####################
# functions
####################

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# open dotfiles in nvim
function nrc() {
  nvim ~/.dotfiles
}

function drmi() {
	docker rmi -f $(docker images | grep '^<none>' | awk '{print $3}')
}
