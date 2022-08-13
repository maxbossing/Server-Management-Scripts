#!/usr/bin/env bash

# full system upgrade
sudo apt update && sudo apt dist-upgrade -y

# install essential software for other scripts
sudo apt install screen bash openjdk-18-jdk

echo "Script ended (0)"


