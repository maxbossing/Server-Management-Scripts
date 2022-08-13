#!/bin/env bash

# read input
read -p "Username : " username

read -p "Name : " name 

read -sp "password : " userpasswd

# add user 
sudo useradd -c $name -m $username

# set password of user
sudo echo "$username:$password" | sudo chpasswd --encrypted

echo "Script ended (0)"
