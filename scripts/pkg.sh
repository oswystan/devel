#!/usr/bin/env bash
###############################################################################
##
##       filename: pkg.sh
##    description:
##        created: 2025/04/01
##         author: wystan
##
###############################################################################
function pkg() {
  local cmd=$1
  shift

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &>/dev/null; then
      case "$cmd" in
        i) sudo apt install -y "$@" ;;
        r) sudo apt remove -y "$@" ;;
        s) apt search "$@" ;;
        c) sudo apt autoclean && sudo apt autoremove -y ;;
        u) sudo apt update && sudo apt upgrade -y ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v yum &>/dev/null; then
      case "$cmd" in
        i) sudo yum install -y "$@" ;;
        r) sudo yum remove -y "$@" ;;
        s) yum search "$@" ;;
        c) sudo yum clean all ;;
        u) sudo yum update -y ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v dnf &>/dev/null; then
      case "$cmd" in
        i) sudo dnf install -y "$@" ;;
        r) sudo dnf remove -y "$@" ;;
        s) dnf search "$@" ;;
        c) sudo dnf clean all ;;
        u) sudo dnf upgrade -y ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v pacman &>/dev/null; then
      case "$cmd" in
        i) sudo pacman -S --noconfirm "$@" ;;
        r) sudo pacman -Rns --noconfirm "$@" ;;
        s) pacman -Ss "$@" ;;
        c) sudo pacman -Sc && sudo pacman -Rns "$(pacman -Qdtq)" ;;
        u) sudo pacman -Syu --noconfirm ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v zypper &>/dev/null; then
      case "$cmd" in
        i) sudo zypper install -y "$@" ;;
        r) sudo zypper remove -y "$@" ;;
        s) zypper search "$@" ;;
        c) sudo zypper clean --all ;;
        u) sudo zypper refresh && sudo zypper update -y ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v emerge &>/dev/null; then
      case "$cmd" in
        i) sudo emerge "$@" ;;
        r) sudo emerge --deselect "$@" ;;
        s) emerge --search "$@" ;;
        c) sudo emerge --depclean ;;
        u) sudo emerge --sync && sudo emerge -uDU @world ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v nix-env &>/dev/null; then
      case "$cmd" in
        i) nix-env -i "$@" ;;
        r) nix-env -e "$@" ;;
        s) nix-env -qa "$@" ;;
        c) nix-collect-garbage -d ;;
        u) nix-channel --update && nix-env -u '*' ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    else
      echo "Unsupported Linux package manager."
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew &>/dev/null; then
      case "$cmd" in
        i) brew install "$@" ;;
        r) brew uninstall "$@" ;;
        s) brew search "$@" ;;
        c) brew cleanup ;;
        u) brew update && brew upgrade ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    elif command -v port &>/dev/null; then
      case "$cmd" in
        i) sudo port install "$@" ;;
        r) sudo port uninstall "$@" ;;
        s) port search "$@" ;;
        c) sudo port clean --all installed ;;
        u) sudo port selfupdate && sudo port upgrade outdated ;;
        *) echo "Unknown command: $cmd" ;;
      esac
    else
      echo "Unsupported macOS package manager."
    fi
  else
    echo "Unsupported OS: $OSTYPE"
  fi
}

alias pkg.i="pkg i"
alias pkg.u="pkg u"
alias pkg.s="pkg s"
alias pkg.r="pkg r"
alias pkg.c="pkg c"
###############################################################################
