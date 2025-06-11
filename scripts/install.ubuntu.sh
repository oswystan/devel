#!/bin/bash

set -e

sudo apt-get update

install_basic() {
  sudo apt-get install -y vim cscope ctags gcc g++
  sudo apt-get install -y git subversion sloccount tmux jq zip unzip
  sudo apt-get install -y manpages-posix-dev
  # sudo apt-get install -y gnome-tweak-tool #unity-tweak-tool
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

install_nvim() {
  local name="nvim-linux-x86_64" #nvim-linux-arm64
  wget "https://github.com/neovim/neovim/releases/download/stable/${name}.tar.gz"
  tar xvf "${name}.tar.gz"
  sudo mv ${name} /opt/nvim
  sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/
}

install_node() {
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
  source "$HOME/.zshrc"
  nvm install --lts
}

#####################################
##
## main
##
#####################################
# install_basic
#install_cloc
#dl_pkg
install_nvim
