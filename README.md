# Infra docker Transcode

## Instalation

> Etape 1 : Clone repo

``` shell
git clone git@gitlab.aymericdaurelle.ovh:transcodesupinfo/vagrant.git
```

> Etape 2 : Ajout de la clé ssh

``` shell
cd vagrant
cp ~/.ssh/id_rsa .ssh/id_rsa
cp ~/.ssh/id_rsa.pub .ssh/id_rsa.pub
touch .ssh/config
```

Contenue du fichier config dans .ssh/config

``` shell
# ssh/config
# Git keys
host gitlab.aymericdaurelle.ovh 
     user monaddresse@mail.com
     port 22
     identityfile /root/.ssh/id_rsa
```

> Etape 3 : Run vagrant

``` shell
vagrant up
```

> Etape 4 : Run docker

``` shell
cd /docker
docker-compose up
```