# What is this

this is a guideline for how to create a local yum repository to speed up your yum installation procedure.



# HOWTO

- download rpm file from a mirror website
- use `createrepo` to create indexes for the rpm files
- setup a HTTP server for downloading
- create a `xxx.repo` for client configuration.



# examples

```shell
## download rpm files
$ wget -e robots=off -r -k -c -A .rpm -np http://mirrors.163.com/centos/6/sclo/x86_64/
$ wget --reject-regex=.*eclipse.* -e robots=off -r -k -c -A .rpm -np http://mirrors.163.com/centos/6.10/sclo/x86_64/rh/devtoolset-4/

## create index
$ sudo yum install -y yum-utils createrepo
$ createrepo mirrors.163.com/centos/6/sclo/x86_64/

## install nginx for download and put the following config to a conf file
$ sudo yum install -y nginx
$ cat /etc/nginx/conf.d/yum.conf
server {
        listen 12345 default_server;  ## change port
        root /home/winner/yum-repo/mirrors.aliyun.com/centos/6/sclo/x86_64/; ## change path to your own directory
        location / {
            autoindex on;
            autoindex_exact_size off;
            autoindex_localtime on;
        }
}
$ nginx -t && nginx

## create a repo file
$ cat /home/winner/yum-repo/mirrors.aliyun.com/centos/6/sclo/x86_64/your-company.repo
[devtoolset]
name=devtoolset
enable=1
baseurl=http://your-repo-server-ip:12345/
gpgcheck=0

## then download repo file on your dev machine and install
$ wget http://your-repo-server-ip:12345/your-company.repo -O /etc/yum.conf.d/
$ sudo yum makecache
$ sudo yum install -y xxx

```

