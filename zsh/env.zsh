#!/usr/bin/env zsh


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export CMAKE_HOME="/usr/local/cmake-3.22.4-linux-x86_64"
export GDB_HOME="/usr/local/gdb-11.1"
export TOMCAT_HOME="/usr/share/tomcat8"
export CLION_PROJECT="/home/rossetta/CLionProjects"
export GITHUB_ACCOUNT_PREFIX="https://github.com/Rossettaylm"
export SCRIPTS_HOME="$HOME/.config/scripts"

export PATH=$PATH:$CMAKE_HOME/bin
export PATH=$PATH:$GDB_HOME/bin
export PATH=$PATH:$SCRIPTS_HOME

# Path to your oh-my-zsh installation.
export ZSH_HOME="$HOME/.config/zsh"
export ZSH="$ZSH_HOME/oh-my-zsh"
export FZF_HOME="$HOME/Softwares/fzf"

export EDITOR=nvim
export TERM=xterm-256color


