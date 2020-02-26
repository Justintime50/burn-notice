#!/bin/bash

# Script setup
echo -e "\n
    #################################################### 
    WARNING! BURN NOTICE WILL IRREVERSIBLY DESTROY DATA! 
    #################################################### 
\n\nPress <ENTER> to continue ONLY if you are sure this is what you want. Otherwise, quit this script."
read -r
# Grace period allowing a user to quit if they accidentally continued
SECONDS=(5 4 3 2 1)
for SECOND in "${SECONDS[@]}" ; do
    echo "Burning in $SECOND seconds..."
    sleep 1
done
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
    # Ignore the most common cloud storage provider folders
    if ! [[ "$ITEM" = "Nextcloud" || "$ITEM" = "nextcloud" || "$ITEM" = "Owncloud" || "$ITEM" = "owncloud" || "$ITEM" = "Nextcloud" || "$ITEM" = "Dropbox" || "$ITEM" = "dropbox" || "$ITEM" = "Google Drive File Stream" || "$ITEM" = "My Drive" || "$ITEM" = "Google Drive" || "$ITEM" = "OneDrive" || "$ITEM" = "Backup and Sync" || "$ITEM" = "Box" ]] ; then
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
    fi
done

echo -e "\n
    #######################################################
    BURN NOTICE COMPLETE! MAKE SURE TO CLOSE THIS TERMINAL!
    #######################################################    
\n\nTo fully burn your identity, it's suggested to also remove browsing data, log out of iCloud and other installed apps, and if very paranoid, format your hard drive. Remember, this script did not remove your trash, browser data, or log you out of iCloud or other accounts."

history -c
