#!/usr/bin/env bash
###############################################################################
##                  Copyright (C) 2023 wystan
##
##       filename: disk.sh
##    description: use up disk free space
##        created: 2023/05/16
##         author: wystan
##
###############################################################################

## get free size of current partition
disk.free() {
    local sz="$(echo $(df -m .|tail -1)|cut -f4 -d' ')"
    echo ${sz}
}

## use up current partition
disk.occupy() {
    echo "==>start occupy disk..."
    local freesize=$(disk.free)
    local seq=0
    while ((freesize > 300)); do
        fn="out-${seq}.dat"
        dd if=/dev/urandom of=${fn} ibs=$((1024*1024)) count=100 > /dev/null 2>&1
        freesize="$(disk.free)"
        printf "%d\r" ${freesize}
        ((seq++))
    done
    echo ""
    echo "==>done."
}


###############################################################################
