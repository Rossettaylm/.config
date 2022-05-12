#!/bin/bash

GITHUB="/home/rossetta/Github"
CONFIG_HOME="/home/rossetta/.config"
if [[ -d "${GITHUB}" ]]; then 
    git clone https://github.com/Rossettaylm/.config.git ${GITHUB}/.config
fi

if [[ -d "${CONFIG_HOME}" ]]; then 
    cp -r "$GITHUB/.config/*" "$CONFIG_HOME/"
else
    mkdir "$CONFIG_HOME" && cp -r "$GITHUB/.config/*" "$CONFIG_HOME/"

sudo pacman -Syyu 
sudo pacman -S neovim ranger neofetch alacritty zsh gdb cmake

