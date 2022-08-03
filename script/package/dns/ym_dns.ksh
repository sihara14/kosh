#!/bin/ksh
echo " DNS 설치 합니다."
yum -y install bind-*
echo -n " DNS port service 등록"
firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=53/udp
firewall-cmd --permanent --add-service=dns
echo -n " DNS 데몬 등록"
systemctl enable named
systemctl restart named
echo -n " DNS 설치가 끝났습니다."
/script/package/dns/main_dns.ksh
