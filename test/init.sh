#!/bin/bash


sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp /vagrant/sources.list /etc/apt/

sudo apt-get update -y
sudo dpkg-reconfigure locales
#disable ufw
sudo ufw disable


echo "---------------"
echo " Install DOCKER "
echo "---------------"
# curl -sSL https://get.daocloud.io/docker | sh
sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

#config docker
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://kj15yn93.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker



# echo "---------------"
# echo " Install NGINX "
# echo "---------------"
# sudo apt-get install -y nginx


echo "-----------------"
echo " Install Mysql   "
echo "-----------------"
sudo apt-get install -y mysql-server

# mysql config
# grant all privileges on *.* to 'root'@'%' identified by 'root' with grant option;
# grant all privileges on *.* to 'zhishuo'@'%' identified by 'zhishuo' with grant option;
# FLUSH PRIVILEGES;
# bind = 127.0.0.1 desable



echo "-----------------"
echo " Install MongoDB "
echo "-----------------"
sudo apt-get install -y mongodb
sudo systemctl start mongodb



echo "-----------------"
echo " Install Redis   "
echo "-----------------"
sudo apt-get install -y redis-server




echo "-----------------"
echo " Install JAVA8   "
echo "-----------------"
sudo apt-get install -y openjdk-8-jdk

# echo "-----------------"
# echo " Initialize Site "
# echo "-----------------"
# cp /vagrant/nginx/*.conf   /etc/nginx/sites-available/
# ln -s /etc/nginx/sites-available/*.conf   /etc/nginx/sites-enabled/












