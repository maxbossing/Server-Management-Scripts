#!/usr/bin/env bash

# This Script was written by Max Bossing (maxbossing.de) for RedstoneGamesMC
# if any problems occur during runtime, feel free to open an issue on Github (https://github.com/RedstoneGames-MC/Server-Management-Scripts)

# to verify the integrity of this script download the .asc and the SHA256SUMS file
# then, run 'gpg --verify SHA256SUMS.asc', if it turns out ok, continue. if not, redownload or contact the developer
# now run 'sha256sum mkserver-bungeecord.sh' and 'sah256sum -c SHA256SUMS'. if the checksums match, continue. if not, redownload or contact the developer


#==Variables==#
bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
reset=$(tput sgr 0)


#==Error Handling Function==#
Error () {

    echo "${red} ${bold} ERROR: ${reset} $1"
    echo "[$(date +"%D %T")] ERROR: $1" >> mkserver-bungeecord.log
    echo "Script ended (1)"
    echo "[$(date +"%D %T")] Script ended (1)"
    exit

}


#==Server Setup fuction==#
mkserver_fun () {

    # setup logfile
    touch mkserver-bungeecord.log 

    echo "[$(date +"%D %T")] Server setup initiated" >> mkserver-bungeecord.log

    #Read User input
    read -p "${purple}Desired server directory path> " serverpath
    read -p "${purple}Desired servername> " servername
    read -p "${purple}Minimal RAM> " minRAM
    read -p "${purple}Maximal RAM> " maxRAM

    echo "[$(date +"%D %T")] User input completed" >> mkserver-bungeecord.log

    # create server Directory
    mkdir $serverpath || Error "Cannot create Directory"

    echo "${green}Server directory created successfully ${reset}"
    echo "[$(date +"%D %T")] Server directory created successfully" >> mkserver-bungeecord.log

    # dowload bungeecord.jar
    wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar -O $serverpath/bungeecord.jar || Error "cannot download Bungeecord.jar from https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar"

    echo "${green}bungeecord.jar downloaded successfully${reset}"
    echo "[$(date +"%D %T")] Server directory created successfully" >> mkserver-bungeecord.log

    # create start.sh
    echo -e "#!/usr/bin/env bash \nscreen -S $servername java -Xms$minRAM -Xmx$maxRAM -jar $serverpath/bungeecord.jar --nogui" > $serverpath/start.sh || Error "cannot create start.sh file"

    echo "${green}start.sh created successfully${reset}"
    echo "[$(date +"%D %T")] start.sh created successfully" >> mkserver-bungeecord.log

    # agree to eula in eula.txt
    echo "eula=true" > $serverpath/eula.txt || Error "cannot modify eula.txt"

    echo "${green}eula.txt modified successfully${reset}"
    echo "[$(date +"%D %T")] eula.txt modified successfully" >> mkserver-bungeecord.log

    # make start.sh and paper.jar executable
    chmod +x $serverpath/bungeecord.jar $serverpath/start.sh || Error "cannot modify permissions of bungeecord.jar and start.sh"

    echo "${green}permissions of bungeecord.jar and start.sh modified successfully${reset}"
    echo "[$(date +"%D %T")] permissions of bungeecord.jar and start.sh modified successfully" >> mkserver-bungeecord.log

    echo "${purple}Script ended (0)"
    echo "[$(date +"%D %T")] Script ended (0)" >> mkserver-bungeecord.log

}


#==Print Help Screen==#
help_fun () {

    echo "${bold}mkserver-bungeecord.sh - setup a bungeecord instance on GNU/Linux Arch for production/Development use"
    echo "${bold}${red}WARNING : ${normal}${reset} This Script is only meant for use within the RedstoneGames.ch production/devlopment environment"
    echo "Using this Script in another context may cause things to break"
    echo ""
    echo "Usage : mkserver-bungeecord.sh [argument]"
    echo ""
    echo "Options: "
    echo " --help -h       Prints this Screen"
    echo " --init -i       Starts the setup  "

}

#==Checks Input and call responsive function==#
if [[ "$1" == "--init" ]] || [[ "$1" == "-i" ]]; then
mkserver_fun
else
help_fun
fi

