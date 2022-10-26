#!/usr/bin/python3

#==Imports==#
from datetime import datetime
from pacman import install, upgrade,refresh
from sys import argv
from colorama import Fore, Back, Style
from os import getuid

###====Functions====###

#==Logging function==#
def log(msg):
    file = open('setup.log', 'at')
    file.write('[' + str(datetime.now()) + '] ' + msg + '\n')
    file.close()


#==Error Function==#
def Error(stacktrace):
    print(Fore.RED + Style.BRIGHT +'Error: ' + Style.NORMAL + stacktrace)
    log('ERROR: ' + stacktrace)
    print('script exited (1)')
    exit(1)

#==Install packages==#
def Install_packages():
    file = open('pkglist.txt', 'rt')
    packages = []
    for item in file:
        packages.append(item[:-1])
    install(packages)


#==Prints help screen==#
def Help():
    print(Style.BRIGHT + 'setup.py - setup a fresh GNU/Linux Arch Machine for production/Development use' + Style.NORMAL)
    print(Style.BRIGHT + 'Usage:' + Style.NORMAL)
    print('     setup.py [argument]')
    print(Style.BRIGHT + 'Arguments:' + Style.NORMAL)
    print('     --help -h    Prints this Screen')
    print('     --init -i    Starts the setup')

def init():
    
    log(Fore.MAGENTA + 'Script initiated')

    # system update
    
    log('update initiated')
    print(Fore.MAGENTA + 'Update Initiated')

    try:
        refresh()
        upgrade()
    except:
        Error('failed to update System')
    
    log('update completed')
    print(Fore.GREEN + 'Update completed')

    # install required packages

    log('package install initiated')
    print(Fore.MAGENTA + 'package install initiated')

    try:
        file = open('pkglist.txt', 'rt')
        packages = []
        for item in file:
            packages.append(item[:-1])
        install(packages)
    except:
        Error('Failed to install packages')
    
    log('package install completed')
    print(Fore.GREEN + 'package install completed')

    log('script exited (0)')
    exit(0)



##====Startup code====##
if len(argv) != 2:
    Help()
    exit()
if argv[1] == '-i' or '--init':
    if getuid() == 0:
        init()
    else:
        Error('user not Root')
        
if argv[1] == '-h' or '--help':
    Help() 


    