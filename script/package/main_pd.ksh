#!/bin/ksh
echo " ======================= "
echo " 특정 서비스 선택 "
echo " 1. 현재 상태 확인 "
echo " 2. 패키지 설치 "
echo " 3. 패키지 추가 삭제 "
echo " 4. 포트 추가 삭제 "
echo " 5. 데몬 실행 "
echo " 6. EXIT "
echo " ======================= "
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
		echo "아무키나 누루면 특정 서비스 선택으로 돌아감 "
		read A
		/script/package/main_pd.ksh
		;;	
	2)
		echo " 설치 "
		read YM
		yum -y install $YM	
		echo "아무키나 누루면 특정 서비스 선택으로 돌아감 "
		read A
		/script/package/main_pd.ksh
		;;
	3)
		echo "서비스 추가? 삭제? (add/del)"
		read PA
		case $PA in
			add)
				echo " 추가 패키지 이름 "
				read NA
				firewall-cmd --permanent --add-service=$NA
				firewall-cmd --reload
				;;
			del)
				echo " 삭제 패키지 이름 "
				read NA
				firewall-cmd --permanent --remove-service=$NA
				firewall-cmd --reload
				;;		
		esac
		echo "아무키나 누루면 특정 서비스 선택으로 돌아감 "
		read A
		/script/package/main_pd.ksh
		;;
	4)
		echo " 포트 추가? 삭제? (add/del)"
		read PO
		case $PO in
			add)
				echo " 추가 포트의 번호,프로토콜 (port No. / protocol)"
				read NO
				firewall-cmd --permanent --add-port=$NO
				firewall-cmd --reload
				;;		
			del)
				echo " 삭제 포트의 번호,프로토콜 (port No / protocol "
				read NO
				firewall-cmd --permanent --remove-port=$NO
				firewall-cmd --reload
				;;		
		esac
		echo "아무키나 누루면 특정 서비스 선택으로 돌아감 "
		read A
		/script/package/main_pd.ksh
		;;
	5)
		echo " 데몬 1.등록/2.실행/3.멈춤 /4. 재실행"
		read DM
		case $DM in
			1)
				echo "등록 데몬 명"
				read DD
				systemctl enable $DD
				;;
			2) 
				echo "실행 데몬 명"
				read DD
				systemctl start $DD
				;;
			3)
				echo "멈춤 데몬 명"
				read DD
				systemctl stop $DD
				;;
			4)
				echo "재실행 데몬 명"
				read DD
				systemctl restart $DD
				;;
		esac
		echo "아무키나 누루면 특정 서비스 선택으로 돌아감 "
		read A
		/script/package/main_pd.ksh
		;;
	6)
		echo " 메인 화면으로 돌아갑니다. "
		/script/main.ksh
		;;
esac
