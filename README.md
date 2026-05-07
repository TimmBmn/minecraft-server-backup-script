# Minecraft Server Backup Script
If you are renting a minecraft server there is a good chance it has a sftp interface.
This script takes advantage of this and uses it to download and zip your server to then backup it somewhere

## Setup
1. make sure you have the [requirements](#requirements) installed
2. rename the `.env.example` to `.env` and fill in the values
3. (optional) Put this script in a cron job to create regular backups (backups will have to be deleted manually for now)

## Requirements
1. Linux
2. sshpass
```sudo apt-get install sshpass```  

