#!/bin/ksh
echo " DB 설치 합니다."
yum -y install mariadb-*
echo -n " DB port service 등록"
firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --permanent --add-service=mysql
echo -n " DNS 데몬 등록"
systemctl enable mariadb
systemctl restart mariadb
echo -n " DNS 설치가 끝났습니다."
/script/package/db/main_db.ksh
