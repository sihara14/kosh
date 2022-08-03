#!/bin/ksh
echo " ex) /export/home/samadal/ "
read DN
echo " $DN 을 확인 합니다. "
	if [[ /$DN ]]
	then
        	echo " /$DN 이 있음"
        	echo " /$DN 내용을 출력합니다."
       	 	ls -l /$DN
		echo " /$DN 에 백업을 진행 합니다."
		echo -n " "
	else
        	echo " /$DN이 없음."
       	 	echo "만들겠음? (y/n)"
        	read YN
        	case $YN in
                n)
                        echo " /$DN 만들지 않습니다."
                        echo " 처음으로 돌아갑니다."
			/script/package/dns/bu_db.ksh
                       	;;
                y)
                        echo " /$DN 만듦 "
                        mkdir -p /$DN 
			cd /$DN
			pwd
			ls -l /$DN
			echo " /$DN 에 백업을 진행 합니다."
                        echo -n " "
                        ;;
        	esac
	fi
echo -n " ------------------------------------------------------"
ecno " "
echo "어떻게 백업하실?"
echo "1. DB 전체 백업"
echo "2. 원하는 DB만 백업"
echo "3. 테이블만 백업"
echo "4. 백업 종료"
read NUM
case $NUM in
        1)
               	echo " DB 전체 백업"
		echo " 유저? ex)root"
		read UR
		echo " 백업명은?ex)full"
		read NM
		echo "백업 합니다."
		mysqldump -u $UR -p -all-databases > /$DN/$NM.sql
		ls -l /backup | grep $NM
		/script/package/db/buz_db.ksh
                ;;
        2)
                echo " 원하는 DB만 백업"
		mysql -u root -p mysql -e "show databases;"
		echo " 유저? ex)root"
		read UR
		echo " DB명?ex)mysql"
		read DBN
		echo " 백업명은?ex)mdb"
		read NM
		echo "백업 합니다."
		mysqldump -u $UR -p $DBN > /$DN/$NM.sql
		ls -l /backup | grep $NM
		/script/package/db/buz_db.ksh
                ;;
	3)
                echo " 원하는 테이블만 백업"
		echo " 유저? ex)root"
		read UR
		mysql -u root -p mysql -e "show databases;"
		echo " DB명?ex)mysql"
		read DBN
		mysql -u $UR -p mysql -e "show tables;"
		echo " 테이블 명?ex)user"
		read TBN
		echo " 백업명은?ex)tuser"
		read NM
		echo "백업 합니다."
		mysqldump -u $UR -p $DBN $TBN > /$DN/$NM.sql
		ls -l /backup | grep $NM
		/script/package/db/buz_db.ksh
                ;;
	
	4)
		echo "4. 백업 종료"
		/script/package/db/main_db.ksh
		;;
esac

