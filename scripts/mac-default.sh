#!/usr/bin/env bash
###############################################################################
##
##       filename: mac-default.sh
##    description: mac defaults
##        created: 2023/07/18
##         author: ticktechman
##
###############################################################################

# defaults write com.apple.dock "tilesize" -int "48"
# defaults write com.apple.dock "autohide" -bool "true"
# defaults write com.apple.dock "show-recents" -bool "false"
# defaults write com.apple.dock "mineffect" -string "scale"
# defaults write com.apple.dock "static-only" -bool "false"
# killall Dock

# defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "3"
# defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# defaults write com.apple.finder "ShowPathbar" -bool "true"
# defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
# defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
# defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
# killall Finder

declare -a default_all_export=(
  ".GlobalPreferences"
  "com.apple.finder"
  "com.apple.dock"
  "com.apple.controlcenter"
  "com.googlecode.iterm2"
)

function dock.addapp() {
  app="${1}"

  if open -Ra "${app}"; then
    echo "$app added to the Dock."

    defaults write com.apple.dock persistent-apps -array-add "
    <dict>
        <key>tile-data</key>
        <dict>
            <key>file-data</key>
            <dict>
                <key>_CFURLString</key>
                <string>${app}</string>
                <key>_CFURLStringType</key>
                <integer>0</integer>
            </dict>
        </dict>
    </dict>"
  else
    echo "ERROR: Application $1 not found."
  fi
}

function dock.clear() {
  defaults delete com.apple.dock persistent-apps
  defaults delete com.apple.dock persistent-others
  killall Dock
}

function dock.kill() {
  killall Dock
}

function defaults.export() {
  [[ $# -lt 1 ]] && {
    echo "Usage: defaults.export domain1 [domain2 ...]"
    return 1
  }

  for one in "$@"; do
    echo "exporting $one"
    defaults export "${one}" - >"${one}.xml"
  done
}

function defaults.import() {
  [[ $# -lt 1 ]] && {
    echo "Usage: defaults.import xmlfile1 [xmlfile2 ...]"
    return 1
  }

  for one in "$@"; do
    local app="$(echo ${one//\.xml/})"
    echo "importing $app"
    defaults import "$app" - <"$one"
  done
}

function defaults.domains() {
  defaults domains | tr ',' '\n'
}
function defaults.domains.export() {
  for one in $(defaults.domains); do
    defaults.export "$one"
  done
}

function defaults.all.export() {
  for one in "${default_all_export[@]}"; do
    defaults.export "$one"
  done
}

function defaults.all.import() {
  for one in "${default_all_export[@]}"; do
    local fn="${one}.xml"
    ([[ -f "${fn}" ]] && defaults.import "${fn}") || echo "skip ${fn}"
  done
  killall Finder Dock iTerm2
}

#dock.clear
#dock.addapp '/System/Applications/System Settings.app'
#dock.kill

###############################################################################
