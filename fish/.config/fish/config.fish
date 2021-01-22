source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish
source ~/.config/fish/functions/git.fish
source ~/.localrc

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm use default --silent
