#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

DOT_FOLDERS="nvim, kitty"

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE --ignore=.DS_Store\
        -t $HOME -D $folder
    stow --ignore=.DS_Store -v -t $HOME $folder
done

# Reload shell once installed
echo "[+] Reloading shell..."
exec $SHELL -l
