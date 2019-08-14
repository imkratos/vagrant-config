#!/bin/bash

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

# docker pull gcr.azk8s.cn/k8s.gcr.io/kube-apiserver:v1.15.1
# docker pull gcr.azk8s.cn/kube-apiserver:v1.15.1
# docker pull gcr.azk8s.cn/google_containers/kube-apiserver:v1.15.1
# docker pull gcr.azk8s.cn/google_containers/kube-controller-manager:v1.15.1
# docker pull gcr.azk8s.cn/google_containers/kube-scheduler:v1.15.1
# docker pull gcr.azk8s.cn/google_containers/kube-proxy:v1.15.1

