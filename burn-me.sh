#!/bin/bash

# List of hidden files to burn
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

# List of directories to burn
LISTDIRECTORIES="
    Desktop
    Documents
    Downloads
    Movies
    Music
    Pictures
    git
"

# Run the script
echo -e "\n
    #################################################### 
    WARNING! BURN NOTICE WILL IRREVERSIBLY DESTROY DATA! 
    #################################################### 
    \n\nPress <ENTER> to continue ONLY if you are sure this is what you want. Otherwise, quit this script."

read -r
echo "Burning..."

# Remove hidden files that may be sensitive
for ITEM in $LISTFILES ; do
    if [ -f "$HOME"/"$ITEM" ] ; then
        rm -rf "$HOME"/"${ITEM:?}"
        echo "$ITEM has been burned."
    else
        echo "$ITEM doesn't exist, skipping."
    fi
done

# Remove the contents of the user's most used directories
for ITEM in $LISTDIRECTORIES ; do
    if [ -f "$HOME"/"$ITEM" ] ; then
        cd "$HOME"/"$ITEM" || exit
        rm -rf .[^.]*
        cd .. || exit
        echo "$ITEM has been burned."
    else
        echo "$ITEM doesn't exist, skipping."
    fi
done

echo -e "\nThe script is complete. To fully burn your identity, it's suggested to also remove browsing data, log out of iCloud and other installed apps, and if very paranoid, format your hard drive."

history -c