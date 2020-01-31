#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2018 wystan
##
##       filename: github_backup.sh
##    description:
##        created: 2018-07-02 23:34:41
##         author: wystan
##
###########################################################################

github.repo.ls() {
    curl -s -X GET "https://api.github.com/users/oswystan/repos?per_page=200"|jq -r '.[].name'
}

github.repo.clone() {
    echo "===> $1"
    git clone --mirror https://github.com/oswystan/$1 repo/$1.git
    [[ $? -ne 0 ]] && exit 1
}

github.repo.backup() {
    repos=$(github.repo.ls);
    for one in ${repos}
    do
        github.repo.clone $one
    done
}

github.check() {
    jq=$(which jq)
    [[ -z ${jq} ]] && echo "NO jq found" && exit 1;
}

###########################################################################
