#!/bin/bash

sudo apt-get update

install_basic()
{
    sudo apt-get install -y vim cscope ctags gcc g++
    sudo apt-get install -y git subversion sloccount tmux jq
    sudo apt-get install -y manpages-posix-dev
    sudo apt-get install -y gnome-tweak-tool #unity-tweak-tool
    sudo apt-get install -y meld
}

dl_pkg() {
    wget http://dl2.xmind.cn/xmind-8-update5-linux.zip
}

install_cloc() {
    sudo wget https://github.com/AlDanial/cloc/releases/download/v1.76/cloc-1.76.pl -O /usr/bin/cloc && sudo chmod +x /usr/bin/cloc
}

install_android() {
    sudo apt install -y android-platform-tools-base
}


#####################################
##
## main
##
#####################################
install_basic
#install_cloc
#dl_pkg
