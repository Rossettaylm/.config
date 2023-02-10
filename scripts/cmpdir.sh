#!/bin/bash
# 比较两个目录的文件

declare -A arr1 arr2

old_ifs="$IFS"
IFS=$'\n'
for i in $(ls -1A "$1");do arr1["$i"]=1; done
for i in $(ls -1A "$2");do arr2["$i"]=1; done
IFS="$old_ifs"

echo "--- files in in '$1' and not in '$2' ---"
for key in "${!arr1[@]}";do 
  [ "${arr2[$key]}" ] || echo "$key"
done

echo "--- files in in '$2' and not in '$1' ---"
for key in "${!arr2[@]}";do 
  [ "${arr1[$key]}" ] || echo "$key"
done
