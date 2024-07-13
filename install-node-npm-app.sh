#!/bin/bash

read -p "Please provide desired log directory: " provided_dir
if [ ! -d "$provided_dir" ]
then
  mkdir $provided_dir
fi

export LOG_DIR="$(pwd)/$provided_dir"

# download Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#install node and npm
nvm install 22

# -O saves file to pwd with original file name
curl -O https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz
mkdir bootcamp-node-envvars-project-1.0.0/
# extract archive to folder
tar xvf bootcamp-node-envvars-project-1.0.0.tgz -C bootcamp-node-envvars-project-1.0.0

# export ENV Vars
export APP_ENV=dev
export DB_USER=myuser 
export DB_PWD=mysecret

# enter folder
cd bootcamp-node-envvars-project-1.0.0/package/

# install dependencies
npm install
# start server in background
node server.js &

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
