#!/bin/bash
echo "deb http://repo.pritunl.com/stable/apt bionic main" | sudo tee /etc/apt/sources.list.d/pritunl.list
echo "deb https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list  
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt update
sudo apt --assume-yes install pritunl mongodb-server
sudo systemctl start pritunl mongodb
sudo systemctl enable pritunl mongodb
