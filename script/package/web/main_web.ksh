#!/bin/ksh
echo -n "=============================="
echo "1.web yum"
echo "2.web backup"
echo "3.web vi 설정"
echo "4. 종료"
echo "============================="
print "메뉴 선택 : "

read NUM
case $NUM in
	1)
		echo "1.web yum"
		/script/package/web/ym_web.ksh
		;;
	2)
		echo "2.web backup"
		/script/package/web/bu_web.ksh
		;;
	3)
		echo "3.web vi 설정"
		/script/package/web/vi_web.ksh
		;;
	4)
		echo "종료"
		/script/package/main_pp.ksh
		;;
esac
