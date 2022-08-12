#!/usr/bin/env bash
selected=`cat ~/.tmux-cht-languages | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

grep -qs "$selected" ~/.tmux-cht-languages
query=`echo $query | tr ' ' '+'`
tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
