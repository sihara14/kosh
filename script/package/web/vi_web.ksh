#!/bin/ksh
echo " ? "
echo "1.http comf 파일"
echo "2.https conf 파일"
echo "3.nginx conf 파일"
echo "4. 종료"
echo " ====================== "
read VI
case $VI in
        1)
                echo " http comf 파일 "
                vi /etc/httpd/conf/httpd.conf
	    	netstat -nlntp | grep httpd
                /script/package/web/vi_web.ksh
                ;;
        2)
                echo " https conf 파일 "
                vi /etc/httpd/conf.d/ssl.conf
	    	netstat -nlntp | grep httpd
                echo -n " https 키.인증서 생성? (y/n)
	    	read YN
	   	case $YN in
			n)
				echo " 생성 안함."
				/script/package/web/vi_web.ksh
				;;
			y)
				/script/package/web/https.ksh 
                		;;
	        ;;
        3)
                echo " nginx conf 파일 "
                vi /etc/nginx/conf.d/default.conf 
                echo -n " nginx 설정 go? (y/n) "
	    read YN
	    case $YN in
		n)
			echo " nginx 설정 안함. "
			/script/package/web/vi_web.ksh
			;;
		y)
			/script/package/web/nginx.ksh 
                	;;
	  esac
	  ;;
        4)
                echo " 종료 "
                /script/package/web/vi_web.ksh
                ;;
esac