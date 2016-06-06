#!/bin/bash

sudo curl -sSL https://get.docker.com/ | sh

sudo curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

grep -q -F "sudo docker -H :4000 info" /etc/hosts || echo "sudo docker -H :4000 info" >> /home/vagrant/.bashrc

#cd /vagrant
#./project.sh

# ssh to the master and
# do a 
# sudo docker -H :4000 info
# to get information about the cluster
#
# sudo docker -H :4000 run hello-world
# to run a container
#
# sudo docker -H :4000 ps -a
# to get info about it
#
# sudo docker-compose -H :4000 scale worker=2
# to run compose
#
# etc..