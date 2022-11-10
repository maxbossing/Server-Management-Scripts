#!/usr/bin/env bash

# This Script was written by Max Bossing (maxbossing.de) for RedstoneGamesMC
# if any problems occur during runtime, feel free to open an issue on Github (https://github.com/RedstoneGames-MC/Server-Management-Scripts)

# to verify the integrity of this script download the .asc and the SHA256SUMS file
# then, run 'gpg --verify SHA256SUMS.asc', if it turns out ok, continue. if not, redownload or contact the developer
# now run 'sha256sum update.sh' and 'sah256sum -c SHA256SUMS'. if the checksums match, continue. if not, redownload or contact the developer


#==Variables==#
bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
reset=$(tput sgr 0)


#==Error Handling Function==#
error () {

    echo "${red} ${bold} ERROR: ${reset} $1"
    echo "[$(date +"%D %T")] ERROR: $1" >> update.log
    echo "Script ended (1)"
    echo "[$(date +"%D %T")] Script ended (1)"
    exit

}

#==Actual Update Function==#
update_fun () {

    # setup logfile
    touch update.log

    echo "[$(date +"%D %T")] Update initiated" >> update.log

    # full system upgrade
    sudo pacman -Syyu --noconfirm || error "Failed to update system"

    echo "${green}System Upgrade Successfull ${reset}"
    echo "[$(date +"%D %T")] System Upgrade Successfull" >> update.log

    echo "${purple}Script ended (0)"
    echo "[$(date +"%D %T")] Script ended (0)" >> update.log
}

#==Print Help Screen==#
help_fun () {

    echo "${bold}update.sh - update a GNU/Linux Arch Machine for production/Development use"
    echo "${bold}${red}WARNING : ${normal}${reset} This Script is only meant for use within the RedstoneGames.ch production/devlopment environment"
    echo "Using this Script in another context may cause things to break"
    echo ""
    echo "Usage : init.sh [Argument] "
    echo ""
    echo "Options: "
    echo " --help -h       Prints this Screen"
}

#==Checks Input and call responsive function==#
if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
help_fun
else
update_fun
fi