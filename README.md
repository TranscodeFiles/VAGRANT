# Infra docker Transcode

## installation

> Etape 1 : Clone repo

``` shell
git clone git@gitlab.aymericdaurelle.ovh:transcodesupinfo/vagrant.git
```

> Etape 2 : Ajout de la clé ssh à gitlab 

[Configuration gitlab](https://help.github.com/articles/checking-for-existing-ssh-keys)


> Etape 3 : Ajout du fichier **config** dans le dossier ~/.ssh/

``` shell
Host gitlab.aymericdaurelle.ovh
  ForwardAgent yes
```

> Etape 5 : Commandes à effectuer

``` shell 
eval `ssh-agent`
ssh-add
ssh-add -l
```

> Etape 4 : Run vagrant

``` shell
vagrant up
```

> Etape 5 : Run docker

``` shell
cd /docker
docker-compose up
```
