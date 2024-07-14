#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# create log directory and set environment variable for server.js
read -p "Please provide desired relative directory name for log files! " provided_dir
if [ ! -d "/var/log/$provided_dir" ]
then
  mkdir /var/log/$provided_dir
  echo "LOG DIRECTORY CREATED IN $LOG_DIR"
fi
LOG_DIR="/var/log/$provided_dir"

# create service user
# -m creates empty home directory
# -s defines the shell. default is legacy /bin/sh
sudo useradd myapp -m #-s /bin/bash
sudo passwd -d myapp

# download Node Version Manager
runuser -l myapp -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash"
runuser -l myapp -c "export NVM_DIR="$HOME/.nvm" &&
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &&
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion""

#install node and npm
runuser -l myapp -c "nvm install 22"

# -O saves file to pwd with original file name
runuser -l myapp -c "curl -O https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz &&
mkdir bootcamp-node-envvars-project-1.0.0/ &&
tar xvf bootcamp-node-envvars-project-1.0.0.tgz -C bootcamp-node-envvars-project-1.0.0"

# change user permissions to use log directory
sudo chown myapp -R $LOG_DIR
sudo chgrp myapp -R $LOG_DIR
sudo chmod -R u+w $LOG_DIR

runuser -l myapp -c "cd bootcamp-node-envvars-project-1.0.0/package/ &&
export APP_ENV=dev &&
export DB_USER=myuser && 
export DB_PWD=mysecret &&
export LOG_DIR=$LOG_DIR &&
npm install &&
node server.js &"

sleep 2

# log running node process
echo "
RUNNING NODE PROCESS:"
ps aux | head -n 1
ps aux | grep server.js | grep node

echo "
to shutdown the node server run 'kill PID'"

# log whatever is running on port 3000
echo "
PORT 3000 IS RUNNING:"
netstat -ltnp | grep :3000
