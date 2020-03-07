#!/bin/bash

<<commentout
vagrant(https://www.vagrantup.com/)とvirtualbox(https://www.virtualbox.org/)はあらかじめ入れといてね
-----------------------------------------------------------------------
たった３回コマンドを打つだけでおけ！
$curl -O https://raw.githubusercontent.com/hibiking-0422/php_install/master/php_install.bat
$php_install.bat
$bash <(curl -s https://raw.githubusercontent.com/hibiking-0422/php_install/master/php_install.sh)
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

#日本語化
sudo localectl set-locale LANG=ja_JP.UTF-8

#firewall
systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --reload

#apach install
sudo yum install -y httpd
sudo systemctl enable httpd.service
sudo yum -y install httpd httpd-tools httpd-devel httpd-manual

#php install
sudo yum install -y epel-release
sudo yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum list

sudo yum install -y --enablerepo=remi-php73 php php-gd php-intl php-json php-mysqlnd php-mbstring php-xml
php -m | grep -e intl -e mbstring -e SimpleXML

#mysql -v 0.5.2
#mysql
sudo yum remove -y mariadb-libs
sudo yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
sudo yum install -y mysql-community-server
sudo systemctl start mysqld
sudo systemctl enable mysqld

<<commentout

----------apach初期設定---------------
1.基本設定
https://www.rem-system.com/centos-httpd-inst/
2.セキュリティ設定
https://www.rem-system.com/apache-security01/

-----------php初期設定-----------------
1.php.iniを当リポジトリのものに変更
# sudo wget  https://raw.githubusercontent.com/hibiking-0422/php_install/master/php.ini

2. /etc/httpd/conf/httpd.conf
以下のAllowOverrideをAllに書き換える。
<Directory "/var/www/html">
   AllowOverride All




-----------  mysql初期設定手順 -----------
$grep password /var/log/mysqld.log
-初期パスワードを確認
$mysql -u root -p
-さっきのパスワードを入力してログイン
mysql>ALTER USER 'root'@'localhost' IDENTIFIED BY '[好きなパスワード]';
-rootユーザのパスワードの再設定
mysql>exit
$mysql -u root -p
-新しいパスワードで再度ログイン
mysql>create user '[ユーザ名]'@'[ホスト名]' identified by '[パスワード]';
#新規ユーザの作成
mysql>grant all on *.* to '[ユーザ名]'@'[ホスト名]';
#ユーザに権限付与(とりあえず全部与えとく)

commentout
