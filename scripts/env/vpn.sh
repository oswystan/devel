###############################################################################
##
##       filename: vpn.sh
##    description: turn on / off vpn
##        created: 2025/04/02
##         author: wystan
##
###############################################################################

function vpn.on() {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
}

function vpn.off() {
  export https_proxy=
  export http_proxy=
  export all_proxy=
}

###############################################################################
