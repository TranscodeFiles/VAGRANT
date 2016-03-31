ssh -Tv git@gitlab.aymericdaurelle.ovh -o StrictHostKeyChecking=no

# Set directory work
echo "CREATE WORK DIRECTORIES"
sudo mkdir /docker
sudo rm -R /docker/*

# Set permissions
echo "SET RIGHT PERMISSIONS DIRECTORY"
sudo chown -R vagrant:vagrant /docker

echo "CLONE DOCKER IMAGES INFRA"
git clone git@gitlab.aymericdaurelle.ovh:transcodesupinfo/infra-transcode.git /docker

echo "CLONE DOCKER IMAGES CORE API"
git clone -b develop git@gitlab.aymericdaurelle.ovh:transcodesupinfo/core-api.git /docker/core-api

# Restart server
echo "RESTART SERVER"
sudo init 6

