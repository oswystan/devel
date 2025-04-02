###########################################################################
##                     Copyright (C) 2020 wystan
##
##       filename: rfc.sh
##    description:
##        created: 2020-03-29 11:36:56
##         author: wystan
##
###########################################################################

rfc() {
  local one=""
  if [[ $# -le 0 ]]; then
    echo "usage: ${FUNCNAME[0]:-${funcstack[1]}} <rfc-number> ..."
    return 1
  fi
  for one in "$@"
  do
    one="rfc${one}.txt"
    printf "%-18s: " "$one" && \
      wget "https://www.rfc-editor.org/rfc/$one" -O "$one" > /dev/null 2>&1 && \
      echo "succ" || echo "fail"
    done
}

###########################################################################
