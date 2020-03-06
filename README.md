$bash <(curl -s https://raw.githubusercontent.com/hibiking-0422/php_install/master/php_install.sh)

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
