#!/bin/bash

rm -Rf $NVM_DIR ~/.npm ~/.bower
echo "removed NWM NPM and bowser folders. 
You might want to reload your terminal."

# Remove the specific nwm lines from the .bashrc file
sed -i '/export NVM_DIR="\$HOME\/.nvm"/d' ~/.bashrc
sed -i '/\[ -s "\$NVM_DIR\/nvm.sh" \] && \\\. "\$NVM_DIR\/nvm.sh"  # This loads nvm/d' ~/.bashrc
sed -i '/\[ -s "\$NVM_DIR\/bash_completion" \] && \\\. "\$NVM_DIR\/bash_completion"  # This loads nvm bash_completion/d' ~/.bashrc
