#!/usr/bin/env zsh

ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

update-config () {
    cd ${HOME}/.config
    echo "update .config ..."
    git pull 
    git status
    cd 
}

commit-config () {
    cd ${HOME}/.config
    echo "checking .config status"
    git status
    echo "Do you want to save your changes? [yes / no]"
    read cmd
    if [[ -n "$cmd" && $cmd = "yes" ]]; then 
        git add . 
        git commit -a
    else
        echo "nothing gonna be changed."
    fi
    cd
}
