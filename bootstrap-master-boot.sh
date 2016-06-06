#!/bin/bash

ip=$(ifconfig | grep -A 1 'eth1' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)

sudo docker run -p 4000:4000 -d swarm manage -H :4000 --replication --heartbeat '5s' --advertise $ip:4000 consul://10.100.199.251:8500