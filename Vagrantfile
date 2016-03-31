# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 15672, host: 15672

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |v|
      v.memory = 8192
      v.cpus = 4
  end

  config.vm.provision "shell", path: "init.sh",    privileged: true
  config.vm.provision "shell", path: "project.sh", privileged: false

end
