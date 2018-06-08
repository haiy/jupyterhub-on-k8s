#!/usr/bin/env bash

# apt install packages
apt-get update
apt-get install -y $(cat /tmp/packages.txt)
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "
user_test	ALL=(ALL)	NOPASSWD:ALL
">> /etc/sudoers
