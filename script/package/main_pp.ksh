#!/bin/ksh
echo "-----------------------------------"
echo " 패키지 설치 추가 "
echo " 1. 현재 상태 확인 "
echo " 2. DNS "
echo " 3. Web Server( http,https,ftp ) "
echo " 4. DB "
echo " 5. 다른 패키지 설치 "
echo " 6. EXIT "
echo "-----------------------------------"
print -n "메뉴 선택 : "

read NUM
case $NUM in
	1)
		echo " 1. 포트, 서비스 상태 "
		echo " 2. 패키지 확인 "
		read NM
		case $NM in
			1)
				echo " 포트, 서비스 상태 "
				firewall-cmd --list-all
				/script/package/main_pp.ksh
				;;
			2)
				echo " 확인 패키지 이름? "
				read PK
				A=`rpm -qa | grep $PK | nl`
				if [[ $A ]]
				then
					rpm -qa | grep $PK | nl
				else
					echo " 설치되어 있지 않습니다 "
				fi
				;;
		esac
		echo "아무키나 누루면 선택으로 돌아감 "
		read A
		/script/package/main_pp.ksh
		;;		
	2)
		echo "DNS를 추가? (y/n)"
		read YN
		case $YN in
			y)
				/script/package/dns/main_dns.ksh
				;;
			n)
				echo " DNS를 설치하지 않습니다. "
				/script/package/main_pp.ksh
				;;		
		esac
		;;
	3)
		echo " Web를 추가? (y/n)"
		read YN
		case $YN in
			y)
				/script/package/web/main_web.ksh
				;;
			n)
				echo " Web를 설치하지 않습니다. "
				/script/package/main_pp.ksh
				;;		
		esac
		;;
	4)
		echo " DB를 추가?(y/n)"
		read YN
		case $YN in
			y)
				/script/package/db/main_db.ksh
				;;
			n)
				echo " DB를 설치하지 않습니다. "
				/script/package/main_pp.ksh
				;;		
		esac
		;;
	5)
		echo " 다른패키지 설치? (y/n) "
		read YN
		case $YN in
			y)
				/script/package/main_pd.ksh
				;;
			n)
				echo " 다른 패키지를 설치하지 않습니다. "
				/script/package/main_pp.ksh
				;;		
		esac
		;;
	6)
		echo " EXIT "
		/script/main.ksh
		;;
esac
