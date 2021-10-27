#!/bin/sh

BASE_DIR='/app/minecraft'

cd ${BASE_DIR}

# Shutdown Minecraft Server
minecraftPID=`ps -ef | egrep -i 'mcs|screen' | grep -v grep | awk '{print $2}'`
echo " "
echo "Current Mincraft server PID: ${minecraftPID}"
sudo kill -9 ${minecraftPID}
echo " "
echo "Mincraft server killed."
echo " "
cp server/server.properties .

# Backup Minecraft Server
dateToday=`date +%d%b%Y`
sudo tar -cvf server_backup_${dateToday}.tar server
gzip server_backup_${dateToday}.tar
sudo mv server_backup_${dateToday}.tar.gz ${BASE_DIR}/backups/.

# Download
#dlLatestVersionLink=`lynx -dump -hiddenlinks=listonly https://www.minecraft.net/en-us/download/server/bedrock/ | grep -i zip | grep bin-l                        inux | awk '{print $2}'`
#echo "Latest download version url link: ${dlLatestVersionLink}"
echo " "
echo "Please eneter download link:"
read dlLatestVersionLink
echo " "
echo "Downloading:"
wget ${dlLatestVersionLink}
echo " "
sudo cp bedrock*zip ${BASE_DIR}/server/.
sudo mv bedrock*zip ${BASE_DIR}/downloaded_updates/.

# Unzip downloaded updates
cd ${BASE_DIR}/server
zipFileName=`ls bedrock*zip`
sudo unzip -o ${zipFileName}
sudo cp ../server.properties .
sudo rm -f ${zipFileName}

# Manually start Minecraft Server using Screen
sudo chmod -R 755 ./

echo " "
echo "Run the following command to start the server via screen (Ctrl A+D) to exit screen terminal."
echo "cd server"
echo "sudo screen -s mcs ./bedrock_server"

