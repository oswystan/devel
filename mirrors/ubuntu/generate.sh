#!/usr/bin/env bash
###############################################################################
##
##       filename: generate.sh
##    description:
##        created: 2025/07/01
##         author: ticktechman
##
###############################################################################

function generate_source_list() {
  cat <<EOF >sources.list
deb https://mirrors.aliyun.com/ubuntu/ ${1} main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ ${1} main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ ${1}-security main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ ${1}-security main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ ${1}-updates main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ ${1}-updates main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ ${1}-backports main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ ${1}-backports main restricted universe multiverse

EOF
}

function help() {
  cat <<EOF

  usage: $(basename $0) <name>
    plucky - 25.04
    noble  - 24.04
    lunar  - 23.04
    jammy  - 22.04

EOF
}

[[ $# -eq 1 ]] || help

generate_source_list $1
###############################################################################
