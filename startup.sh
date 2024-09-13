#!/bin/bash

echo "updating apt-get repository"
#apt-get update > /dev/null
echo "apt-get updated"
sleep 1
apt-get install figlet toilet -y > /dev/null
apt-get install cowsay -y >/dev/null
apt-get install network-manager -y >/dev/null
#toilet 'STARTING DOCKER'
#figlet 'hello'

echo "starting monitoring docker setup in detach mode ...!"
echo " "
docker-compose up -d 
echo docker-compose logs | tail -n  5
echo " "
echo " "
figlet "starting containers"
echo " "
echo "!!!!!!! all the data shown in grafana stored only for default 15 days !!!!!!!!"
sleep 3
echo "prometheus"
sleep 1
echo "cadvisor"
sleep 1
echo "grafana"

/usr/games/cowsay -f eyes "Docker monitoring started"
echo " "
echo " "

echo "use the below link to reach grafana and follow the respective steps"

echo http://$(nmcli device show | grep 'IP4.ADDRESS' | awk '{print $2}' | cut -d'/' -f1 | head -n 1):9999/

echo "final steps"
echo  1. Open: http://$(nmcli device show | grep 'IP4.ADDRESS' | awk '{print $2}' | cut -d'/' -f1 | head -n 1):9999/dashboard/import
echo "2. Load the Grafana Dashboard ID = 193 or use url : https://grafana.com/grafana/dashboards/193-docker-monitoring/"
echo "3. Select datasource as prometheus. Hit save"

echo ""
echo "now you can view the dashboard" 

echo " "
echo " "
sleep 2
echo "if you face any problem check the docker logs manually"
/usr/games/cowsay -f dragon "log command : docker-compose logs || check mygithub.com"
echo " "
echo " "
echo " "
echo " "
echo "if you need to stop monitoring ==> docker-compose down"
