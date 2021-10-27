#! /bin/bash

export AWS_DEFAULT_REGION=ap-southeast-1
BASE_DIR=/app/minecraft

# Shutdown Minecraft Server
minecraftPID=`ps -ef | egrep -i 'mcs|screen' | grep -v grep | awk '{print $2}'`
echo " "
echo "Current Mincraft server PID: ${minecraftPID}"
sudo kill -9 ${minecraftPID}
echo " "
echo "Mincraft server killed."
echo " "
cp /app/minecraft/server/server.properties /app/minecraft/server.properties

# Backup Minecraft Server
dateToday=`date +%d%b%Y`
sudo tar -cvf server_backup_${dateToday}.tar /app/minecraft/server
gzip server_backup_${dateToday}.tar
sudo mv server_backup_${dateToday}.tar.gz ${BASE_DIR}/backups/.

# Delete backups older than 7 days
sudo find /app/minecraft/backups -mtime +7 -exec rm {} \;

# Stop server
aws ec2 stop-instances --instance-ids i-05315ea7b1b88832a
