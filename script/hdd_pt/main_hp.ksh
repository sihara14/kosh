#!/bin/ksh
echo " 서비스 선택 "
echo " 1. mount 상태 확인 "
echo " 2. HDD 확인 "
echo " 3. Partitoin "
echo " 4. 오토마운트 설정 "
echo " 5. 메인으로  "
read NU
case $NU in
	1)
		echo " mount 상태확인 "
		df -h
		/script/hdd_pt/main_hp.ksh
		;;
	2)
		echo " HDD 확인 "
		fdisk -l
		/script/hdd_pt/main_hp.ksh
		;;
	3)
		echo " Partition "
		echo -n " HDD 확인  : "
		fdisk -l 
		echo -n " 설정할 HDD 입력 : "
		read PA
		fdisk /dev/$PA
		echo -n " 파티션 출력 "
		fdisk -l /dev/$PA	
		echo -n " 파티션 포멧 "
		echo "포멧할 파티션 입력:"
		echo -n "mkfs.ext4  /dev/"
		read PAA
		mkfs.ext4 /dev/$PAA
		echo "마운트 포인트 생성"
		echo " 마운트 포인트 경로: "
		read MPP
		mkdir -p /$MMP
		echo "마운트 중"
		mount /dev/$PAA /$MMP
		echo "마운트 정보 확인 "
		df -h | grep $PAA
		/script/hdd_pt/main_hp.ksh
		;;
	4)
		echo " 오토마운트 설정 "
		vi /etc/fstab
		echo " 재부팅 하겠습니까?(y/n) "
		read PW
		case $PW in
			n)
				echo "재부팅 안합니다."
				/script/hdd_pt/main_hp.ksh
				;;
			y)
				echo " 재부팅 합니다. "
				echo " 아무거나 누르세요 "
				read A
				echo " "
				init 6
				;;
		esac
		;;
		
	5)	
		/script/main.ksh
		;;
esac
