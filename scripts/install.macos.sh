#!/bin/bash
#######################################################
##
## description: used for mac dev env setup
##
#######################################################

install_homebrew() {
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    export HOMEBREW_NO_AUTO_UPDATE=true
    echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >> ~/.bashrc

    ## change brew git repo
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git
    #brew update
    echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bashrc
}

install_basic() {
    brew install ctags cscope git cloc sloccount dos2unix subversion
    brew install vim tmux tree wget
    brew install openconnect
}

install_android() {
    brew install caskroom/cask/android-platform-tools
}

install_db() {
    brew install redis
    brew install postgresql
}

install_node() {
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    source ~/.bashrc
    nvm install --lts
}

change_route() {
    sudo route add -net 10.0.0.0/8 -iface en0
    netstat -nr|grep en0
}

bugfix() {
    ## inactive cmdline tool: xrun
    xcode-select --install
}

#######################################################

install_homebrew
install_basic
install_android
install_db
install_node

