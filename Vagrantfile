# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # config.ssh.username = "root"
  # config.ssh.password = "root"
  # config.ssh.insert_key = "true"

  (2..4).each do |i|

    config.vm.define "node#{i}" do |node|

    # 设置虚拟机的Box
    node.vm.box = "ubuntu18"

    # 设置虚拟机的主机名
    node.vm.hostname="node#{i}"

    # 设置虚拟机的IP
    node.vm.network "private_network", ip: "192.168.59.#{i}"

    # 设置主机与虚拟机的共享目录
    # node.vm.synced_folder "~/Desktop/share", "/home/vagrant/share"

    # VirtaulBox相关配置
    node.vm.provider "virtualbox" do |v|

      # 设置虚拟机的名称
      v.name = "node#{i}"

      # 设置虚拟机的内存大小  
      v.memory = 2048

      # 设置虚拟机的CPU个数
      v.cpus = 1
    end

    node.vm.provision "shell", path: "init.sh"
  
    # 使用shell脚本进行软件安装和配置
    # node.vm.provision "shell", inline: <<-SHELL

    #   # 安装docker 1.11.0
    #   wget -qO- https://get.docker.com/ | sed 's/docker-engine/docker-engine=1.11.0-0~trusty/' | sh
    #   usermod -aG docker vagrant
      
    # SHELL

    end
  end
end