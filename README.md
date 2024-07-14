# Linux Basics on Ubuntu & Mint

This repo contains mostly POSIX compliant shell scripts written with vim in GNOME Terminal

Linux Distros used for Development were Ubuntu Desktop and a Mint VM.

## Setup

Pull the repository locally by running 
```
  git clone https://github.com/hangrybear666/02-devops-bootcamp__linux_basics.git
```

## Usage

1.  Installing Headless Java 17 Shell Script

    To install java on your system run `./install-java-17.0.11.sh`. After installation, the script checks if a major version greater than 11 exists on your system.

2. List running processes sorted via user-input

    To list running processes of the current user run `./list-user-processes.sh`.

    It asks for user-input, which you can provide:

```
  Enter sort order (3 for cpu, 4 for ram):
  Enter number of processes to be displayed:
```

3. To install node and npm via Node Version Manager (NVM) and run a server.js file in the background

    To install nvm (which then pulls node and npm to the service user home directory) run  `sudo ./install-node-npm-app.sh`

```
    Please provide desired relative directory name for log files!
```
4. To kill the running node server

    The Process ID (PID) is logged on server startup. Simply run `sudo kill <PID>` to terminate the node server.

5. To remove the service user, log directory and installed depencencies

    Run `sudo ./remove-nvm-npm.sh` to clean up your system and remove prior node, npm, nvm and service user alterations.
    
```
Please provide desired relative directory name for log folder to remove! 
```
