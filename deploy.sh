#!/bin/bash
# deploys the dotfiles

# this is demo of deploy script not yet done

cp -r files/dotfiles/* files/config

echo "are u sure?"
echo "sike no going back"

cp -r files/config ~/.config

echo "yes"
