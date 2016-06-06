#!/bin/bash

sudo docker run -d -v /vagrant/data:/data -p 8500:8500 progrium/consul -server -bootstrap -data-dir /vagrant/data/tmp/