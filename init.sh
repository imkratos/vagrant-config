#!/bin/bash



sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo touch /etc/apt/sources.list

# echo "
# deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse

# deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse

# " >> /etc/apt/sources.list

echo "
deb http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ bionic-backports main restricted universe multiverse
" >> /etc/apt/sources.list


sudo apt-get update
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


# -------- kubeadm config

#off swap
sudo swapoff -a

sudo apt-get update && apt-get install -y apt-transport-https curl
sudo curl -s http://packages.faasx.com/google/apt/doc/apt-key.gpg | sudo apt-key add -

sudo cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://mirrors.ustc.edu.cn/kubernetes/apt kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

#config kubeadm 
sudo cat <<EOF > /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
Environment="KUBELET_CGROUP_ARGS=--cgroup-driver=cgroupfs --pod-infra-container-image=registry.cn-hangzhou.aliyuncs.com/google_containers/pause-amd64:3.1"
EOF

systemctl daemon-reload
systemctl restart kubelet













