#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2018 wystan
##
##       filename: setup_env.sh
##    description:
##        created: 2018-03-10 10:44:21
##         author: wystan
##
###########################################################################

dirs="dotfiles editors scripts"
cur_dir=$(pwd)
for one in $dirs; do
  cd "$cur_dir" || break
  [ -f "$one/INSTALL" ] && cd "$one" && ./INSTALL
done

###########################################################################
