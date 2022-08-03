#!/bin/ksh
echo -n "/etc/yum.repos.d 에 nginx.repo 저장소를 복사합니다."
cp /script/package/web/nginx.repo /etc/yum.repos.d/
echo -n "시스템 저장소 확인"
echo " 아무거나 누루세요 "
read A
echo ""
yum repolist | grep nginx
echo " 패키지 설치되어있나 확인 "
echo " 아무거나 누루세요 "
read B
echo ""
rpm -qa | grep nginx | nl
echo " 포트, 서비스 확인 "
echo " 아무거나 누루세요 "
read C
echo ""
cat /etc/firewalld/zones/public.xml | grep 80
cat /etc/firewalld/zones/public.xml | grep https
echo " 설정 파일을 열겠다."
echo " 아무거나 누루세요 "
read D
vi /usr/share/nginx/html/index.html
