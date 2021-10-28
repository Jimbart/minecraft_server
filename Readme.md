# This repository contains scripts for maintaining a Minecraft server running on Ubuntu

## Requirements:
The scripts assume your directory structure is as follows:  
Base application directory:  
    /app/minecraft  
Application root directory:  
    /app/minecraft/server  
Backup directory:  
    /app/minecraft/backups  
Game updates download directory:  
    /app/minecraft/downloaded_updates  

### All mainetnance scripts are stored in the Base Application directory and are executed from there.

## Script to update your minecraft server:
_**auto_update_minecraft_version.sh**_

This script will kill your running game and automatically take a backup and put it in your backup directory. 
It will then ask the download link of the latest game version, you have to get it from this site and copy the link address from there and paste it in the script prompt.
Press enter and it will continue to unpack everything and you just need to startup your sever afterwards.

## (For AWS) Script to backup your Minecraft server application files and shutdown the EC2 instance
_**stopEc2Instance.sh**_

There are some pre tasks required to make this script work. Please refer to my other blog [post](https://jimbart.wordpress.com/2021/10/25/auto-start-or-shutdown-your-ec2-instances/) about it.
