# usage

```bash
## list vms
$ vboxmanage list vms

## start a vm
$ /usr/lib/virtualbox/VirtualBoxVM --comment relay --startvm $UUID --no-startvm-errormsgbox

## get ip address of vm instance
$ vboxmanage guestproperty enumerate $vmname

## run guest command in host machine
$ vboxmanage guestcontrol $UUID --username root --password 123456 run -- /bin/ls /root/

```

