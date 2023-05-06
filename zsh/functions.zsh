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
    read msg
    if [ "${msg}" = "y" ]; then
        printf "\n>>>>>>>>>>add / commit current changes<<<<<<<<<<\n"
        git add . 
        git commit -a
        printf "\n>>>>>>>>>> push current changes <<<<<<<<<<\n"
        git push
        git status
    else
        printf "Nothing gonna be changed!\n"
    fi
}

function set_proxy () {
    export LOCAL_IP=$(cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2)
    export all_proxy="http://${LOCAL_IP}:7890"
    git config --global http.proxy "${all_proxy}"
    git config --global https.proxy "${all_proxy}"
}


function unset_proxy () {
    unset all_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy 
}

function test_proxy() {
    resp=$(curl -I -s --connect-timeout 5 -m 5 -w "%{http_code}" -o /dev/null www.google.com)
    if [ ${resp} = 200 ]; then
        echo "State Code: $resp, Proxy setup succeeded!"
    else
        echo "State Code: $resp, Proxy setup failed!"
    fi
}
