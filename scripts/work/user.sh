#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2019 wystan
##
##       filename: user.sh
##    description:
##        created: 2019-06-25 23:23:08
##         author: wystan
##
###########################################################################

[ $(id -u) -eq 0 ] && SUDO="" || SUDO="sudo"

function user.add() {
    if [[ $# -ne 1 ]]; then
        echo "usage: $FUNCNAME <username>"
        return 1
    fi

    $SUDO useradd -m -s /bin/bash -d /home/$1 $1 && \
    echo -e "$1@123\n$1@123" | $SUDO passwd $1
}

function user.del() {
    if [[ $# -ne 1 ]]; then
        echo "usage: $FUNCNAME <username>"
        return 1
    fi
    $SUDO userdel -r -f $1
}

function user.ls() {
    $SUDO less /etc/passwd
}

function user.sudo() {
    if [[ $# -ne 1 ]]; then
        echo "usage: $FUNCNAME <username>"
        return 1
    fi

    $SUDO echo "$1 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
}
function user.sudo.del() {
    if [[ $# -ne 1 ]]; then
        echo "usage: $FUNCNAME <username>"
        return 1
    fi

    $SUDO sed -i "s/^$1.*NOPASSWD.*ALL$//g" /etc/sudoers
}

###########################################################################
