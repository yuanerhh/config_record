#!/bin/bash

sudo cp -f /etc/apt/sources.list /etc/apt/sources.list.ori
echo '''deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse''' | sudo tee /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -y git vim ssh samba gcc g++ make

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
