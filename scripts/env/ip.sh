###############################################################################
##
##       filename: ip.sh
##    description: ip utils
##        created: 2025/04/04
##         author: wystan
##
###############################################################################

function ip.lan() {
  ifconfig | grep 'inet ' | awk '{print $2}' | grep -v "127.0.0"
}

function ip.wan() {
  curl -s ifconfig.me
  echo ""
}

function ip.location() {
  curl -s http://myip.ipip.net
}

###############################################################################
