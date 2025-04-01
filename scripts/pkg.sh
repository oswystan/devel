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
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v yum &>/dev/null; then
            case "$cmd" in
                i) sudo yum install -y "$@" ;;
                r) sudo yum remove -y "$@" ;;
                s) yum search "$@" ;;
                c) sudo yum clean all ;;
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v dnf &>/dev/null; then
            case "$cmd" in
                i) sudo dnf install -y "$@" ;;
                r) sudo dnf remove -y "$@" ;;
                s) dnf search "$@" ;;
                c) sudo dnf clean all ;;
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v pacman &>/dev/null; then
            case "$cmd" in
                i) sudo pacman -S --noconfirm "$@" ;;
                r) sudo pacman -Rns --noconfirm "$@" ;;
                s) pacman -Ss "$@" ;;
                c) sudo pacman -Sc && sudo pacman -Rns $(pacman -Qdtq) ;;
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v zypper &>/dev/null; then
            case "$cmd" in
                i) sudo zypper install -y "$@" ;;
                r) sudo zypper remove -y "$@" ;;
                s) zypper search "$@" ;;
                c) sudo zypper clean --all ;;
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v emerge &>/dev/null; then
            case "$cmd" in
                i) sudo emerge "$@" ;;
                r) sudo emerge --deselect "$@" ;;
                s) emerge --search "$@" ;;
                c) sudo emerge --depclean ;;
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v nix-env &>/dev/null; then
            case "$cmd" in
                i) nix-env -i "$@" ;;
                r) nix-env -e "$@" ;;
                s) nix-env -qa "$@" ;;
                c) nix-collect-garbage -d ;;
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
                *) echo "Unknown command: $cmd" ;;
            esac
        elif command -v port &>/dev/null; then
            case "$cmd" in
                i) sudo port install "$@" ;;
                r) sudo port uninstall "$@" ;;
                s) port search "$@" ;;
                c) sudo port clean --all installed ;;
                *) echo "Unknown command: $cmd" ;;
            esac
        else
            echo "Unsupported macOS package manager."
        fi
    else
        echo "Unsupported OS: $OSTYPE"
    fi
}

function pkg.i() {
  pkg i "$@"
}

function pkg.r() {
  pkg r "$@"
}
function pkg.c() {
  pkg c "$@"
}
function pkg.s() {
  pkg s "$@"
}
###############################################################################
