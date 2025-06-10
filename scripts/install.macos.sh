#!/bin/bash
#######################################################
##
## description: used for mac dev env setup
##
#######################################################

set -e
install_homebrew() {
  [ -z "$(which brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  export HOMEBREW_NO_AUTO_UPDATE=true
  echo 'export HOMEBREW_NO_AUTO_UPDATE=true' >>~/.zshrc

  ## change brew git repo
  cd "$(brew --repo)"
  git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
  cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
  git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

  #brew update
  echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >>"$HOME/.zshrc"
  source "$HOME/.zshrc"
}

install_basic() {
  brew install ctags cscope git cloc sloccount dos2unix tree wget vim tmux jq zip unzip p7zip
  brew install openconnect
  sudo gem install iStats
  ## install sizeup
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
  source "$HOME/.zshrc"
  nvm install --lts &&
    brew install pnpm || echo "==> FAIL"
}

bugfix() {
  ## inactive cmdline tool: xrun
  xcode-select --install

  ## clear passwd security policy
  sudo pwpolicy clearaccountpolicies
}

#######################################################

bugfix
install_homebrew
install_basic
install_android
# install_db
install_node
