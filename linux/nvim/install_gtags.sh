#!/bin/bash

function macOS_install()
{
    echo "macOS, use brew to install"
    # step 1, install global
    brew install global
    # step 2, install multiple language support for global
    sudo pip install pygments
    cp /usr/local/etc/gtags.conf $HOME/.config/nvim/.globalrc
}

function linux_install()
{
    echo "linux, apt version is too old, use source code to install"
    # sudo apt -y build-dep global
    # sudo apt -y install libncurses5-dev libncursesw5-dev
    sudo apt -y install python-pygments

    if [ ! -d ".cache" ]
    then
        mkdir .cache
    else
        sudo rm -rf .cache
        mkdir .cache
    fi

    cd .cache
    wget http://tamacom.com/global/global-6.6.3.tar.gz
    ret=$?
    if [ $ret == 0 ];then
        echo "download source code successfully, compile and install"
    else
        echo "download source code fail, exit"
        exit
    fi

    tar -zxvf global-6.6.3.tar.gz
    cd global-6.6.3
    ./configure --with-exuberant-ctags=/usr/bin/ctags
    make
    sudo make install

    cp /usr/local/share/gtags/gtags.conf $HOME/.config/nvim/.globalrc
    # sudo pip install pygments

    cd ../
    rm -rf .cache
}

OS=$(uname)
if [ $OS == "Darwin" ];then
    macOS_install
elif [ $OS == "Linux" ];then
    linux_install
fi
