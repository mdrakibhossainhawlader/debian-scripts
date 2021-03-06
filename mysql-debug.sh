#!/bin/bash
#By Nicolas Simond -> http://www.nicolas-simond.com/
#The Abyss Project -> http://www.abyssproject.net/
#Related topic -> http://wp.me/p2RtI7-G5
#Compatiblity : Debian 6 + | Ubuntu 12.x + | Debian based distro
#Use at your own risk !
# in root terminal : wget -O- https://raw.githubusercontent.com/stylersnico/debian-scripts/master/mysql-debug.sh | sh
#Tested on debian 7.5 AMD64

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
clear
sleep 2
echo  ":: Stop Mysql"
sleep 2 ; service mysql stop

sleep 4
clear
echo ":: Remove previous log"
sleep 2 ; rm /var/log/mysql.err

sleep 4
clear
echo ":: Launch debug mode"
sleep 2 ; mysqld_safe --log-error=/var/log/mysql.err &
sleep 1 ; echo ":: Waiting 10 seconds for the process"
sleep 10 ;service mysql stop
sleep 4
clear
echo ":: Show error"
sleep 3 ; cat /var/log/mysql.err
