# rock-5b
#### *Debian ARM64 Linux for the Radxa Rock 5 Model B*

Refer to https://github.com/inindev/rock-5b and its tutorial.

### *Get ZFS working*
```
cd /usr/src
mkdir -p zfs
cd zfs
wget https://github.com/openzfs/zfs/releases/download/zfs-2.2.1/zfs-2.2.1.tar.gz
tar xvf zfs-2.2.1.tar.gz
cd zfs-zfs-2.2.1
./configure
make native-deb-utils
sudo apt install --fix-missing ../*.deb
```
