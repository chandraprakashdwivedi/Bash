#!/bin/bash

ALERT=80
df -h | grep -vE  'Mounted' | awk '{ print $6 " " $5 } ' |  /bin/cut -d '%' -f1 | while read output;
do

usep=$(echo $output | awk '{ print $2 }' )
partition=$(echo $output | awk '{ print $1 }' )
if [ $usep -ge $ALERT ];
then echo " FILE SYSTEM THRESHOLD " $partition $usep"%"
fi
done

echo "---------------------------------------------------------------------------"

df -ih | grep -vE  'Mounted' | awk '{ print $6 " " $5 } ' |  /bin/cut -d '%' -f1 | while read output;
do

usep=$(echo $output | awk '{ print $2 }' )
partition=$(echo $output | awk '{ print $1 }' )
if [ $usep -ge $ALERT ];
then echo " INODE THRESHOLD " $partition $usep"%"
fi
done

echo "--------------------------------------------------------------------------"
