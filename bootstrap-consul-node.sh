#!/bin/bash

sudo apt-get update
sudo apt-get install heartbeat -y

touch /etc/ha.d/haresources
touch /etc/ha.d/authkeys
touch /etc/ha.d/ha.cf

echo "bcast eth1

warntime 4
deadtime 10
initdead 15
keepalive 2

udpport 694

auto_failback on

node swarm-consul-node-06
node swarm-consul-node-07" > /etc/ha.d/ha.cf

echo "auth 1
1 sha1 consulpassword" > /etc/ha.d/authkeys

chmod 600 /etc/ha.d/authkeys

grep -q -F "10.100.199.206 swarm-consul-node-06
10.100.199.207 swarm-consul-node-07" /etc/hosts || echo "10.100.199.206 swarm-consul-node-06
10.100.199.207 swarm-consul-node-07" >> /etc/hosts

curl -sSL https://get.docker.com/ | sh

#consulip=$(ifconfig | grep -A 1 'eth1' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)

#sudo docker run -d --name node-$consulip -v /mnt:/data -p $consulip:8300:8300 -p $consulip:8301:8301 -p $consulip:8301:8301/udp -p $consulip:8302:8302 -p $consulip:8302:8302/udp -p $consulip:8400:8400 -p $consulip:8500:8500 -p 172.17.0.1:53:53/udp progrium/consul -server -advertise $consulip -join 10.100.199.205

#sudo docker run -d -v /vagrant/data:/data -p 8500:8500 progrium/consul -server -bootstrap -data-dir /vagrant/data/tmp/

echo 'swarm-consul-node-06 IPaddr::10.100.199.251/24/eth0' > /etc/ha.d/haresources
/etc/init.d/heartbeat start
