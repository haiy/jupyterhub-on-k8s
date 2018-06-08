#!/usr/bin/env bash

# apt install packages
apt-get update
apt-get install -y $(cat /tmp/packages.txt)
apt-get clean
rm -rf /var/lib/apt/lists/*

# locale
sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

# time
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# clean files
rm -rf /tmp/*


