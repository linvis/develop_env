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

OS=$(uname)
if [ $OS == "Darwin" ];then
    macOS_install
elif [ $OS == "Linux" ];then
    echo "linux"
fi
