#!/bin/sh

POSIXLY_CORRECT=1

# deploys dotfiles
# cp -r files/dotfiles/themes/tomorrow-night/* files/config/
cp -r files/dotfiles/themes/tomorrow-night/* /home/$USER/.config/
#cp -r files/config/* ~/.config/
