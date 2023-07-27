#!/usr/bin/env zsh

alias ll="ls -lh"
alias la="ls -a"
# alias setproxy="export http_proxy='http://127.0.0.1:7890' && export https_proxy='https://127.0.0.1:7890'"
# alias unsetproxy="unset http_proxy && unset https_proxy"
alias e="exit"
alias sudo="sudo -E"
alias neo='neofetch'
alias ra='ranger_cd'
alias who="who -H"
alias c="clear"
alias szsh="source $HOME/.zshrc"
alias ezsh="nvim $ZSH_HOME/zshrc"
alias base="conda activate base"
alias sra='sudo -E ranger_cd'
alias vim='nvim'
alias gg='git clone'
alias up='sudo pacman -Syyu'
alias clip='xclip -selection c'
alias px='proxychains'
alias xm="xmake"
alias xmr="xmake build && xmake run"
alias sdrnow="shutdown -r now"
alias sdnow="shutdown now"
alias fd="fdfind"
alias cat="batcat"
alias cmb="cmake_build"
alias cmr="cmake_run"
alias make="make -j8"
alias msq="mysql -urossetta -pfilae"
alias cdcode="cd $CODE_HOME/vscode_projects"

# alacritty colorscheme
# 准备工作: pip install alacritty-colorscheme
#
LIGHT_COLOR='base16-github-256.yml'
DARK_COLOR='base16-snazzy-256.yml'
alias day='alacritty-colorscheme -V apply $LIGHT_COLOR'
alias night='alacritty-colorscheme -V apply $DARK_COLOR'

