#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo 'You should login or run this script as root user'
	exit 1
fi
COMP=$1
#ACTION=$2

case $COMP in
	web)
		echo "Installing Web Server"
		yum install httpd httpd-devel -y &>/dev/null
		;; 
	app) 
		echo "Installing Tomcat"
		if [ ! -f /opt/apache-tomcat-9.0.0.M26.tar.gz ]; then 
			echo "Downloading Tomcat"
			wget http://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.0.M26/bin/apache-tomcat-9.0.0.M26.tar.gz -O /opt/apache-tomcat-9.0.0.M26.tar.gz &>/dev/null
		fi
		cd /opt
		if [ ! -d /opt/tomcat ]; then
			echo "Extracting Tomcat"
			tar xf apache-tomcat-9.0.0.M26.tar.gz
			mv apache-tomcat-9.0.0.M26 tomcat
		fi
		;;
	db) 
		yum install mariadb mariadb-server -y &>/dev/null
		;;
	*) 
		echo "Usage: $0 {app|db|web}"
		exit 1
		;;
esac
