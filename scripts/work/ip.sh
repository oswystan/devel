#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2021 wystan
##
##       filename: ip.sh
##    description:
##        created: 2021-04-06 20:10:50
##         author: wystan
##
###########################################################################

ip.location() {
    if [[ $# -le 0 ]]; then
        echo "usage: $FUNCNAME <public-ip>..."
        return 1
    fi
    for one in $*
    do
        curl https://ip.taobao.com/outGetIpInfo?ip=$one 2>/dev/null | jq -c '.data|{ip,country,region,city,isp}'
        sleep 0.75
    done
}

###########################################################################
