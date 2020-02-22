#!/bin/bash

cd ~
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
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse''' > sources.list.tsinghua

sudo cp sources.list.tsinghua /etc/apt/
sudo cp -f /etc/apt/sources.list.tsinghua /etc/apt/sources.list
rm sources.list.tsinghua

sudo apt-get update
sudo apt-get install -y git vim ssh samba gcc g++ make

cd ~
mkdir git_folder && cd git_folder
git clone https://github.com/zhaosj1991/linux_document.git

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
   valid users = zhaosj''' >> smb.conf
sudo cp -f smb.conf /etc/samba/smb.conf
rm smb.conf

cd ~
sudo cp -f ~/git_folder/linux_document/network_conf/interfaces /etc/network/interfaces
sudo vi /etc/network/interfaces
