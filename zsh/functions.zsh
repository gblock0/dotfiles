####################
# functions
####################

# Create a new directory and enter it
function md() {
    mkdir -p "$@" && cd "$@"
}

# install a grunt plugin and save to devDependencies
function gi() {
    npm install --save-dev grunt-"$@"
}

# install a grunt-contrib plugin and save to devDependencies
function gci() {
    npm install --save-dev grunt-contrib-"$@"
}

# set the background color to light
function light() {
    export BACKGROUND="light" && reload!
}

function dark() {
    export BACKGROUND="dark" && reload!
}
