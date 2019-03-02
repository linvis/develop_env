#!/bin/bash

function macOS_install()
{
    brew install zsh
}

function linux_install()
{
    sudo cp /etc/apt/sources.list /etc/apt/backup_sources.list
    sudo mv ./debian_sources.list /etc/apt/sources.list
    sudo apt update

    # install ssh-server
    sudo apt install openssh-server
    sudo /etc/init.d/ssh start
    
    # install zsh
    sudo apt -y install zsh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    # fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    cp ./.zshrc ~/.zshrc

    # terminal markdown view
    sudo apt -y python3-pip
    sudo pip3 install mdv
}

OS=$(uname)
if [ $OS == "Darwin" ];then
    macOS_install
elif [ $OS == "Linux" ];then
    linux_install
fi
