#!/bin/ksh
echo " 아직...뭘해야되는지 모릅니다."
#echo " 서비스 선택 "
#echo " 1. 전체 보기 "
#echo " 2. 특정해서 보기 "
#echo " 3. 특정해서 보기2 "
#echo " 4. 메인으로  "

#read NUM
#case $NUM in
#	1)
#		echo " 전체보기 "
#		ps -ef
#		;;
#	2)
#		echo " 특정해서 검색 : UID "
#		read ID
#		ps -ef | grep "$ID"
#		;;
#	3)
#		echo " 특정해서 검색 : UID ,시간 "
#		echo -n "  UID: "
#		read ID
#		ps -ef | grep "$ID" | awk '{print $1, $5}'
#		;;
#
#	4)	
#		echo " 메인 "
#		/script/main.ksh
#		;;
#esac
