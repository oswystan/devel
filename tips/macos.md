# system setting

- 清理dock栏

- 登陆AppleID

- 设置网络

- 设置Finder

- 设置键盘/触摸板/鼠标/三指拖动

- ssh

    ```bash
    $ sudo vim /etc/ssh/ssh_config
    
    ## add the following config item 'StrictHostKeyChecking no'
    ## the ssh client will add unknown host directly
    Host *
        StrictHostKeyChecking no
    ```

- sudo

    ```bash
    $ sudo vim /etc/sudoers
    
    ## add the following content and replace 'yourusername' to your own user name
    yourusername   ALL=(ALL) NOPASSWD: ALL
    ```

- password & sec policy:

    ```bash
    $ pwpolicy -clearaccountpolicies
    $ passwd
    ```

# office tools

- web browser：brave & bookmarks
- vpn：clashX
- fonts
    - coding fonts
    - book fonts

- screen saver: Fliqlo
- office: ms-office / wps
- markdown: typora
- evernote

# dev tools

- basic tools
    - xcode
    - iterm2 / warp
    - homebrew

- command line tools
    - vim wget git tree dos2unix bash-completion
- editors：
    - nvim & lvim
    - sublime text


```bash
## add the following hosts to /etc/hosts to disable auto update
$ cat /etc/hosts
127.0.0.1 license.sublimehq.com
127.0.0.1 www.sublimetext.com
```
- linux dev: orbstack
