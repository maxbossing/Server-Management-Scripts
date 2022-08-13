#!/usr/bin/env bash

# full system upgrade
sudo pacman -Syyu --noconfirm

# install esential software for scripts
sudo pacman -S screen bash jdk-openjdk  --noconfirm

echo "Script ended (0)"
