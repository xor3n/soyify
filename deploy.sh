#!/bin/bash
# deploys the dotfiles

# this is demo of deploy script not yet done

# cp -r files/dotfiles/themes/tomorrow-night/* files/config/
echo -e "enter your user, this is to make sure configuration occurs properly"
read user
clear
cp -r files/dotfiles/themes/tomorrow-night/* /home/$user/.config/
#echo "are u sure?"
#echo "sike no going back"

#cp -r files/config/* ~/.config/

#echo "yes"
