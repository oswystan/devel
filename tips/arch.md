# commands

## modify language
```bash

sudo vim /etc/locale.gen   ## uncomment en_US.UTF-8
sudo vim /etc/locale.conf  ## set LANG=en_US.UTF-8
sudo locale-gen

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

```

## install basic

```bash
pacman -S vim nvim tree zsh xz zip unzip git
```
