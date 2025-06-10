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

install_omz() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
}

install_nerdfonts() {
  git clone --depth=1 https://github.com/oswystan/nerd-fonts .nerd-fonts
  cp -a .nerd-fonts/{*.ttf,*.otf} "$HOME/Library/Fonts/"
  rm -rf .nerd-fonts
}

install_basic() {
  brew install ctags cscope git cloc sloccount dos2unix tree wget vim tmux jq zip unzip p7zip coreutils
  brew install ruby golang lua
  brew install --cask brave-browser maczip iterm2 rar visual-studio-code orbstack
  brew install --cask iina wpsoffice rectangle snipaste hiddenbar keycastr localsend visual-studio-code netron
  sudo gem install iStats
}

install_nvim() {
  brew install neovim
  [[ ! -f "$HOME/.config" ]] && mkdir "$HOME/.config"
  git clone --depth=1 https://github.com/ticktechman/nvchad-start "$HOME/.config/nvim"
}

install_cpp() {
  brew reinstall llvm
  echo 'export PATH="/opt/homebrew/opt/llvm/bin:$PATH"' >>"$HOME/.zshrc"
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
  nvm install --lts
  brew install pnpm
}

bugfix() {
  ## inactive cmdline tool: xrun
  xcode-select --install

  ## clear passwd security policy
  sudo pwpolicy clearaccountpolicies
}

install_clashx() {
  wget https://github.com/ticktechman/green/releases/download/v0.1/green.tar.xz
  tar Jxvf green.tar.xz
}

#######################################################

bugfix
install_homebrew
install_basic
install_omz
install_nerdfonts
install_nvim
install_cpp
install_node
install_android
# install_clashx
# install_db
