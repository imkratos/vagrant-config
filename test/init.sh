#!/bin/bash


sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

sudo echo "" > /etc/apt/sources.list

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

#disable ufw
sudo ufw disable


# echo "---------------"
# echo " Install DOCKER "
# echo "---------------"
# # curl -sSL https://get.daocloud.io/docker | sh
# sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# #config docker
# sudo mkdir -p /etc/docker
# sudo tee /etc/docker/daemon.json <<-'EOF'
# {
#   "registry-mirrors": ["https://kj15yn93.mirror.aliyuncs.com"]
# }
# EOF
# sudo systemctl daemon-reload
# sudo systemctl restart docker



# echo "---------------"
# echo " Install NGINX "
# echo "---------------"
# sudo apt-get install -y nginx


echo "-----------------"
echo " Install Mysql   "
echo "-----------------"
sudo apt-get install -y mysql-server



# echo "-----------------"
# echo " Install MongoDB "
# echo "-----------------"
# sudo apt-get install -y mongodb
# sudo systemctl start mongodb



# echo "-----------------"
# echo " Install Redis   "
# echo "-----------------"
# sudo apt-get install redis-server




# echo "-----------------"
# echo " Install JAVA8   "
# echo "-----------------"
# sudo apt-get install openjdk-8-jdk

# echo "-----------------"
# echo " Initialize Site "
# echo "-----------------"
# cp /vagrant/nginx/*.conf   /etc/nginx/sites-available/
# ln -s /etc/nginx/sites-available/*.conf   /etc/nginx/sites-enabled/












