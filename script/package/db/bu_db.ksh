#!/bin/ksh
echo " 백업 장소는 어디입니까? "
echo "1. /backup "
echo " 2. 특정 디렉토리 "
read BUN
case $BUN in
	1)
		echo "/backup 을 확인합니다."
			if [[ /backup ]]
			then
        			echo " /backup 이 있음"
        			echo " /backup 내용을 출력합니다."
        			ls -l /backup
				echo " /backup 에 백업을 진행 합니다."
				echo -n " "
       				/script/package/dns/bup_db.ksh
			else
        			echo " /backup이 없음."
       	 			echo "만들겠음? (y/n)"
        			read YN
        			case $YN in
                		n)
                        		echo " /backup 만들지 않습니다."
                        		echo " 처음으로 돌아갑니다."
					/script/package/dns/bu_db.ksh
                       		 	;;
                		y)
                        		echo " /backup 만듦 "
                        		mkdir /backup
					ls -l / | grep backup
					echo " /backup 에 백업을 진행 합니다."
                        		echo -n " "
					/script/package/dns/bup_db.ksh
                        		;;
        			esac
			fi
		;;
	2)
		echo " 특정 디렉토리 "
		echo " 특정 디렉토리 경로 & 이름은? "	
		/script/package/dns/buz_db.ksh
		;;
esac