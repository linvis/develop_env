#!/bin/bash

function macOS_install()
{
    brew install tmux
}

function linux_install()
{
    sudo apt-get update
    sudo apt -y install libevent-dev ncurses-dev automake autoconf pkg-config
    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    ./configure && make
    sudo make install
    cd ..
    cp .tmux.conf ~/
    rm -rf tmux

    # install plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

OS=$(uname)
if [ $OS == "Darwin" ];then
    macOS_install
elif [ $OS == "Linux" ];then
    linux_install
fi
