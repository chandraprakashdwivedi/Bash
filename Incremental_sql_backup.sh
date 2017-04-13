#The following script assumes the backup directory on the FTP server is /myvar/lib/mysql. Modify this as desired.  The script refers to the Rimuhosting backup server.  However, the script can easily be modified to back up to any FTP server.  I can install this system on most servers for a fee.  If interested, contact me)

#Copy this script to /root/crontasks/newmysqlbinlog:

#!/bin/sh
#echo "Creating mysql new binary log at `date`"
if [ `date +%A` == "Sunday" -a `date +%H` == "06" -o "$1" == "dump" ]; then
        echo "Weekly Backup started `date`"
        echo "Full mysql database dump started"
        echo 'All existing full backups and binary log files will be removed'
        PREFIX='mysql-dump.'
        DT=`date "+%m%d%y"`
        DBFN=$PREFIX$DT'.sql'

        rm -f /var/lib/mysql/*.bz2

        mysqldump -uusername -ppassword --flush-logs --delete-master-logs --master-data=2 --add-drop-table --lock-all-tables --databases database1 database2 database3 > /var/lib/mysql/$DBFN
        bzip2 /var/lib/mysql/$DBFN
        echo "mysql dump complete"
else
#       echo "starting new bin log"
        mysqladmin -uusername -ppassword flush-logs
fi
newestlog=`ls -d /var/lib/mysql/mybinlog.?????? | sed 's/^.*\.//' | sort -g | tail -n 1`
for file in `ls /var/lib/mysql/mybinlog.??????`
do
        if [ "/var/lib/mysql/mybinlog.$newestlog" != "$file" ]; then
                bzip2 "$file"
        fi
done

lftp -u 'ftpuser,ftppassword' backupspace.rimuhosting.com -e "set ftp:ssl-protect-data true; mirror -er --reverse -I *.bz2 -X $newestlog /var/lib/mysql /myvar/lib/mysql; mput /var/lib/mysql/mybinlog.index -O /myvar/lib/mysql; exit;"
#echo "Bin Logs backed up"
