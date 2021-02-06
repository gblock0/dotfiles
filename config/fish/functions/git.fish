function g
    if count $argv > /dev/null
        # if there are arguments, send them to git
        git $argv
    else
        # otherwise, run git status
        git status
    end
end

# Show preview of changed files using fzf --preview
function fd
    set preview "git diff $argv --color=always -- {-1}"
    git diff $argv --name-only | fzf -m --ansi --preview $preview
end
