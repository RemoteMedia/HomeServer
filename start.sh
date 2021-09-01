#!/bin/bash

##### Below sets echo using the single quote mark to avoid any / commands being run during bash execution.

	echo
	echo
	echo '***********************************************************************************************'
	echo '                ____                       __          __  ___         ___                     '
	echo '               / __ \___  ____ ___  ____  / /____     /  |/  /__  ____/ (_)___ _               '
	echo '              / /_/ / _ \/ __ `__ \/ __ \/ __/ _ \   / /|_/ / _ \/ __  / / __ `/               '
	echo '             / _, _/  __/ / / / / / /_/ / /_/  __/  / /  / /  __/ /_/ / / /_/ /                '
	echo '            /_/ |_|\___/_/ /_/ /_/\____/\__/\___/  /_/  /_/\___/\__,_/_/\__,_/                 '
	echo '                                                                                               '
	echo '                                                                                               '
	echo '***********************************************************************************************'
	echo
	echo '                          Welcome to Remote Media server setup.'
	echo
	echo '📢Please make sure you have read the instructions in the GitHub repository prior to installing to'
	echo 'make sure your system meets the requirements. 📢'
	echo
        echo "                                    🚨🚨  WARNING   🚨🚨"
	#printf " \033[31m %s \n\033[0m" "                                🚨🚨  WARNING   🚨🚨"
	echo
	echo 'This configuration will overwite any current ~/docker path folders of same name.'
	echo


prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "Invalid input"
    esac
  done
}

##### Generate the prompt text here
prompt_confirm "Are you sure you wish to continue?" || exit 0
echo


front_configure() {

##### PS3 gives the prompt for which our multiple selection menu will come from
        PS3='Enter selection: '
##### Below is our menu list
        config=("Configure" "Options" "Quit")
##### Below uses select to generate our menu. We are telling select to use the 'config' array and hold the choic>##### a variable 'choice'
        select choice in "${config[@]}"; do
##### case choice lists the variable to execute our commands or comment through echo
                case $choice in
                        "Configure")
                                bash ~/docker/scripts/configuration/start.sh
                                exit
                                ;;
                        "Options")
                                bash ~/docker/scripts/options.sh
                                exit
                                ;;
                        "Quit")
                                echo
				echo "Exiting ... 👋"
                                echo
                                exit
                                ;;
##### The below lists a reply for any selection outside the scope of your list. Eg. entering '8'
                        *) echo "Invalid option";;
##### End case by spelling it backwards..
                esac
        done
}

front_install() {

##### PS3 gives the prompt for which our multiple selection menu will come from
        PS3='Enter selection: '
##### Below is our menu list
        frontinstall=("Install" "Apps" "Options" "Quit")
##### Below uses select to generate our menu. We are telling select to use the 'config' array and hold the choic
        select choice in "${frontinstall[@]}"; do
##### case choice lists the variable to execute our commands or comment through echo
                case $choice in
                        "Install")
                                bash ~/docker/scripts/configuration/start.sh
                                exit
                                ;;
                        "Apps")
                                bash ~/docker/scripts/apps.sh
                                #exit
                                ;;
                        "Options")
                                bash ~/docker/scripts/options.sh
                                exit
                                ;;
                        "Quit")
                                echo
                                echo "Exiting ... 👋"
                                echo
				exit
				;;
##### The below lists a reply for any selection outside the scope of your list. Eg. entering '8'
                        *) echo "Invalid option";;
##### End case by spelling it backwards..
		esac
        done
}

bash ~/docker/scripts/.set.sh

        if [ -d "~/docker/apps/traefik" ];
        then
                front_install
        else
                front_configure
        fi

# Authentication start
#	echo
#	echo 'Select which authentication method you are going to deploy in your setup:'
#	echo

##### PS3 gives the prompt for which our multiple selection menu will come from
#	PS3='Enter selection: '
##### Below is our menu list
#	auth=("Authelia" "Basic Auth" "Return to Menu")
##### Below uses select to generate our menu. We are telling select to use the 'auth' array and hold the choice in
##### a variable 'choice'
#	select choice in "${auth[@]}"; do
##### case choice lists the variable to execute our commands or comment through echo
#		case $choice in
#			"Authelia")
#				bash ~/docker/scripts/authelia/start.sh
#				exit
#				;;
#			"Basic Auth")
#				bash ~/docker/scripts/basic-auth/start.sh
#				exit
#				;;
#			"Quit")
#				bash ~/docker/scripts/start.sh
#				exit
#				;;
##### The below lists a reply for any selection outside the scope of your list. Eg. entering '8'
#			*) echo "Invalid input";;
##### End case by spelling it backwards..
#		esac
#	done

