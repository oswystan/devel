#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2018 wystan
##
##       filename: git-unrelease.sh
##    description:
##        created: 2018-09-16 11:02:17
##         author: wystan
##
###########################################################################

error() {
    echo "ERROR: $*"
    exit 1
}

if [[ $# -lt 1 ]]; then
    error "usage: git unrelease <branch>"
fi

git push origin --delete release/$1
git push origin :$1
git tag -d $1

###########################################################################
