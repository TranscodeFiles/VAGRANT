# Docker
## Update apt sources
sudo apt-get update
echo "INSTALL APT-TRANSPORT-HTTPS CA-CERTIFICATES"
sudo apt-get install apt-transport-https ca-certificates -y
echo "ADD KEY HKP://P80.POOL.SKS-KEYSERVERS"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "ADD DOCKER SOURCE LIST"
sudo touch /etc/apt/sources.list.d/docker.list
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-cache policy docker-engine
## Install Prerequisites
echo "INSTALL PREREQUISITES"
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) -y
## Install docker
sudo apt-get update
echo "INSTALL DOCKER"
sudo apt-get install docker-engine -y
echo "START SERVICE DOCKER"
sudo service docker start
## Create a Docker group
echo "ADD USER VAGRANT IN DOCKER GROUP"
sudo usermod -aG docker vagrant
# Adjust memory and swap accounting
echo "ADD MEMORY AND SWAP"
sudo sed -i.bak 's/^\(GRUB_CMDLINE_LINUX=\).*/\1"cgroup_enable=memory swapaccount=1"/' /etc/default/grub
sudo update-grub
# Configure a DNS server for use by Docker
echo "Configure DNS server for use docker"
sudo echo "DOCKER_OPTS=\"--dns 8.8.8.8\"" >> /etc/default/docker
echo "RESTART SERVICE DOCKER"
sudo restart docker

# Docker compose
## Install docker compose
echo "INSTALL DOCKER COMPOSE"
sudo curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
## Active autocompletion
echo "ACTIVE AUTO COMPLETION DOCKER COMPOSE"
sudo curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

# Restart server
echo "RESTART SERVER"
sudo init 6
