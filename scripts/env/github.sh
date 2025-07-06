###############################################################################
##
##       filename: github.sh
##    description: github utils
##        created: 2025/04/02
##         author: wystan
##
###############################################################################

GITHUB_DIR="$HOME/usr/project/github"

function hub() {
  [[ $# -eq 0 ]] && cd "$GITHUB_DIR" && return 0

  echo "==>start clone $1..." &&
    git clone "git@oswystan.github.com:oswystan/$1" &&
    cd "$1" &&
    git config --local user.name "oswystan" &&
    git config --local user.email "oswystan@126.com" &&
    cd - &&
    echo "==>succ" || echo "==>fail!!"
}

function hub.ttm() {
  [[ $# -eq 0 ]] && cd "$GITHUB_DIR" && return 0

  echo "==>start clone $1..." &&
    git clone "git@ticktechman.github.com:ticktechman/$1" &&
    cd "$1" &&
    git config --local user.name "ticktechman" &&
    git config --local user.email "geek.wystan@gmail.com" &&
    cd - &&
    echo "==>succ" || echo "==>fail!!"
}

function hub.key() {
  ssh-keygen -t ed25519 -C "oswystan@github" -f oswystan.github
}

function hub.ttm.key() {
  ssh-keygen -t ed25519 -C "ticktechman@github" -f ticktechman.github
}

function hub.ttm.backup() {
  local dir
  dir="$(date +'%Y-%m-%d')"

  [[ -d "$dir" ]] || mkdir "$dir"
  cd "$dir"
  for one in eraser profiles dmg srt2fcpxml uploader mac-defaults; do
    echo "=> backup $one"
    git clone --mirror git@ticktechman.github.com:ticktechman/$one >/dev/null
    echo ""
  done
  cd -
}

###############################################################################
