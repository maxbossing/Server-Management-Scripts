#!/usr/bin/env bash

# read input
read -p "path to server : " serverpath

read -p "name of server : " servername

read -p "minimal RAM : " minRAM

read -p "maximal RAM : " maxRAM

# create server Directory
mkdir $serverpath

# download Paper.jar
wget https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar -O $serverpath/paper.jar

# create start.sh
echo -e "#!/bin/bash \nscreen -S $servername java -Xms$minRAM -Xmx$maxRAM -jar $serverpath/paper.jar --nogui" > $serverpath/start.sh

# set eula.txt to true
echo "eula=true" > $serverpath/eula.txt

# make start.sh and paper.jar executable
chmod +x $serverpath/paper.jar $serverpath/start.sh

echo "Script ended (0)"
