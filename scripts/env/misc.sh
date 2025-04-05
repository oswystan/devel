###############################################################################
##
##       filename: misc.sh
##    description: misc utils
##        created: 2025/04/02
##         author: wystan
##
###############################################################################

###################################
## highlight a file and
## copy the rich text to system clipboard
## deps: highlight
###################################
function m.hl() {
  [[ $# -ne 1 ]] && {
    echo "Usage: hl <file>"
    return 1
  }
  highlight -O rtf --font 'mplus Nerd Font' --font-size 24 --style molokai "$1" | pbcopy
}

##################################
## setup a http server using python
##################################
function m.http.server() {
  python -m http.server 80
}

## whether
function m.whether() {
  curl -s "wttr.in/$(curl -s http://myip.ipip.net|awk '{print $5}')?lang=zh-cn"
}

function m.randpass() {
  openssl rand -base64 21
}

###############################################################################
