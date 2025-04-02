###############################################################################
##
##       filename: exif.sh
##    description: clear && dump exif tags of jpeg file
##        created: 2025/04/01
##         author: ticktechman
##
###############################################################################

## clear all exif tags
exif.clear() {
  exif.check || return 1
  [[ $# -lt 1 ]] && {
    echo "Usage: ${FUNCNAME[0]:-${funcstack[1]}} <file1> ..."
    return 1
  }
  local one=""
  for one in "$@"; do
    [[ -f "$one" ]] && exiftool -all= "$one" || echo "can not find $one"
  done
  exiftool -all= "$1"
}

## dump jpeg exif tags
exif.dump() {
  exif.check || return 1
  [[ $# -lt 1 ]] && {
    echo "Usage: ${FUNCNAME[0]:-${funcstack[1]}} <file1> ..."
    return 1
  }

  local one=""
  for one in "$@"; do
    [[ -f "$one" ]] && exiftool "$one" || echo "can not find $one"
  done
}

function exif.check() {
  ! command -v exiftool &>/dev/null && {
    echo "Install exiftool first";
    return 1;
  }
  return 0;
}

###############################################################################
