#!/bin/bash
# install the necessary packages

# yes
echo "need root"

# add backports so that polybar can be installed
echo "deb http://deb.debian.org/debian buster-backports main contrib non-free" >> /etc/apt/sources.list

# install shit
sudo apt -t buster-backports install polybar
apt install bspwm sxhkd rofi feh
