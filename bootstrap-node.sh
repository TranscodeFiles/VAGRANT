#!/bin/bash

sudo apt-get update
sudo apt-get install heartbeat -y

sudo touch /etc/ha.d/haresources
sudo touch /etc/ha.d/authkeys
sudo touch /etc/ha.d/ha.cf

sudo echo "bcast eth1

warntime 4
deadtime 10
initdead 15
keepalive 2

udpport 694

auto_failback on

node swarm-node-03
node swarm-node-04" > /etc/ha.d/ha.cf

sudo echo "auth 1
1 sha1 password" > /etc/ha.d/authkeys

sudo chmod 600 /etc/ha.d/authkeys

sudo grep -q -F "10.100.199.203 swarm-node-03
10.100.199.204 swarm-node-04" /etc/hosts || echo "10.100.199.203 swarm-node-03
10.100.199.204 swarm-node-04" >> /etc/hosts

curl -sSL https://get.docker.com/ | sh

sudo docker daemon -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock

sudo echo "DOCKER_OPTS='-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock --cluster-store=consul://10.100.199.251:8500 --cluster-advertise=eth1:2375'" > /etc/default/docker
sudo restart docker

sudo echo 'swarm-node-03 IPaddr::10.100.199.250/24/eth0' > /etc/ha.d/haresources
/etc/init.d/heartbeat start