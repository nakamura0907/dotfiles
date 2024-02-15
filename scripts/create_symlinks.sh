#!/bin/bash

readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
readonly PROJECT_ROOT="$(realpath "$SCRIPT_DIR/../")"

echo ""
echo "========================================"
echo "Creating symbolic links..."
echo "========================================"
echo ""

readonly IGNORE_PATTERN="^\.(git$|gitignore|zprofile)"
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue

    if [ $dotfile = ".config" ]; then
        for f in $PROJECT_ROOT/.config/*; do
            ln -snfv $f ~/.config/
        done
        continue
    fi
    
    if [ $dotfile = ".xmonad" ]; then
        ln -snfv $PROJECT_ROOT/.xmonad/xmonad.hs ~/.xmonad/
        continue
    fi

    ln -snfv $PROJECT_ROOT/$dotfile ~/ 
done
