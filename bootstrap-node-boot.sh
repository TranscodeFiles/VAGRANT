#!/bin/bash

sudo docker run -d swarm join --heartbeat '5s' --advertise=$(ifconfig | grep -A 1 'eth1' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1):2375 consul://10.100.199.251:8500