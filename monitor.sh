#!/bin/bash

####For checking total memory percentage###

total=`free -m |grep Mem |awk '{print $2}'`
used=`free -m |grep buffers/cache |awk '{print $3}'`
per=$(($used * 100/$total))
echo "Memory used in Percentage=$per%"


###shell script to monitor disk space it will alert if disk space is above 80###

ADMIN="chandra.prakash363@gmail.com"
ALERT=80
df -h | grep -vE  'Filesystem' | awk '{ print $1 " " $5 } ' |  cut -d'%' -f1 | while read output;
do
  usep=$(echo $output | awk '{ print $2 }' )
  partition=$(echo $output | awk '{ print $1 }' )
  if [ $usep -ge $ALERT ];
  then
  echo " Running out of space " $partition 
#mail -s "Alert:Almost out disk space $usep" $ADMIN"
  fi
done

  ###For checking load average###
uptime | awk '{ print $10 }' | while read output;
do
echo  Load avergae = $output ;
done

 ###For checking server shutdown status###
uptime | awk '{ print $3 " " $4 }' | while read output;
do
echo uptime= $output;
done
    
