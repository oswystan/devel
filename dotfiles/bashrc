######################################################################
# this is my bashrc file
# see more in http://alias.sh/
######################################################################
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh
fi
unalias ls > /dev/null 2>&1
alias df="df -h"
alias ls="ls -F"
alias ll="ls -l"
alias la="ls -la"
alias cls="clear && printf '\033c'"
alias g2u="iconv -f gbk -t utf-8 "
alias u2g="iconv -t gbk -f utf-8 "
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias goto='find . -name '

# alias for git
alias gl='git lg'
alias gc='git commit'
alias gad='git add'
alias gst='git status -s'
alias gdf='git df'
if [ `uname` = "Darwin" ]; then
    alias mp="open -a 'Media Player'"
    alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
    alias lsusb="system_profiler SPUSBDataType"
    alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
fi

###################################
## build tags for cscope and ctag
###################################
btags()
{
    find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.cc" -o -name "*.java" >cscope.files
    ctags -L ./cscope.files
    cscope -b
}
cltags()
{
    rm -f cscope.files tags cscope.out
}

###################################
## set terminal name
###################################
tn() {
    local name="Terminal"
    if [[ $# -ne 0 ]]; then
        name=$1
    fi
    echo -en "\033]0;$name\a"
}

###################################
## tmux
###################################
tm() {
    local created=0
    if [[ $# -eq 0 ]]; then
        tmux ls
        return
    fi
    if [[ $# -eq 1 ]]; then
        tmux at -t $1
        return
    fi
    sname=$1
    OLDIFS=$IFS
    IFS=','
    for one in $2
    do
        [ -z $one ] && continue
        if [ $created -eq 0 ]; then
            tmux new -s $sname -n $one -d
            created=1
        else
            tmux new-window -n $one -t $sname
        fi
    done
    tmux at -t $sname
    IFS=$OLDIFS
}

uts() {
    if [[ $# -eq 0 ]]; then
        date +%s
    else
        date +'%Y-%m-%d %H:%M:%S' -d @$1
    fi
}

###################################
## clone github project
###################################
hub()
{
    if [[ $# -eq 0 ]]; then
        cd $HOME/usr/project/github
        return 0;
    fi
    echo "==>start clone $1..." &&
        git clone ssh://git@github.com/oswystan/$1 &&
        cd $1 &&
        git config --local user.name "oswystan" &&
        git config --local user.email "oswystan@126.com" &&
        cd - &&
    echo "==>succ" || echo "==>fail!!"
}

###################################
## clone gitlab project
###################################
lab()
{
    if [[ $# -eq 0 ]]; then
        cd $HOME/usr/project/gitlab
        return 0;
    fi
    echo "==>start clone $1..." &&
        git clone git@gitlab.com:oswystan/$1.git &&
        cd $1 &&
        git config --local user.name "oswystan" &&
        git config --local user.email "oswystan@126.com" &&
        cd - &&
    echo "==>succ" || echo "==>failed!!"
}

###################################
## docker shortcuts
###################################
dstart() {
    echo "docker run -it --name wrtc -P ubuntu:16.04 /bin/bash"
}
denter() {
    #docker run -it --name wrtc -P ubuntu:16.04 /bin/bash
    _pid=`docker inspect -f {{.State.Pid}} $1`
    HOME=/root LANG=en_US.UTF-8 LANGUAGE=en_US:en sudo nsenter --mount --uts --ipc --net --pid -w --target $_pid
}
_denter() {
    cur="${COMP_WORDS[COMP_CWORD]}"
    local opts=`docker ps --format '{{.Names}}'`
    COMPREPLY=($(compgen -W "$opts" -- $cur))
}
complete -F _denter denter

###################################
## xz a directory
###################################
z() {
    if [ $# -ne 1 ]; then
        echo "usage: z <file|directory>"
        return 1
    fi
    tar Jcvf $1.tar.xz $1
}

###################################
## extract files from a compressed file
###################################
x() {
    if [ $# -ne 1 ]; then
        echo "usage: x <file>"
        return 1
    fi
    if [ ! -f $1 ]; then
        echo "ERROR: no such file [$1]"
        return 1
    fi
    case $1 in
        *.tar.bz2)
            tar jxvf $1
            ;;
        *.tar.gz)
            tar zxvf $1
            ;;
        *.tar.xz)
            tar Jxvf $1
            ;;
        *)
            echo "ERROR: unknown file format"
    esac
}

###################################
## check liveness of a service on a service
###################################
live() {
    if [[ $# -ne 2 ]]; then
        echo "usage: live <server-ip> <port>"
        return 1
    fi
    nc -z -w2 $1 $2 && echo "alive" || echo "dead"
}

k_linux() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: k <only one target>"
        return 1
    fi

    if [[ -d $1 ]]; then
        (setsid nautilus "$1" >/dev/null 2>&1)
        return 0;
    fi

    case $1 in
        *.md)
            (setsid typora "$1" >/dev/null 2>&1)
            ;;
        *.js|*.html|*.txt|*.log|*.json|*.css|*.ts)
            subl "$1" >/dev/null 2>&1
            ;;
        *.xls|*.xlsx|*.xlsm|*.csv)
            (setsid et "$(pwd)/$1" >/dev/null 2>&1)
            ;;
        *.doc|*.docx)
            (setsid wps "$(pwd)/$1" >/dev/null 2>&1)
            ;;
        *.ppt|*.pptx)
            (setsid wpp "$(pwd)/$1" >/dev/null 2>&1)
            ;;
        *.bmp|*.png|*.jpeg|*.jpg)
            (setsid eog "$1" >/dev/null 2>&1)
            ;;
        *.tar.bz2|*.tar.gz|*.tar.xz|*.tgz|*.zip)
            (setsid file-roller "$1" >/dev/null 2>&1)
            ;;
        *)
            vim $1
            ;;
    esac
}

k_mac() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: k <only one target>"
        return 1
    fi

    if [[ -d $1 ]]; then
        open "$1"
        return 0;
    fi

    case $1 in
        *.md)
            open "$1"
            ;;
        *.js|*.html|*.txt|*.log|*.json|*.css|*.ts)
            subl "$1" >/dev/null 2>&1
            ;;
        *.xls|*.xlsx|*.xlsm|*.csv)
            open "$1"
            ;;
        *.doc|*.docx)
            open "$1"
            ;;
        *.ppt|*.pptx)
            open "$1"
            ;;
        *.bmp|*.png|*.jpeg|*.jpg)
            open "$1"
            ;;
        *)
            vim $1
            ;;
    esac
}
if [[ $(uname) = "Linux" ]]; then
    alias k=k_linux
elif [[ $(uname) = "Darwin" ]]; then
    alias k=k_mac
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
export GOROOT="/usr/local/go"
export GOPATH="$HOME/usr/go"
export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

export PS1='\u:\w>'
######################################################################
