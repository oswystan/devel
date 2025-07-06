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

function macos.trackid() {
  curl -s "https://itunes.apple.com/lookup?bundleId=$1" | jq '.results[0].trackId'
}

## list all installed applications with trackid
function macos.apps() {
  while IFS= read -r -d '' APP_PATH; do
    APP_NAME="$(basename "$APP_PATH" .app)"

    BID=$(defaults read "$APP_PATH/Contents/Info" CFBundleIdentifier 2>/dev/null) || {
      printf "%40s : (no bundle id)\n" "$APP_NAME"
      continue
    }

    TRACK_ID=$(curl -s "https://itunes.apple.com/lookup?bundleId=${BID}" | jq -r '.results[0].trackId // empty')

    if [[ -n "$TRACK_ID" ]]; then
      printf "%40s : $TRACK_ID\n" "$APP_NAME"
    else
      printf "%40s : (NOT on app store)\n" "$APP_NAME"
    fi
  done < <(find /Applications -type d -name "*.app" ! -path "*/.app/*/*.app" -print0)
}

alias macos.colorfilter="shortcuts run 'color-filter'"

###############################################################################
