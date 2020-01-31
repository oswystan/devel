## start with docker images

```
docker pull gitlab/gitlab-ce

sudo docker run --detach \
    --hostname gitlabserver \
    --publish 192.168.1.101:8443:443 \
    --publish 192.168.1.101:8080:80 \
    --publish 192.168.1.101:8022:22 \
    --name gitlab \
    --volume /home/ares/docker/config:/etc/gitlab \
    --volume /home/ares/docker/logs:/var/log/gitlab \
    --volume /home/ares/docker/data:/var/opt/gitlab \
    gitlab/gitlab-ce:latest


```

## references

[official docs](https://docs.gitlab.com/)<br>
[docker hub images](https://hub.docker.com/r/gitlab/gitlab-ce/)
