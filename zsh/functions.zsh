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
    printf "Do you want to commit your changes? [ y / n ]\n"
    read MSG_COMMIT
    if [ "${MSG_COMMIT}" = "y" ]; then
        printf "\n>>>>>>>>>> add / commit current changes <<<<<<<<<<\n"
        git add . 
        git commit -a
        printf "\n>>>>>>>>>> Do you want to push your changes to remote? [y / n]\n"
        read MSG_PUSH
        if [ "${MSG_PUSH}" = "y"]; then
            echo pushle
            git push
            printf "\nYour changes has been pushed to remote!\n"
        else 
            printf "\nYour changes are temporarily stored locally!\n"
        fi
        git status
    else
        printf "Nothing gonna be changed!\n"
    fi
}

