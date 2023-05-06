 # _____ __________ 
# |  ___|__  /  ___|
# | |_    / /| |_   
# |  _|  / /_|  _|  
# |_|   /____|_|    
#
#

# config ** completion
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200' --preview-label='Directories'          "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}" --preview-label='Environment Variables'      "$@" ;;
    ssh)          fzf --preview 'dig {}' --preview-label='Hosts'                                "$@" ;;
    nvim)         fzf --preview 'bat -n --color=always {}' --preview-label='Files'              "$@" ;;
    kill)         fzf --preview-label='Processes'                                               "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' --preview-label='Search'             "$@" ;;
  esac
}

export FZF_DEFAULT_COMMAND="fdfind --type f --hidden --exclude '.git'"
export FZF_DEFAULT_OPTS="--height 80% --layout reverse --border --preview 'bat -n --color=always {}'"
export FZF_CTRL_T_COMMAND="fdfind --type f --hidden --exclude '.git'"
export FZF_ALT_C_COMMAND="fdfind --type d --hidden --exclude '.git'"

# change to ctrl-p override
export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --preview-label='Files'" 

# change to ctrl-h override
export FZF_CTRL_R_OPTS="${FZF_DEFAULT_OPTS} --preview-label='History Commands'" # history

# override preview with tree
export FZF_ALT_C_OPTS="--preview 'tree -C {}' --preview-label='Directorys'"

_fzf_fpath=${0:h}/fzf
fpath+=$_fzf_fpath
autoload -U $_fzf_fpath/*(.:t)
unset _fzf_fpath
                  
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
