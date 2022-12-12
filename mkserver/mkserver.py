#!/usr/bin/env python3
#
# Installs a Minecraft server 
# Person in Charge: Max Bossing [Max#2307, info@maxbossing.de]

import requests
import argparse
import stat
import datetime
from os import chdir, getcwd, chmod, makedirs
from shutil import copy
from datetime import datetime

# TODO : Add Progress Bar while downloading server.jar
# TODO : Add flag to change server.jar name
# TODO : Add automated eula accepting


# Globals

software = ['paper', 'bungeecord', 'velocity']

# Methods

######################################################################################
# Log method, logs message with some other information to logfile and writes to stdout
# ARGUMENTS:
#   msg (message to be logged)
######################################################################################
def log(msg: str):
    now = datetime.now()
    with open('mkserver.log', 'a+') as file:
        file.write(f'[{now.strftime("%y-%m-%d %H:%M:%S")}] {msg}\n')
    print(f'[{datetime.now().strftime("%y-%m-%d %H:%M:%S")}] {msg}')

####################################################
# Error method, pipes input to log with ERROR! added
# ARGUMENTS:
#   msg (error message)
####################################################
def error(msg: str):
    log('ERROR! ' + msg)
    log('operation aborted (1)')
    exit()

##############################################################################
# Downloads newest paper build
# If nothing specified, it will download the newest 1.19.2 build to Server.jar
# ARGUMENTS:
#   VERSION (minecraft version, optional)
#   NAME (file name paper should be saved under, optional)
##############################################################################
def download_paper(VERSION: str ='1.19.3', NAME: str ='server.jar'):

    # get all builds of specified version 
    builds = requests.get(f"https://papermc.io/api/v2/projects/paper/versions/{VERSION}").json()['builds']

    # use newest Build
    BUILD = builds[len(builds)-1]

    download_url = f'https://papermc.io/api/v2/projects/paper/versions/{VERSION}/builds/{BUILD}/downloads/paper-{VERSION}-{BUILD}.jar'

    # download newest build to specified name   
    r = requests.get(download_url)
    with open(NAME, 'wb+') as file:
        file.write(r.content)

######################################################################
# Downloads newest Bungeecord build
# If nothing specified it will download the newest build to Server.jar
# ARGUMENTS:
#   NAME (file name bungeecord should be saved under, optional)
######################################################################
def download_bungeecord(NAME='server.jar'):

    # bungeecords link to latest artifact is always the same
    download_url = 'https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar'
    
    # download newest build to specified name   
    r = requests.get(download_url)
    with open(NAME, 'wb+') as file:
        file.write(r.content)

##############################################################################
# Downloads newest Velocity build
# If nothing specified, it will download the newest 3.1.2-SNAPSHOT build to Server.jar
# ARGUMENTS:
#   VERSION (velocity Version, optional)
#   NAME (file name paper should be saved under, optional)
##############################################################################
def download_velocity(VERSION: str = '1.3.2-SNAPSHOT', NAME: str = 'server.jar') :

    # get all builds of specified version 
    builds = requests.get(f"https://papermc.io/api/v2/projects/velocity/versions/{VERSION}").json()['builds']

    # use newest Build
    BUILD = builds[len(builds)-1]

    download_url = f'https://papermc.io/api/v2/projects/velocity/versions/{VERSION}/builds/{BUILD}/downloads/velocity-{VERSION}-{BUILD}.jar'

    # download newest build to specified name   
    r = requests.get(download_url)
    with open(NAME, 'wb+') as file:
        file.write(r.content)


def main():

    # Argument parsing
    parser = argparse.ArgumentParser(
                        prog = 'mkserver',
                        description = 'setup a minecraft server')

    parser.add_argument('name')                    
    parser.add_argument('path')
    parser.add_argument('software', choices=software)
    parser.add_argument('--min', type=int, required=True, help='Minimal amount of RAM')
    parser.add_argument('--max', type=int, required=True, help='Maximal amount of RAM')
    args = parser.parse_args()

    log(f'Starting server creation. Parameters: [name : {args.name}, path : {args.path}, software : {software}, minimal RAM : {args.min}, maximal RAM : {args.max} ')


    # stores current workind directory and changes to the path specified
    wd = getcwd()

    try:
        makedirs(args.path)
        log ('created server folder')
    except:
        error('failed to create server folder')

    chdir(args.path)

    # downloads needed server software

    try:
        log('downloading Server.jar...')
        if args.software == 'paper':
            download_paper()
        elif args.software == 'bungeecord':
            download_bungeecord()
        elif args.software == 'velocity':
            download_velocity()
        log('Server.jar finished downloading')
    except:
        error('failed to download server.jar')

    # write start.sh

    try:
        log('creating start.sh')
        with open('start.sh', 'w+') as file:
            file.write(f'#!/bin/bash\nscreen -S {args.name} java -Xmx{args.max} -Xms{args.max} -jar server.jar --nogui')
    except:
        error('failed to create start.sh')

    chdir(wd)
    log('operation completed (0)')
    

main()
         
    

