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
	m_type=$(echo $file|awk '{print $1}')
	path=$(echo $file | awk '{print $2}')
	if [ -n "$(echo $m_type | grep "^D.*")" ];then
	    echo "Remove file $path"
	    git rm $path
	else
	    echo "Stage file modification for $path"
	    git add $path
	fi
    done
    echo "Ready for commit"
    git commit -m"$1"
    IFS=$FIS
}

alias commit='commit-all'
