###############################################################################
##
##       filename: macos.sh
##    description:
##        created: 2025/06/13
##         author: ticktechman
##
###############################################################################

function macos.bundleid() {
  for one in "$@"; do
    local bid="$(/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' "$one/Contents/Info.plist")"
    printf "%-60s : $bid\n" "$one"
  done
}

function macos.logout() {
  osascript -e 'tell application "System Events" to log out'
}

###############################################################################
