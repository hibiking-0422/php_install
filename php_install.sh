#!/bin/bash

<<commentout
vagrant(https://www.vagrantup.com/)とvirtualbox(https://www.virtualbox.org/)はあらかじめ入れといてね
-----------------------------------------------------------------------
たった３回コマンドを打つだけでおけ！
$curl -O https://raw.githubusercontent.com/hibiking-0422/rails_install.sh/master/vagrant.bat
$vagrant.bat
$bash <(curl -s https://raw.githubusercontent.com/hibiking-0422/rails_install.sh/master/rails6.0_install.sh)
-----------------------------------------------------------------------
commentout

#update
sudo yum -y update

#SELinux disable
sudo setenforce 0

# Firewall http open
sudo firewall-cmd --add-service=http --zone=public --permanent
sudo firewall-cmd --reload

#git install
sudo yum install -y git
