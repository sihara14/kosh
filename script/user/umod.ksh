echo "유저 내용 변경"
echo "1.유저 변경"
echo "2. 돌아가기 "
read NUM
case $NUM in
	1)
	echo "수정할 사용자를 입력하세요 : "
	read US
	echo " 사용자가 있는지 검색합니다."
	UU=`grep $US /etc/passwd | sed 's/:/ /' | awk '{print $1}'`
	if [[ $US = $UU ]]
	then
		echo " 입력한 사용자 ($US) 는 존재합니다."
		echo " 뭐 수정? "
		echo " 1.  UID "
		echo " 2.  GID "
		echo " 3.  디렉토리 "
		echo " 4.  닉네임 "
		read MO
		case $MO in
			1)
				echo " UID 변경 "
				echo " 변경 UID : "
				read UD
				usermod -u $UD $US
				/script/user/main_us.ksh
				;;
			2)
				echo " GID 변경 "
				echo " 변경 GID : "
				read GD
				usermod -g $GD $US
				/script/user/main_us.ksh
				;;

			3)
				echo " 디렉토리 변경 "
				echo " 변경 디렉토리 경로"
				read DR
				usermod -m -d $DR $US
				/script/user/main_us.ksh
				;;
			4)
				echo " 닉네임 "
				echo " 변경 닉네임"
				read NN
				usermod -c $NN $US
				/script/user/main_us.ksh
				;;
		esac
	else
		echo " 입력한 사용자 ($US) 는 존재안합니다."
		/script/user/umod.ksh
	fi
	;;
	2)
		"user main으로 갑니다."
		/script/user/main_us.ksh
	;;
esac
