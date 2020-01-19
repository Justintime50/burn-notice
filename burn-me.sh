#!/bin/bash

echo -e "\n
    #################################################### 
    WARNING! BURN NOTICE WILL IRREVERSIBLY DESTROY DATA! 
    #################################################### 
    \n\nPress <ENTER> to continue ONLY if you are sure this is what you want. Otherwise, quit this script."

read -r

echo "Burning..."

# Remove hidden files that may be sensitive
LISTFILES="
    .aws 
    .bash_history
    .bash_sessions
    .composer
    .config
    .docker
    .gem
    .gitconfig
    .npm
    .npmrc
    .ssh
    .vscode
    .zsh_history
    .zshrc
"

for ITEM in LISTFILES ; do
    rm -rf $HOME/$ITEM
done

# Remove the contents of the user's most used directories
LISTDIRECTORIES="
    Desktop/*
    Documents/*
    Downloads/*
    Movies/*
    Music/*
    Pictures/*
"

for ITEM in LISTDIRECTORIES ; do
    cd $HOME/$ITEM || exit
    rm -rf .[^.]*
    cd .. || exit
done
