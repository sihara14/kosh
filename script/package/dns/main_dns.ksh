#!/bin/ksh
echo "=============================="
echo "1.DNS yum"
echo "2.DNS backup"
echo "3.DNS vi 설정"
echo "4. 종료"
echo "============================="
print  "메뉴 선택 : "

read NUM
echo -n " "
case $NUM in
	1)
		echo "1.DNS yum"
		/script/package/dns/ym_dns.ksh
		;;
	2)
		echo "1.DNS backup"
		/script/package/dns/bu_dns.ksh
		;;
	3)
		echo "3.DNS vi 설정"
		/script/package/dns/vi_dns.ksh
		;;
	4)
		echo "DNS 설치 종료"
		/script/package/main_pp.ksh
		;;
esac
