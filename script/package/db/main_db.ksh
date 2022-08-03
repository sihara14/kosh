#!/bin/ksh
echo "=============================="
echo "1.DB yum"
echo "2.DB backup"
echo "3.DB 복구"
echo "4. 종료"
echo "============================="
print  "메뉴 선택 : "

read NUM
echo -n " "
case $NUM in
	1)
		echo "1.DB yum"
		/script/package/db/ym_db.ksh
		;;
	2)
		echo "2.DB backup"
		/script/package/db/bu_db.ksh
		;;
	3)
		echo "3.DB 복구"
		/script/package/db/bo_db.ksh
		;;
	4)
		echo "DNS 설치 종료"
		/script/package/main_pp.ksh
		;;
esac
