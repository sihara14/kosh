#!/bin/ksh
echo " 뭘 설치 ? "
echo " 1. http 설치 "
echo " 2. https 설치 "
echo " 3. http , https"
echo " 4. NginX 설치 "
echo " 5. ftp 설치"
echo " 6. http,https,ftp 설치"
echo " 7. php 설치 "
echo " 8. web메인으로 돌아가기 "
print "메뉴 선택 : "

read num
case $num in
	1)
		echo -n " http 설치 "
		yum -y install httpd-*
		echo -n " http port service 등록"
		firewall-cmd --permanent --add-port=80/tcp
		firewall-cmd --permanent --add-service=http
		firewall-cmd --reload
		echo -n " http 데몬 등록"
		systemctl enable httpd
		systemctl restart httpd
		/script/package/web/ym_web.ksh
		;;
	2)
		echo -n " https 설치 "
		yum -y install openssl-*
		yum -y install mod_ssl
		echo -n " https port service 등록"
		firewall-cmd --permanent --add-port=443/tcp
		firewall-cmd --permanent --add-service=https
		firewall-cmd --reload
		echo -n " https 데몬 등록"
		systemctl enable httpd
		systemctl restart httpd
		/script/package/web/ym_web.ksh
		;;
	3)
		echo -n " http,https 설치 "
		yum -y install httpd-*
		yum -y install openssl-*
		yum -y install mod_ssl
		echo -n " https port service 등록"
		firewall-cmd --permanent --add-port=80/tcp
		firewall-cmd --permanent --add-port=443/tcp
		firewall-cmd --permanent --add-service=http
		firewall-cmd --permanent --add-service=https
		firewall-cmd --reload
		echo -n " https 데몬 등록"
		systemctl enable httpd
		systemctl restart httpd
		/script/package/web/ym_web.ksh
		;;
	4)
		echo -n " NginX 설치 "
		yum -y install nginx-*
		echo -n " https port service 등록"
		firewall-cmd --permanent --add-port=80/tcp
		firewall-cmd --permanent --add-service=http
		firewall-cmd --reload
		echo -n " Nginx 데몬 등록"
		systemctl enable nginx 
		systemctl restart nginx
		/script/package/web/ym_web.ksh
		;;
	5)
		echo -n " ftp 설치 "
		yum -y install vsftp-*
		echo -n " fpt port service 등록"
		firewall-cmd --permanent --add-port=20/tcp
		firewall-cmd --permanent --add-port=21/tcp
		firewall-cmd --permanent --add-service=ftp
		firewall-cmd --reload
		echo -n " ftp 데몬 등록"
		systemctl enable vsftpd
		systemctl restart vsftpd
		/script/package/web/ym_web.ksh
		;;
	6)
		echo -n " http,https,ftp 설치"
		yum -y install httpd-*
		yum -y install openssl-*
		yum -y install mod_ssl
		yum -y install vsftp-* 
		echo -n " ftp,http,https port service 등록"
		firewall-cmd --permanent --add-port=20/tcp
		firewall-cmd --permanent --add-port=21/tcp
		firewall-cmd --permanent --add-port=80/tcp
		firewall-cmd --permanent --add-port=443/tcp
		firewall-cmd --permanent --add-service=ftp
		firewall-cmd --permanent --add-service=http
		firewall-cmd --permanent --add-service=https
		firewall-cmd --reload
		echo -n " https 데몬 등록"
		systemctl enable vsftpd
		systemctl restart vsftpd
		systemctl enable httpd
		systemctl restart httpd
		/script/package/web/ym_web.ksh
		;;
	7)
		echo -n "php 설치"
		echo "강사님이 주시 ksh로 이동"
		/script/package/web/php.ksh
		;;

	8)
		echo -n "web메인으로 "
		/script/package/web/main_web.ksh
		;;
esac