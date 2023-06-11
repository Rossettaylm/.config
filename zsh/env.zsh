#!/usr/bin/env zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export TOMCAT_HOME="/usr/share/tomcat8"
export GITHUB_ACCOUNT_PREFIX="https://github.com/Rossettaylm"
export SCRIPTS_HOME="$HOME/.config/scripts"

# Path to your oh-my-zsh installation.
export ZSH_HOME="$HOME/.config/zsh"
export ZSH="$ZSH_HOME/oh-my-zsh"
export FZF_HOME="$HOME/softwares/fzf"
export SOFTWARES_HOME="$HOME/softwares"

export PATH=$SCRIPTS_HOME:$PATH
export PATH=$SOFTWARES_HOME/nvim/bin:$SOFTWARES_HOME/nodejs/bin:$HOME/.local/bin:$PATH

export EDITOR=nvim
export TERM=xterm-256color

