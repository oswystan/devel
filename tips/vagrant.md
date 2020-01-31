# INSTALL

- [virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [vagrant](https://www.vagrantup.com/)

# workflow

- add a box
- init a vm
- configure the Vagrantfile
- start the vm
- ssh to vm
- destroy a vm

# usage

```bash
$ vagrant box add generic/centos6
$ vagrant box list
$ vagrant box remove generic/centos6
$ vagrant init xxx
$ vagrant up
$ vagrant reload
$ vagrant ssh
$ vagrant halt
$ vagrant status
$ vagrant suspend
$ vagrant destroy xxx
$ vagrant package
```

# reference

- [boxhub](https://app.vagrantup.com/boxes/search)

- Vagrantfile

```bash
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "navigator" do |navigator|
    navigator.vm.hostname = "navigator.local"
    navigator.vm.box = "generic/centos6"
    navigator.vm.network "private_network", auto_config:false, type:"dhcp"
    navigator.vm.network "public_network", ip: "192.168.1.110", bridge: "en0: Wi-Fi (Wireless)"
    #navigator.vm.network "public_network", type:"dhcp"
    navigator.vm.synced_folder "/Users/you/usr/software", "/software"
    navigator.vm.provider "virtualbox" do |vb|
        vb.gui    = false
        vb.memory = 1024
        vb.cpus   = 1
    end
  end
end
```

