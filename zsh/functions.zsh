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
    printf "Commit and Push your changes? [ y / n ]\n"
    read MSG
    if [ "${MSG}" = "y" ]; then
        printf "\n>>>>>>>>>> add / commit current changes <<<<<<<<<<\n"
        git add . 
        git commit -a
        printf "\n>>>>>>>>>> Do you want to push your changes? [y/n]\n"
        read MSG
        git status
        if [ "${MSG}" = "y"]; then
            git push
            printf "\nYour changes has been pushed to remote!\n"
        else 
            printf "\nYour changes are temporarily stored locally!\n"
        fi
    else
        printf "Nothing gonna be changed!\n"
    fi
}

