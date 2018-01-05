#!/bin/bash



yum install httpd httpd-devel -y
systemctl enable httpd
systemctl start httpd
