#!/bin/sh

POSIXLY_CORRECT=1

#check if the user is root

mkdir files/dotfiles/themes/tomorrow-night/mpd/playlists

if ! [ $(id -u) = 0 ]; then
	echo "Warning, you are not running this script as root, so the config file its gettin coppied to your profile"
	cp -r files/dotfiles/themes/tomorrow-night/* /home/"$USER"/.config/
#if the user is root
else
	cp -r files/dotfiles/themes/tomorrow-night/* ~/.config/
fi
