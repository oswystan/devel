# ubuntu

```shell
# configure http proxy in .bashrc

export http_proxy="xx.xx.xx.xx:80"
export https_proxy="xx.xx.xx.xx:80"
export no_proxy="localhost,127.*,10,*"

# install fonts on ubuntu16.04
sudo cp xxx.ttf /usr/share/fonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv

# download src code of packages
apt source $pkg_name

# restart DNS service after open/close VPN (ubuntu-18.04)
sudo systemctl restart systemd-resolved.service

```

## Route

```shell
sudo route add -net 10.0.0.0 netmask 255.0.0.0  metric 100 wlp4s0
sudo route add -net 4.4.4.3 netmask 255.255.255.255 metric 100 wlp4s0
```

## Digital clock

```shell
sudo apt-add-repository ppa:alexanderk23/ppa
sudo apt-get update
sudo apt-get install gluqlo

sudo apt-get remove gnome-screensaver
sudo apt-get install xscreensaver xscreensaver-gl-extra xscreensaver-data-extra

## add the following command in file: ~/.xscreensaver
## under the command: maze -root       \n\
gluqlo -root		\n\
```

## system hardware information

```shell
sudo dmidecode
sudo dmidecode -t 
```

## ssh auto login

```shell
# client:
ssh-keygen -t rsa -C "ssh-env"
ssh-copyid $user@$server

```

```shell
## use ssh config for different server identity
## put the following content into ~/.ssh/config
## then just:
##     ssh ubuntu
Host ubuntu
	Hostname 192.168.1.102
	User ares

```
## accelerate ssh login

```shell
## change /etc/ssh/sshd_config
UseDNS no
GSSAPIAuthentication no

## then restart sshd
$ sudo service sshd restart

```

## yarn

```shell
## install
$ curl -L https://github.com/yarnpkg/yarn/releases/download/v1.9.4/yarn-1.9.4.js | sudo tee /usr/bin/yarn
$ chmod +x /usr/bin/yarn

## commands
$ yarn global add xxx  # to $HOME/.yarn/bin
$ yarn install

```

# centos6

```shell

## disable iptables(stop it first and then disable it on boot)
$ sudo service iptables stop
$ sudo chkconfig iptables off

## enable ssh on boot
$ sudo chkconfig sshd on

```

# macos

## commands
```shell
7z a xxx.7z xxx
7z x xxx.7z
```

## reset password policy
```shell
$ pwpolicy -clearaccountpolicies
```

## route

```bash
## add route
$ sudo route add -net 10.0.0.0/8 -interface xxx
$ sudo route add -host x.x.x.x $(gateway-ip)

## check
netstat -nr -f inet

```

# virtualbox

```shell
## list vms
$ vboxmanage list vms

## start a vm
$ /usr/lib/virtualbox/VirtualBoxVM --comment relay --startvm $UUID --no-startvm-errormsgbox

## get ip address of vm instance
$ vboxmanage guestproperty enumerate $vmname

## run guest command in host machine
$ vboxmanage guestcontrol $UUID --username root --password 123456 run -- /bin/ls /root/

```



