#!/bin/bash

# Script setup
echo -e "\n
    #################################################### 
    WARNING! BURN NOTICE WILL IRREVERSIBLY DESTROY DATA! 
    #################################################### 
\n\nPress <ENTER> to continue ONLY if you are sure this is what you want. Otherwise, quit this script."
read -r
echo "Burning in 5 seconds..."
sleep 5 # Grace period for accidental continuation
cd "$HOME" || exit

# Remove hidden files/folders
for ITEM in .[^.]* ; do
    if [[ -d "$ITEM" ]] ; then
        cd "$ITEM" || exit
        rm -rf ./*
        rm -rf .[^.]*
        cd .. || exit
        echo "$HOME/$ITEM contents burned."
    else
        rm -f "$ITEM"
        echo "$HOME/$ITEM burned."
    fi
done

# Remove visible files/folders
for ITEM in * ; do
    if [[ -d "$ITEM" ]] ; then
        cd "$ITEM" || exit
        rm -rf ./*
        rm -rf .[^.]*
        cd .. || exit
        echo "$HOME/$ITEM contents burned."
    else
        rm -f "$ITEM"
        echo "$HOME/$ITEM burned."
    fi
done

echo -e "\n
    #######################################################
    BURN NOTICE COMPLETE! MAKE SURE TO CLOSE THIS TERMINAL!
    #######################################################    
\n\nTo fully burn your identity, it's suggested to also remove browsing data, log out of iCloud and other installed apps, and if very paranoid, format your hard drive."

history -c
