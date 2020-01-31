#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2018 wystan
##
##       filename: git-changelog.sh
##    description:
##        created: 2018-09-17 22:28:55
##         author: wystan
##
###########################################################################

error() {
    echo "ERROR: $*"
    exit 1
}

[[ $# -ne 1 ]] && error "usage: git changelog <tag>"

now=$(date +'%Y-%m-%dT%TZ%z')
from=$1
echo changelog:
echo "-------------"
echo "datetime: $now"
echo "baseline: $from"
echo ""
echo "new-features:"
echo "-------------"
git log ${from}..HEAD --grep="feature:" --oneline

echo ""
echo "bugfix:"
echo "-------------"
git log ${from}..HEAD --grep="bugfix:" --oneline
echo ""

###########################################################################
