cd /d %HOMEDRIVE%%HOMEPATH%

mkdir php_vagrant

cd php_vagrant

vagrant init bento/centos-7.3

del Vagrantfile

curl -O https://raw.githubusercontent.com/hibiking-0422/php_install/master/Vagrantfile

vagrant up --provision

vagrant ssh
