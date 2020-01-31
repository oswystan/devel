#!/usr/bin/env bash
###########################################################################
##                     Copyright (C) 2017 wystan
##
##       filename: centos.sh
##    description:
##        created: 2017-12-29 11:06:01
##         author: wystan
##
###########################################################################

install_devtool() {
    yum update
    yum install -y centos-release-scl
    yum install -y devtoolset-6
    scl enable devtoolset-6
}

install_epel() {
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    rpm -ivh epel-release-6-8.noarch.rpm
    yum update
}

install_basic() {
    sudo yum update
    sudo yum install -y gcc gcc-c++ make libtool man
    sudo yum install -y bzip2 mkdirhier wget curl
    sudo yum install -y vim
    sudo yum install -y git svn
}

enable_subversion() {
    sudo iptables -I INPUT -i eth0 -p tcp --dport 3690 -j ACCEPT
    sudo iptables -I OUTPUT -o eth0 -p tcp --sport 3690 -j ACCEPT
    sudo /etc/rc.d/init.d/iptables save

    ##FIXME: change repo dir first
    sudo echo "/usr/bin/svnserve -d -r /home/svn/repo" >> /etc/rc.local
}

install_basic



###########################################################################
