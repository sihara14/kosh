#!/bin/ksh
echo " 복구 "
echo " user 이름은 ? "
echo " ex ) root "
read UR
echo " DB 이름은? "
echo " ex ) mysql "
read DBM
echo " 복구할 파일 경로, 이름 "
echo " ex ) /sdb/mdb.sql"
read WR
echo " 복구 합니다. "

mysql -u $UR -p $DBM < /$WR

/script/package/db/main_db.ksh
