#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2018 wystan
##
##       filename: git-release.sh
##    description:
##              INSTALL - cp git-release.sh /usr/local/bin/git-release
##              USAGE   - git release
##              NOTICE  - before run command, make sure you have bump up
##                        the version in Makefile
##        created: 2018-08-29 18:20:40
##         author: wystan
##
###########################################################################

error() {
    echo "ERROR: $*"
    exit 1
}

version=$(make version 2>/dev/null)
[[ -z $version ]] && error "fail to get version"
branches=$(git branch -r|grep -v "origin/HEAD")
is_exist=$(echo $branches|grep "\<origin/release/$version\>")
[[ ! -z $is_exist ]] && error "already have ${version}"

branch="release/$version"
git tag "$version"
git push origin master:${branch}
git push origin "$version"

###########################################################################
