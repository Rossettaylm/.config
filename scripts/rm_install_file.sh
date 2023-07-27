#!/usr/bin/bash

if [[ -f "./install_manifest.txt" ]]; then
	for file in $(<install_manifest.txt) ; do 
		sudo rm -rf ${file}; 
		printf "%s\n" "\"${file}\" delete success!";
	done
else
	printf '%s\n' "There is no 'install_manifest.txt' in this directory!";
fi
