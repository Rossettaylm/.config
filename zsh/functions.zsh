#!/usr/bin/env zsh

ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

update () {
    DIR=`dirname $(realpath $0)`
    echo "update $DIR ..."
    git pull 
    git status
}

commit () {
    DIR=`dirname $(realpath $0)`
    echo "checking $DIR status"
    git status
    echo "Do you want to save your changes? [y / n]"
    read local commitcmd
    if [[ -z "$commitcmd" || $commitcmd = "y" ]]; then 
        git add . 
        git commit -a
    else
        echo "COMMIT: nothing gonna be changed."
    fi
    echo "Do you want to push your change? [y / n]"
    read local pushcmd
    if [[ -z "$pushcmd" || $pushcmd = "y" ]]; then 
        git push
    else
        echo "PUSH: nothing gonna be changed."
    fi
    git status
}

