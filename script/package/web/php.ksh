#!/bin/ksh
clear
yum -y remove php-*
echo ""
printf "precess any key to continue..."
read A
echo ""
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
echo ""
printf "precess any key to continue..."
read B
echo ""
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.9.rpm
echo ""
printf "precess any key to continue..."
read C
echo ""
yum-config-manager --enable remi-php74
echo ""
printf "precess any key to continue..."
read D
echo ""
yum -y install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql
echo ""
printf "precess any key to continue..."
read E
echo ""
php -v
/script/package/web/main_web.ksh