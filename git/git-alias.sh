#!/bin/sh

#alias git status to gits
alias gits='git status'

commit-all() {
    if [ $# == 0 ];then
	echo "Usage: commit <message>"
	return
    fi
    FIS=$IFS
    IFS=$'\n'
    for file in $(gits -s)
    do
	path=$(echo $file | awk '{print $2}')
	echo $path
	git add $path
    done
    echo "Ready for commit"
    git commit -m"$1"
    IFS=$FIS
}

alias commit='commit-all'
