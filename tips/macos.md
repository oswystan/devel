**Table of contents**
[TOC]

# system setting
- network setting for WiFi
- clean dock bar
- login Apple ID
- Finder setting
- key board / touch panel / mouse settings
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

- [brave & bookmarks](https://brave.com/) - my favorite web browser
- [clashX](https://chaoxi.cool/dl/clashx.dmg) - vpn tool
- fonts
    - [coding fonts](https://github.com/oswystan/nerd-fonts)
    - [book fonts](https://github.com/oswystan/book-fonts)
- [Fliqlo](https://fliqlo.com/screensaver/) - a digital clock screen saver
- ms-office / [wps](https://www.wps.cn/) - office tools
- [typora](https://typora.io/) - my favorite markdown editor
- [evernote](https://www.yinxiang.com/dl-mac/?) - notes tools but not my favorite
# dev tools

- basic tools
    - [xcode](https://developer.apple.com/xcode/)
    - [iterm2](https://iterm2.com/) / [warp](https://www.warp.dev/)
    - [homebrew](https://brew.sh/)
    ```bash
    ## change mirror in China and disable auto update
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
    export HOMEBREW_NO_AUTO_UPDATE=true
    ```
- command line tools
```bash
$ brew install vim wget git tree dos2unix bash-completion ruby
$ sudo gem install iStats
```
- editors：
    - [nvim](https://github.com/neovim/neovim/releases/tag/stable) & [lvim](https://www.lunarvim.org/zh-Hans/docs/installation)
    ```bash
    $ brew install neovim
    ```
    - [sublime text](https://www.sublimetext.com/)
    ```bash
    ## add the following hosts to /etc/hosts to disable auto update
    $ cat /etc/hosts
    127.0.0.1 license.sublimehq.com
    127.0.0.1 www.sublimetext.com
    ```
    - [vscode](https://code.visualstudio.com/)
        > replace https://az764295.vo.msecnd.net with http://vscode.cdn.azure.cn for fast downloading speed in China.
- linux dev: [orbstack](https://orbstack.dev/download)
