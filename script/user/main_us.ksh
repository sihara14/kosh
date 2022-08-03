#!/bin/ksh
echo "=============================="
echo "1.사용자 생성"
echo "2.사용자 수정"
echo "3.사용자 삭제"
echo "4.종료 - 메인으로"
echo "============================="
print -n "메뉴 선택 : "

read NUM
case $NUM in
	1)
		echo "1.사용자 생성"
		/script/user_add1.ksh
		;;
	2)
		echo "2.사용자 수정"
		/script/umod.ksh
		;;
	3)
		echo "3.사용자 삭제"
		/script/udel.ksh
		;;
	*)
		echo "메인으로 갑니다."
		/script/main.ksh
		;;
esac
