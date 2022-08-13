#!/usr/bin/env bash

# get user input
read -p "Path to public key : " keypath

read -p "server ip : " ip

read -p "username of account on server : " username

# copy ssh key to server
ssh-copy-id -i $keypath $username@$ip

echo "Script ended (0)"
