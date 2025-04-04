###############################################################################
##
##       filename: nerdfont.sh
##    description: nerdfont patching
##        created: 2025/04/04
##         author: wystan
##
###############################################################################

function nerdfont.install() {
  # sudo apt install -y fontforge && \
  brew install fontforge && \
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip && \
  unzip -d fontpatcher FontPatcher.zip
}

function nerdfont.build() {
  ! command -v fontforge && echo "install fontforge first" && return 1
  [[ $# -ne 1 ]] && echo "usage: $0 <font-file>" >&2 && return 1
  [[ ! -f "$1" ]] && echo "can not read $1" >&2 && return 1

  fontforge --script fontpatcher/font-patcher --complete "$1"
}

###############################################################################
