#!/bin/sh

POSIXLY_CORRECT=1

# removes packages that were replaced by other packages

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [ $(id -u) != 0 ]
then
   echo ""$E"Permission denied!"
   exit
fi

sleep 0.5
clear
sleep 0.5

echo "this script will remove all things replaced by setup.sh and will run your package managers autoclean, this script is optional as some users may desire to keep their old software, feel free to skip but know that this will result in wasted space."
sleep 0.5
echo "IMPORTANT: Run this sript from your newly set up terminal emulator: st"
sleep 0.5
echo "IMPORTANT: Do not fret if there are error messages about packages not being found, this is normal as some users may have different packages to another"
sleep 0.5
echo "enter your package manager:"

read pacm

case $pacm in

	apt)
		#remove all extra file managers
        	echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
        	read fman
        	apt-get autoremove --purge $fman*

		#remove desktop environment
        	echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
        	read DEWM
        	apt-get autoremove --purge $DEWM* ;;
		
		#remove old terminal emulator
		echo "time to remove your old terminal emulator, just enter the package name and off we go"	
		read TE
		apt-get autoremove --purge $TE*
		
		#remove unecessary packages found in debian distros
		apt-get autoremove --purge aptitude bc nano tcsh w3m zip mutt foomatic-filters vim-tiny vi hplip ncurses-term smclient ssh unzip tasksel vim-common wamerican whois
		
		apt-get autoremove
		echo "bloat, destroyed."
	  ;;
	  
	pacman)
                echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                pacman -R $fman

                #remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	pacman -R $DEWM

                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                pacman -R $TE

                pacman -Rsn $(pacman -Qdtq)
                echo "bloat, destroyed."
	  ;;	
	
	yum)
		echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                yum remove $fman

		#remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	yum remove $DEWM

                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                yum remove $TE

                yum remove `package-cleanup --leaves`
                echo "bloat, destroyed."
	  ;;	
		
	eopkg)
		echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                eopkg remove $fman

                #remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	eopkg remove $DEWM

                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                eopkg remove $TE
		
		eopkg remove-orphans
                echo "bloat, destroyed."
	  ;;	
	
	xbps)
		echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                xbps-remove $fman

                #remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	xbps-remove $DEWM

                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                xbps-remove $TE

                xbps-remove -o -O
                echo "bloat, destroyed."
	 ;;	
	
	apk)
		echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                apk del $fman

                #remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	apk del $DEWM*


                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                apk del $TE
		
                echo "bloat, destroyed."
         ;; 
	 
	brew)
		echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                brew remove $fman

                #remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	brew remove $DEWM*

                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                brew delete $TE
		
		brew cleanup
                echo "bloat, destroyed."
	  ;;
	  
	pkg)
		echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                pkg remove $fman

		#remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	pkg remove $DEWM

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                pkg remove $TE
		
		pkg -y autoremove
                echo "bloat, destroyed."
	   ;;
	 
	 dnf)
	 	echo "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                dnf remove  $fman

                #remove desktop environment + terminal emulator
                echo "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        	dnf remove $DEWM


                #remove old terminal emulator
                echo "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                dnf remove $TE

		dnf autoremove
                echo -e "bloat, destroyed."
	     ;;

	   portage)
	   	echo -e "enter the name of your file manager here, if you have multiple, just seperate them by a space."
                read fman
                emerge --deselect $fman

                #remove desktop environment + terminal emulator
                echo -e "enter your desktop environment or windows managers name here, if you have multiple, seperate them by a space, you must enter the package name, not the DE/WM's name."
                read DEWM
        			portage --deselect $DEWM

                #remove old terminal emulator
                echo -e "time to remove your old terminal emulator, just enter the package name and off we go"
                read TE
                emerge --deselect $TE
		
		emerge --depclean -vp
                echo -e "bloat, destroyed."
esac
