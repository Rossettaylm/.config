 # _____ __________ 
# |  ___|__  /  ___|
# | |_    / /| |_   
# |  _|  / /_|  _|  
# |_|   /____|_|    
#
                  
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude '.git'"
export FZF_DEFAULT_OPTS="--height 60% --layout reverse --border "
export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude '.git'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude '.git'"
# export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'" # file or directory

# change to ctrl-p
export FZF_CTRL_T_OPTS="--preview 'file {}' --preview-window up,1,border-horizontal" 

# change to ctrl-h
export FZF_CTRL_R_OPTS="" # history
# ---------
# Setup fzf
if [[ ! "$PATH" == *$FZF_HOME/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${FZF_HOME}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_HOME}/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${FZF_HOME}/shell/key-bindings.zsh"
