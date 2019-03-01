#!/bin/bash

function macOS_install()
{
}

function linux_install()
{
    sudo cp /etc/apt/source.list /etc/apt/backup_source.list
    sudo mv ./debian_source.list /etc/apt/source.list
    sudo apt update

    # install ssh-server
    sudo apt install openssh-server
    sudo /etc/init.d/ssh start
    
    # install zsh
    sudo apt install -y zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

OS=$(uname)
if [ $OS == "Darwin" ];then
    macOS_install
elif [ $OS == "Linux" ];then
    linux_install
fi
