#!/usr/bin/env zsh

# alt+left 返回cd之前的目录
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

# alt+up 返回上一级目录
cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo 
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey # alt + up
bindkey '^[[1;3D'      cdUndoKey   # alt + left

