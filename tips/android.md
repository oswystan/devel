# download source code

```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

mkdir android && cd android
repo init -u https://android.googlesource.com/platform/manifest

## download all source code
repo sync -j8

## download one project only
repo sync frameworks/opt
```
