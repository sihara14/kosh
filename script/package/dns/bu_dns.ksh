#!/bin/ksh
if [[ /backup ]]
then
        echo " /backup 이 있음"
        echo " /backup 내용을 출력합니다."
        ls -l /backup
else
        echo " /backup이 없음."
        echo "만들겠음? (y/n)"
        read YN
        case $YN in
                n)
                        echo " /backup 안만들고 진행"
                        ;;
                y)
                        echo " /backup 만듦 "
                        mkdir /backup
                        ;;
        esac
fi
echo "backup에 복사?(y/n)"
read BK
case $BK in
        y)
                echo " 복사합니다."
                cp -p /etc/hosts /etc/resolv.conf /etc/named.conf /backup/
                cp -p /etc/named.rfc1912.zones /backup/
                cp -p /var/named/named.localhost /backup/
                ls -l /backup/
                /script/package/dns/main_dns.ksh

                ;;
        n)
                echo " 복사 안 합니다."
                /script/package/dns/main_dns.ksh
                ;;
esac

