# work flow

```shell
sudo apt install dnsmasq -y

## add dns server: 
##     server=114.114.114.114
## uncomment the following options
##     log-queries
sudo vim /etc/dnsmasq.conf

## comment the following command
##     DNSMASQ_OPTS="$DNSMASQ_OPTS --local-service"
sudo vim /etc/init.d/dnsmasq

## comment dns=dnsmasq in /etc/NetworkManager/NetworkManager.conf
sudo vim /etc/NetworkManager/NetworkManager.conf

## kill dnsmasq in NetworkManager
sudo killall -9 dnsmasq
sudo service network-manager restart

## add your own domain name in /etc/hosts
10.1.1.1 myservice.com

# run dnsmasq
sudo service dnsmasq restart

# test on another host
dig myservice.com @dnsmasq-server-ip

```

# useful commands

```shell
## test conf file syntax
$ sudo dnsmasq --test

## start in no-daemon mode
$ sudo dnsmasq --no-daemon --log-queries --log-facility=/var/log/dnsmasq.log

```



# reference

[dnsmasq tips and tricks](https://www.linux.com/learn/intro-to-linux/2018/2/advanced-dnsmasq-tips-and-tricks)
[dns spoofing with dnsmasq](https://www.linux.com/learn/intro-to-linux/2017/7/dns-spoofing-dnsmasq)

