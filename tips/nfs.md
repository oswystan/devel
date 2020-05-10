# nfs for sharing

## workflow

* install on ubuntu

  ```bash
  ## install nfs server and client
  $ sudo apt install nfs-kernel-server nfs-common
  ```

* usage

  ```bash
  ## export directory for sharing
  $ sudo vim /etc/exports
  /home/folder_for_sharing   *(rw,sync,insecure)   ## option insecure for macos mounting
  
  ## mount it to local folder
  $ sudo mount -t nfs 10.1.1.1:/home/folder_for_sharing /local_folder
  ```

  