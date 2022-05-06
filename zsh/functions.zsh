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
    echo "Do you want to save your changes? [yes / no]"
    read cmd
    if [[ -n "$cmd" && $cmd = "yes" ]]; then 
        git add . 
        git commit -a
        git push 
    else
        echo "nothing gonna be changed."
    fi
    git status
}

