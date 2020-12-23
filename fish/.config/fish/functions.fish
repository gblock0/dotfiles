function md
    mkdir -p $argv[1] && cd $argv[1]
end

# open dotfiles in nvim
function nrc
    cd ~/.dotfiles && nvim -c GFiles
end

# cd into dotfiles folder
function cdd
    cd ~/.dotfiles
end
