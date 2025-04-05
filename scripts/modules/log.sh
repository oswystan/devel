#!/usr/bin/env bash
###############################################################################
##
##       filename: log.sh
##    description:
##        created: 2025/03/17
##         author: ticktechman
##
###############################################################################

## 0-debug, 1-info, 2-warning, 3-error, 4-fatal
g_log_level=1
g_log_tag=('D' 'I' 'W' 'E' 'F')
g_datecmd=$( [[ $(uname) == Darwin ]] && echo gdate || echo date )


function log() {
  local level=$1
  [[ $g_log_level -gt $level ]] && return 0
  shift
  local message
  message="[${g_log_tag[$level]}|$(${g_datecmd} +"%Y-%m-%dT%T.%3N%z")]$*"
  [[ $level -ge 3 ]] && echo -e "$message" >&2 ||  echo -e "$message"
}

function logd() { log 0 "$@"; }
function logi() { log 1 "$@"; }
function logw() { log 2 "$@"; }
function loge() { log 3 "$@"; }
function logf() { log 4 "$@"; }

function log.level() {
  [[ $# -eq 1 ]] && g_log_level=$1 || return "${g_log_level}"
}

function log.check() {
  ! command -v "${g_datecmd}" &>/dev/null && {
    echo "Install coreutils first";
    return 1;
  }
  return 0;
}

###############################################################################
