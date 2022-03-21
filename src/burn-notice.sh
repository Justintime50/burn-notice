#!/bin/bash

main() {
    print_start_message
    read -r
    start_countdown
    remove_hidden_items
    remove_visible_items
    print_end_message
    history -c
}

print_start_message() {
    echo -e "\n
#################################################### 
WARNING! BURN NOTICE WILL IRREVERSIBLY DESTROY DATA! 
#################################################### 
\n\nPress any key to continue ONLY if you are sure this is what you want. Otherwise, quit immediately."
}

print_end_message() {
    echo -e "\n
#######################################################
BURN NOTICE COMPLETE! MAKE SURE TO CLOSE THIS TERMINAL!
#######################################################    
\n\nTo fully burn your identity, it's suggested to also remove browsing data, log out of iCloud and other installed apps, and if very paranoid, format your hard drive.\nRemember, this script did not remove your trash, browser data, or log you out of iCloud or other accounts."
}

start_countdown() {
    # Grace period allowing a user to quit if they accidentally continued
    local seconds
    local second
    seconds=(5 4 3 2 1)
    for second in "${seconds[@]}"; do
        echo "Burning in $second seconds..."
        sleep 1
    done
    cd "$HOME" || exit 1
}

remove_hidden_items() {
    # Remove hidden files/folders
    local item
    for item in .[^.]*; do
        if [[ -d "$item" ]]; then
            cd "$item" || exit 1
            rm -rf ./*
            rm -rf .[^.]*
            cd .. || exit 1
            echo "$HOME/$item contents burned."
        else
            rm -f "$item"
            echo "$HOME/$item burned."
        fi
    done
}

remove_visible_items() {
    # Remove visible files/folders
    local item
    for item in *; do
        # Ignore some of the most common cloud storage provider folders
        if ! [[ 
            "$item" = "Backup and Sync" ||
            "$item" = "Box" ||
            "$item" = "dropbox" ||
            "$item" = "Dropbox" ||
            "$item" = "Google Drive File Stream" ||
            "$item" = "Google Drive" ||
            "$item" = "iCloud Drive" ||
            "$item" = "iCloud" ||
            "$item" = "My Drive" ||
            "$item" = "nextcloud" ||
            "$item" = "Nextcloud" ||
            "$item" = "OneDrive" ||
            "$item" = "owncloud" ||
            "$item" = "Owncloud" ]] \
            ; then
            if [[ -d "$item" ]]; then
                cd "$item" || exit 1
                rm -rf ./*
                rm -rf .[^.]*
                cd .. || exit 1
                echo "$HOME/$item contents burned."
            else
                rm -f "$item"
                echo "$HOME/$item burned."
            fi
        fi
    done
}

main
