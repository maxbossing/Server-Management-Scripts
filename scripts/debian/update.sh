#!/usr/bin/env bash

# Full system upgrade
sudo apt update && sudo apt dist-upgrade -y

# Clear apt cache
sudo apt clean

# Remove orphaned Packages
sudo apt autoremove

echo "Script ended (0)"
