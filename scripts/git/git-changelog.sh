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
usage() {
  echo "usage: git changelog <commit or tag>"
  exit 1
}

_prefixes="feature fix doc refact"

[[ $# -ne 1 ]] && usage

now=$(date +'%Y-%m-%dT%TZ%z')
from=$1
echo changelog:
echo "-------------"
echo "datetime: $now"
echo "baseline: $from"
echo ""

for one in ${_prefixes}; do
  echo "$one:"
  echo "-------------"
  git --no-pager log "${from}..HEAD" --grep="^${one}:" --pretty='%s'
  echo ""
done

###########################################################################
