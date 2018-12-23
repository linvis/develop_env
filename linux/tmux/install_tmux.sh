#!/bin/bash

sudo apt-get update
sudo apt -y install libevent-dev ncurses-dev automake autoconf pkg-config
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install
cp .tmux.conf ~/
