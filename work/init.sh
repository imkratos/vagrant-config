#!/bin/bash


sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo echo "" > /etc/apt/sources.list

echo "
192.168.59.2 node2
192.168.59.3 node3
192.168.59.4 node4
" >> /etc/hosts

echo "
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

" >> /etc/apt/sources.list

# echo "
# deb http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse
# deb http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse
# deb http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
# " >> /etc/apt/sources.list


sudo apt-get update -y
# sudo apt-get upgrade

#install docker
# curl -sSL https://get.daocloud.io/docker | sh
sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

#install kubeadmin


#config docker
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://kj15yn93.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker












