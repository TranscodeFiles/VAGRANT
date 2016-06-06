# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=777,fmode=777"]

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 15672, host: 15672

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
  end



  config.vm.network "forwarded_port", guest: 80, host: 80, guest_ip: "10.100.199.250", auto_correct: true

  (1..2).each do |i|
    config.vm.define "swarm-master-0#{i}" do |master|
      master.vm.provision :shell, path: "bootstrap-master.sh"

      master.vm.provision "shell", path: "project.sh", privileged: false

      master.vm.provision :shell, path: "bootstrap-master-boot.sh", run: "always"
      master.vm.hostname = "swarm-master-0#{i}"
      master.vm.network "private_network", ip: "10.100.199.20#{i}"
    end
  end

  (3..4).each do |i|
    config.vm.define "swarm-node-0#{i}" do |node|
      node.vm.provision :shell, path: "bootstrap-node.sh"
      node.vm.provision :shell, path: "bootstrap-node-boot.sh", run: "always"
      node.vm.hostname = "swarm-node-0#{i}"
      node.vm.network "private_network", ip: "10.100.199.20#{i}"
    end
  end

  (6..7).each do |i|
    config.vm.define "swarm-consul-node-0#{i}" do |consul|
      consul.vm.provision :shell, path: "bootstrap-consul-node.sh"
      consul.vm.provision :shell, path: "bootstrap-consul-node-boot.sh", run: "always"
      consul.vm.hostname = "swarm-consul-node-0#{i}"
      consul.vm.network "private_network", ip: "10.100.199.20#{i}"
    end
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

end
