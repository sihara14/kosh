#!/bin/ksh
print -n "삭제할  사용자를 입력하세요 : "
read US
echo " 사용자가 있는지 검색합니다."
UU=`grep $US /etc/passwd | sed 's/:/ /' | awk '{print $1}'`
GP=`grep $US /etc/passwd`
if [[ GP > 1 ]]
then
	grep $US: /etc/passwd
else
	grep $US /etc/passwd
fi 
echo " 입력한 사용자 ($US) 를 삭제합니다."
	
echo "삭제의 경우 1 입력, 아니면 2"
read YN
case $YN in
	2)
		echo " 사용자 삭제를 중지합니다."
		echo " 메인으로 갑니다."
		/script/user/main_us.ksh
		;;
	1)
		echo "계정만 삭제?(계정 정보다 다 삭제하는 경우 n 선택) y/n"
		read yn 
		case $yn in
			y)
				echo "계정만 삭제"
				userdel $US
				echo " 계정만 삭제했습니다."
				/script/user/main_us.ksh
				;;
			n)
				echo "계정이 모든것 삭제"
				userdel -r $US
				echo " 계정의 모든것 삭제했습니다."
				/script/user/main_us.ksh
				;;
		esac
		;;
esac
		
