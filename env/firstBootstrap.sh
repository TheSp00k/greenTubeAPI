#!/usr/bin/env bash

####### Preparation tasks
sudo apt-get update
sudo apt-get -y install build-essential vim curl

####### NodeJS
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs

####### Redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make

####### Make Redis accessible
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/

####### Start Redis server
redis-server

####### StrongLoop
sudo npm install --unsafe-perm -g strongloop

####### ELK
# install Java
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | sudo tee -a /etc/apt/sources.list.d/webupd8team-java.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
sudo apt-get update
sudo debconf-set-selections <<< 'debconf shared/accepted-oracle-license-v1-1 select true'
sudo debconf-set-selections <<< 'debconf shared/accepted-oracle-license-v1-1 seen true'
sudo apt-get install oracle-java8-installer -y

sudo mkdir -p /var/lib/strong-pm/svc/1/work
sudo ln -s /vagrant /var/lib/strong-pm/svc/1/work/current
