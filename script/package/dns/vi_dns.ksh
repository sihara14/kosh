#!/bin/ksh
echo " ? "
echo "1./etc/hosts"
echo "2./etc/resolv.conf"
echo "3./etc/named.conf"
echo "4./etc/named.rfc1912.zones"
echo "5./var/named/named.localhost"
echo "6. 종료"
echo " ====================== "
read VI
case $VI in
        1)
                echo " /etc/hosts "
                vi /etc/hosts
		/script/package/dns/vi_dns.ksh
                ;;
        2)
                echo " /etc/resolv.conf "
                vi /etc/resolv.conf
		/script/package/dns/vi_dns.ksh
                ;;
        3)
                echo " /etc/named.conf "
                vi /etc/named.conf
		/script/package/dns/vi_dns.ksh
                ;;
        4)
                echo "/etc/named.rfc1912.zones "
                vi /etc/named.rfc1912.zones
		/script/package/dns/vi_dns.ksh
                ;;
        5)
                echo " /var/named/named.localhost "
                echo " /var/named로 이동합니다."
                cd /var/named
                echo " named.localhost 복사합니다."
                echo " 도메인 명은?(도메인명.com으로 입력)"
                read DM
                cp -p named.localhost ./$DM.zone
                vi ./$DM.zone
                cp -p $DM.zone ./$DM.rev
                vi ./$DM.rev
		/script/package/dns/vi_dns.ksh
                ;;
        6)
                echo " 종료 "
                /script/package/dns/main_dns.ksh
                ;;
esac