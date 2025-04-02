###############################################################################
##
##       filename: webp.sh
##    description: convert other image format to webp or change webp to png
##        created: 2025/04/02
##         author: wystan
##
###############################################################################

function webp.from() {
  webp.check || return 1
  local target
  for one in "$@"; do
    target="${one}.webp"
    [[ -f "$one" ]] && cwebp "$one" -o "$target" >/dev/null 2>&1
  done
}

function webp2png() {
  webp.check || return 1
  for one in "$@"; do
    dwebp "$one" -o "${one}.png"
  done
}

function webp.check() {
  command -v cwebp &>/dev/null && command -v dwebp &>/dev/null || {
    echo "Install webp package first";
    return 1;
  }
  return 0
}

###############################################################################
