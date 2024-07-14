#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

rm -Rf $NVM_DIR ~/.npm ~/.bower
echo "removed NVM NPM and bowser folders. 
You might want to reload your terminal."

# Remove the specific nwm lines from the .bashrc file
sed -i '/export NVM_DIR="\$HOME\/.nvm"/d' ~/.bashrc
sed -i '/\[ -s "\$NVM_DIR\/nvm.sh" \] && \\\. "\$NVM_DIR\/nvm.sh"  # This loads nvm/d' ~/.bashrc
sed -i '/\[ -s "\$NVM_DIR\/bash_completion" \] && \\\. "\$NVM_DIR\/bash_completion"  # This loads nvm bash_completion/d' ~/.bashrc

# delete service user
sudo userdel myapp -r

# delete log directory
read -p "Please provide desired relative directory name for log folder to remove! " provided_dir
rm -Rf /var/log/$provided_dir
