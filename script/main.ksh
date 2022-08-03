#!/bin/ksh
echo "=============================="
echo "1.패키지 포트 서비스 데몬 메뉴"
echo "2.User 관련 메뉴"
echo "3.HDD & Partion 메뉴"
echo "4.System Monitoring 메뉴"
echo "5. 종료"
echo "============================="
print -n "메뉴 선택 : "

read NUM
case $NUM in
	1)
		echo "1.패키지 포트 서비스"
		/script/package/main_pp.ksh
		;;
	2)
		echo "2.User 관련 메뉴"
		/script/user/main_us.ksh
		;;
	3)
		echo "3.HDD & Partion 메뉴"
		/script/main_hp.ksh
		;;
	4)
		echo "4.System Monitoring 메뉴"
		/script/main_sm.ksh
		;;
	5)
		echo "프로그램을 종료합니다."
		;;
esac
