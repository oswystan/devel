#!/usr/bin/env bash
###############################################################################
##
##       filename: app.sh
##    description:
##        created: 2023/11/27
##         author: ticktechman
##
###############################################################################

app.icons.ios() {
  declare -a _icons=(
    "Icon-App-1024x1024@1x.png|1024"
    "Icon-App-20x20@1x.png|20"
    "Icon-App-20x20@2x.png|40"
    "Icon-App-20x20@3x.png|60"
    "Icon-App-29x29@1x.png|29"
    "Icon-App-29x29@2x.png|58"
    "Icon-App-29x29@3x.png|87"
    "Icon-App-40x40@1x.png|40"
    "Icon-App-40x40@2x.png|80"
    "Icon-App-40x40@3x.png|120"
    "Icon-App-60x60@2x.png|120"
    "Icon-App-60x60@3x.png|180"
    "Icon-App-76x76@1x.png|76"
    "Icon-App-76x76@2x.png|152"
    "Icon-App-83.5x83.5@2x.png|167"
  )
  [[ $# -ne 1 ]] && echo "usage: app.icons.ios <svg-file>" && return 1
  for one in ${_icons[@]}; do
    local fn="$(echo $one | cut -f 1 -d '|')"
    local width="$(echo $one | cut -f 2 -d '|')"
    echo "$fn"
    rsvg-convert -b '#eeeeee' -w $width $1 >$fn
  done
}

app.icons.macos() {
  declare -a _icons=(
    "app_icon_1024.png|1024"
    "app_icon_128.png|128"
    "app_icon_16.png|16"
    "app_icon_256.png|256"
    "app_icon_32.png|32"
    "app_icon_512.png|512"
    "app_icon_64.png|64"
  )
  [[ $# -ne 1 ]] && echo "usage: app.icons.macos <svg-file>" && return 1
  for one in ${_icons[@]}; do
    local fn="$(echo $one | cut -f 1 -d '|')"
    local width="$(echo $one | cut -f 2 -d '|')"
    echo "$fn"
    rsvg-convert -w $width $1 >$fn
  done
}

app.icons.android() {
  declare -a _icons=(
    "mipmap-mdpi/ic_launcher.png|48"
    "mipmap-hdpi/ic_launcher.png|72"
    "mipmap-xhdpi/ic_launcher.png|96"
    "mipmap-xxhdpi/ic_launcher.png|144"
    "mipmap-xxxhdpi/ic_launcher.png|192"
  )
  [[ $# -ne 1 ]] && echo "usage: app.icons.android <svg-file>" && return 1
  for one in ${_icons[@]}; do
    local fn="$(echo $one | cut -f 1 -d '|')"
    local width="$(echo $one | cut -f 2 -d '|')"
    echo "$fn"
    local dir="$(dirname $fn)"
    [[ ! -d $dir ]] && mkdir $dir
    rsvg-convert -w $width $1 >$fn
  done
}

###############################################################################
