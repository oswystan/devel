###############################################################################
##
##       filename: iina.sh
##    description:
##        created: 2025/09/05
##         author: ticktechman
##
###############################################################################

iina.clear() {
  defaults delete com.colliderli.iina iinaLastPlayedFilePath
  rm -rf "Library/Application Support/com.colliderli.iina/*"
}

###############################################################################
