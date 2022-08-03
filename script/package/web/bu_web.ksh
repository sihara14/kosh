#!/bin/ksh
if [[ /backup ]]
then
        echo " /backup 이 있음"
        ls -l /backup
else
        echo " /backup이 없음."
        echo "만들겠음? (y/n)"
        read YN
        case $YN in
                n)
                        echo " /backup 안만들고 진행"
                        ;;
                y)
                        echo " /backup 만듦 "
                        mkdir /backup
                        ;;
        esac
fi
echo "backup에 복사?(y/n)"
read BK
case $BK in
        y)
                echo " 복사합니다."
	    echo " /etc/httpd/conf/httpd.conf 를 /backup/에 복사합니다."
                cp -p /etc/httpd/conf/httpd.conf /backup/
                ls -l /backup/
                /script/package/web/main_web.ksh

                ;;
        n)
                echo " 복사 안 합니다."
                /script/package/web/main_web.ksh
                ;;
esac

