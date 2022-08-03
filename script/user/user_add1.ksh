#!/bin/ksh
print -n "생성할 사용자를 입력하세요 : "
read US
echo " 사용자가 있는지 검색합니다."
UU=`grep $US /etc/passwd | sed 's/:/ /' | awk '{print $1}'`
if [[ $US = $UU ]]
then
	echo " 입력한 사용자 ($US) 는 존재합니다."
else 
	print -n "계속 진행하시겠습니까?(y/n) : "
	read YN
	case $YN in
		n)
			echo " 사용자 생성을 중지합니다."
			;;
		y)
			echo "어디에 생성하시겠습니다?"
			echo "1.기본경로(/export/home/)에 생성"
			echo "2.임의의 디렉터리에 생성"
			print -n "번호를 선택하세요 : "
			read NUM
			case $NUM in
				1)
					useradd -m -d /export/home/$US $US
					tail -1 /etc/passwd
					;;
				2)
					print -n "생성할 디렉토리를 입력하세요:"
					read DIR
					if [[ -d $DIR ]]
					then
						echo "디렉토리가 존재합니다."
					else
						mkdir /$DIR
						useradd -m -d /$DIR/$US $US
						tail -1 /etc/passwd
					fi
					;;
				*)
					echo "제대로 된 번호를 입력하세요"
					;;
			esac
			;;
	esac
/script/user/main_us.ksh
fi		
