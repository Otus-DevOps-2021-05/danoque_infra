#!/bin/sh
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key ad$
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse$
apt-get update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
