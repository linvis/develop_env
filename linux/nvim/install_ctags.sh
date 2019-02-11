#!/bin/bash


function macOS_install()
{
    # install universal ctags
    echo "macOS, use brew to install"
    brew unlink ctags
    brew install --HEAD universal-ctags/universal-ctags/universal-ctags
}

function linux_install()
{
    echo "linux, use source code to install"
    cd .cache
    git clone https://github.com/universal-ctags/ctags.git
    cd ctags
    ./autogen.sh
    ./configure
    make
    sudo make install
}

OS=$(uname)
if [ $OS == "Darwin" ];then
    macOS_install
elif [ $OS == "Linux" ];then
    linux_install
fi
