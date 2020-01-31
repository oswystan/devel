#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2020 wystan
##
##       filename: server.sh
##    description:
##        created: 2020-01-31 19:22:05
##         author: wystan
##
###########################################################################

declare -a ali_app_servers=(
)

alias ali.app.foreach='.foreach ali_app_servers[@]'
alias ali.app.ls='.ls ali_app_servers[@]'
alias ali.app.autossh='.autossh ali_app_servers[@]'
alias ali.app.copy='.copy ali_app_servers[@]'
alias ali.app.mem.free='.foreach.inline ali_app_servers[@] "free -h"'

###########################################################################
