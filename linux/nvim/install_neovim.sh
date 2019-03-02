#!/bin/bash

if [ ! -d ".config_tmp" ]
then
    mkdir .config_tmp
else
    sudo rm -rf .config_tmp
    mkdir .config_tmp
fi

cd .config_tmp
# sudo apt install curl
wget https://github.com/neovim/neovim/archive/v0.3.4.tar.gz
ret=$?
if [ $ret == 0 ]
then
    echo "download neovim successfully"
else
    echo "download neovim fail"
    exit
fi

tar -xvf v0.3.4.tar.gz
cd neovim-0.3.4

# install prebuild-requirement
sudo apt update
sudo apt -y install gettext libtool autoconf automake cmake g++ pkg-config unzip libtool-bin ninja-build

sudo apt -y install python-pip 
sudo pip install --user --upgrade neovim

sudo apt -y install python3-pip
pip3 install --user --upgrade neovim
# check_python=`python -c 'import sys; print(sys.version_info[:])'`
# if [ ${check_python:1:2} == "2," ]
# then
    # echo "current python version is 2"
# elif [ ${check_python:1:2} == "3," ]
# then
    # echo "current python version is 3"
# else
    # echo "no python detection"
    # exit
# fi

make
sudo make install

cd ../../
sudo rm -rf .config_tmp

sudo apt -y install curl
./config_neovim.sh
cp init.vim ~/.config/nvim/
