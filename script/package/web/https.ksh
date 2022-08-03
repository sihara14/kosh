#!/bin/ksh
a=`cat /etc/firewalld/zones/public.xml | grep 443`
b=`cat /etc/firewalld/zones/public.xml | grep https`

echo " 패키지 포트 번호 확인? (y/n)"
read YN
case $YN in
        n)
                echo "확인하지 않습니다."
                ;;
        y)
                echo -n " 패키지 설치 확인 "
                echo " "
                rpm -qa | grep openssl* | nl
                echo " "
                echo -n " 포트 , 서비스 확인 "
                echo " "
                        if [[ a ]]
                        then
                                echo " "
                                echo "포트가 등록되어 있습니다."
                                cat /etc/firewalld/zones/public.xml | grep 443
                        else
                                echo "포토가 등록되어 있지 않습니다."
                                echo " 포트를 등록합니다."
                                firewall-cmd --permanent --add-port=443/tcp
                                firewall-cmd --reload
                                /etc/firewalld/zones/public.xml | grep 443
                        fi
                        if [[ b ]]
                        then
                                echo " "
                                echo "서비스가 등록되어 있습니다."
                                cat /etc/firewalld/zones/public.xml | grep https
                        else
                                echo " "
                                echo " 서비스가 등록되어 있지 않습니다."
                                echo " 서비스를 등록합니다."
                                firewall-cmd --permanent --add-service=https
                                firewall-cmd --reload
                                /etc/firewalld/zones/public.xml | grep https
                        fi
                ;;
esac
echo " 키 생성"
echo " 키 이름(ex.http) : "
read KY
echo " 키 비트수 (ex,2048): "
read BT
openssl genrsa -out $KY.key $BT

echo -n "인증서 생성"
openssl req -new -key $KY.key -out $KY.csr
echo " "
echo "키와 인증서 병합"
openssl x509 -req -days 365 -in $KY.csr -signkey $KY.key -out $KY.crt



