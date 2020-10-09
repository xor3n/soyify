#!/bin/bash

# installs the necessary packages

# yes
echo "need root"

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [[ $(id -u) != 0 ]]
then
   echo -e ""$E"Permission denied!"
   exit
fi

sleep 0.5
clear
sleep 0.5

echo -e "Thanks for using xdbars, enjoy the feeing of being a true soydev with you're epic tiling wm rice and CLI file manager, we hope it fills the void in your heart."

sleep 0.5

#install needed packages
echo -e "This will install all needed packages (st, bspwm, sxhkd, ranger, polybar and rofi) to provide you with a fully functional yet minimal system. Without these installed deploy.sh won't work properly and then running bloatdestroyer.sh will give you a broken system (this is bad), that is why we highly recommend running this. Remember, you can cncel at any time with ctrl + c [yes] [no]"

read option1

case $option1 in
   yes)
      bash setup.sh
   ;;
   
   no)
      echo -e "We highly recommmend not running any other script except the hardening one as they may result in a non-fucntional system. However if you know wwhat you are doing, go ahead and run them."
   ;;
esac

echo -e "Now on to the bloat destroyer script. This will remove all things replaced by newly installed packages, this is optional as some users may want to keep their previous DE/WM, file manager and terminal emulator. [yes] [no]"

read option2

case $option2 in
   yes)
      bash bloatdestroyer.sh
    ;;
   
   no)
      echo -e "All your old software will remain, run this at any time to remove it automatically."
    ;;
esac

echo -e "Now to harden everything, this will provide with a more secure system with no cost, your system will be just as functional, just as fast but far more secure [yes] [no]"

read option3

case $option3 in
   yes)
      bash harden.sh
    ;;

   no)
      echo -e "Without running this your system may be vulnerable, however some users may not wish to have their system hardened, if not, keep going!"
    ;;
esac

echo -e "Now to deploy everything, this will also automate all configuration for you. Without this, you will only have the needed needed, they will simply be installed and not remain in use. For this read we recommend running this. [yes] [no]"

read option4

case $option4 in
   yes)
      bash deploy.sh
    ;;

   no)
      echo -e "This means you now have multiple packages installed but not actually doing anything (bloat), this is not a good idea."
    ;;
esac

echo -e "thanks for using xdbars, we hope it worked, if not, that sucks, but feel free to let us know why at https://github.com/xor3n/xdbars"
