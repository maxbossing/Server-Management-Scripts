#!/usr/bin/env bash

# This Script was written by Max Bossing (maxbossing.de) for RedstoneGamesMC
# if any problems occur during runtime, feel free to open an issue on Github (https://github.com/RedstoneGames-MC/Server-Management-Scripts)

# to verify the integrity of this script download the .asc and the SHA256SUMS file
# then, run 'gpg --verify SHA256SUMS.asc', if it turns out ok, continue. if not, redownload or contact the developer
# now run 'sha256sum setup.sh' and 'sah256sum -c SHA256SUMS'. if the checksums match, continue. if not, redownload or contact the developer

# to change the location of the packages file, edit $package_list


#==Variables==#
bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
reset=$(tput sgr 0)

package_list="pkglist.txt"


#==Error Handling Function==#
error () {

    echo "${red} ${bold} ERROR: ${reset} $1"
    echo "[$(date +"%D %T")] ERROR: $1" >> setup.log
    echo "Script ended (1)"
    echo "[$(date +"%D %T")] Script ended (1)"
    exit

}


#==Actual Setup Function==#
init_fun () {

    # setup logfile
    touch setup.log

    echo "[$(date +"%D %T")] Setup initiated" >> setup.log

    # full system upgrade
    sudo pacman -Syyu --noconfirm || error "Failed to update system"

    echo "${green}System Upgrade Successfull ${reset}"
    echo "[$(date +"%D %T")] System Upgrade Successfull" >> setup.log

    # install esential software for scripts
    sudo pacman -S --needed --noconfirm - < $package_list || error "Failed to install Packages"

    echo "${green}Package install succesfull ${reset}"
    echo "[$(date +"%D %T")] package install Successfull" >> setup.log

    echo "${purple}Script ended (0)"
    echo "[$(date +"%D %T")] Script ended (0)" >> setup.log
}


#==Print Help Screen==#
help_fun () {

    echo "${bold}setup.sh - setup a fresh GNU/Linux Arch Machine for production/Development use"
    echo "${bold}${red}WARNING : ${normal}${reset} This Script is only meant for use within the RedstoneGames.ch production/devlopment environment"
    echo "Using this Script in another context may cause things to break"
    echo ""
    echo "Usage : setup.sh [argument]"
    echo ""
    echo "Options: "
    echo " --help -h       Prints this Screen"
    echo " --init -i       Starts the setup  "

}


#==Checks Input and call responsive function==#
if [[ "$1" == "--init" ]] || [[ "$1" == "-i" ]]; then
init_fun
else
help_fun
fi






