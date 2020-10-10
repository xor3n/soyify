#!/bin/bash
# deploys the dotfiles

# this is demo of deploy script not yet done

cp -r cd files/dotfiles/themes/tomorrow-night/* files/config/

echo "are u sure?"
echo "sike no going back"

cp -r files/config/* ~/.config/

echo "yes"

# thing to use for later
# mkdir /tmp/xdbars-resources && cd /tmp/xdbars-resources
# git clone https://github.com/baskerville/bspwm 
# git clone https://github.com/baskerville/sxhkd
# git clone https://github.com/yshui/picom
# git clone https://github.com/davatorium/rofi
# git clone https://github.com/polybar/polybar
# cd .. && sudo make install /tmp/xdbars-resources
