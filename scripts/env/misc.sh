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
function hl() {
  [[ $# -ne 1 ]] && {
    echo "Usage: hl <file>"
    return 1
  }
  highlight -O rtf --font 'mplus Nerd Font' --font-size 24 --style molokai "$1" | pbcopy
}

##################################
## setup a http server using python
##################################
function http.here() {
  python -m http.server 80
}

###############################################################################
