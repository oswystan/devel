###############################################################################
##
##       filename: xz.sh
##    description: decompress and compress all file formats
##        created: 2025/04/02
##         author: wystan
##
###############################################################################

## decompress files
function x() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file1> ..." && return 1
  while [ $# -ge 1 ]; do
    [[ ! -f $1 ]] && echo "ERROR: $1 not found" && shift && continue
    case $1 in
      *.tar.gz|*.tgz)
        tar xvf "$1"
        ;;
      *.tar.bz2)
        tar jxvf "$1"
        ;;
      *.tar.xz)
        tar Jxvf "$1"
        ;;
      *.zip)
        unzip "$1"
        ;;
      *.rar)
        unrar x "$1"
        ;;
      *.7z)
        7z x "$1"
        ;;
      *)
        echo "ERROR: unknown type for $1"
        ;;
    esac;
    shift
  done
}

## default compression to tar.xz
function z() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file>" && return 1
  tar Jcvf "${1}.tar.xz" "${1}"
}

function z.bz2() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file>" && return 1
  tar jcvf "${1}.tar.bz2" "${1}"
}

function z.gz() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file>" && return 1
  tar zcvf "${1}.tar.gz" "${1}"
}

function z.7z() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file>" && return 1
  7z a "${1}.7z" "${1}"
}

function z.zip() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file>" && return 1
  zip -r "${1}.zip" "${1}"
}

function z.rar() {
  [[ $# -lt 1 ]] && echo "usage: $0 <file>" && return 1
  rar a "${1}.rar" "${1}"
}

###############################################################################
