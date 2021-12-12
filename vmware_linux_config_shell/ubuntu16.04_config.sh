#!/bin/bash

sudo cp -f /etc/apt/sources.list /etc/apt/sources.list.ori
echo '''deb http://mirrors.aliyun.com/ubuntu/ xenial main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main
deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security universe ''' | sudo tee /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -y git vim ssh samba gcc g++ make ntp

cd ~
mkdir share
sudo smbpasswd -a zhaosj
cp /etc/samba/smb.conf smb.conf
echo '''[share]
   comment = share
   browseable = yes
   path = /home/zhaosj/share
   guest ok = yes
   create mask = 0700
   writable = yes
   valid users = zhaosj''' | sudo tee -a /etc/samba/smb.conf

echo '''# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens33
iface ens33 inet static
address 192.168.150.131
netmask 255.255.255.0
gateway 192.168.150.2
dns-nameserver 114.114.114.114''' | sudo tee /etc/network/interfaces
sudo vi /etc/network/interfaces
