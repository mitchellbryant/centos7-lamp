#!/bin/bash
# 
# For CentOS7
# This script will update CentOS7, set up LAMP stack with PHP 7.030, mariadb, and apache
# 
# INSTRUCTIONS:
# 1. Install Git if you dont have it already with the below command:
# 		sudo yum -y install git
# 2. Copy this shell script with the below command:
# 		sudo git clone https://github.com/mitchellbryant/centos7-lamp
# 3. Change to the cloned directory
#		cd centos7-lamp
# 4. Make the script executable with the following command: 
#      sudo chmod a+x centos7-lamp-setup.sh
# 5. Execute the script as a sudo user:
#      sudo ./centos7-lamp-setup.sh

#The following will install Apache, MariaDB, and allow web traffic

sudo yum -y update

sudo yum -y install apache2

sudo yum -y install httpd mariadb-server mariadb

sudo systemctl start mariadb

sudo yum -y install epel-release

sudo yum -y update

sudo systemctl start httpd.service

sudo systemctl restart httpd.service

sudo firewall-cmd --add-service=http --permanent && sudo firewall-cmd --add-service=https --permanent

sudo systemctl restart firewalld

#This will now install PHP 7

sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

sudo yum install yum-utils

yum-config-manager --enable remi-php70
#If you want to install PHP 7.1 or PHP 7.2 on CentOS 7, just enable it as shown below
# yum-config-manager --enable remi-php71    for 7.1 
# yum-config-manager --enable remi-php72    for 7.2

sudo yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo php-mbstring php-xml

sudo systemctl restart httpd.service

echo ""
echo "Finished with setup!"
echo "You should now be able to navigate to the IP of your server on a web browser to verify that Apache is running!"
echo ""
