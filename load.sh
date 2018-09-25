#!/bin/bash

free -m | awk 'NR==2{printf "Memory Usage Percentage: (%.2f%%)\n",$3*100/$2 }'
top -b n1 | grep load | awk '{printf "CPU 1min Load: %.2f\n", $(NF-2)}'
top -b n1 | grep 'KiB Mem' |awk '{ printf "TOP Memory Usage: %s/%s MB  \n", $6/1024,$4/1024 }'
echo ""
echo  "Please Enter application PID in script"
top -bn 1 -p 2807 |awk 'NR==8{printf "CPU%/Mem%/Application_Name  : %s , %s ,%s  \n",$9,$10,$12 }'
echo ""
echo ""
echo "For the internet performance use this pyhon module https://github.com/sivel/speedtest-cli"
echo "------------------------------------------------------------------------------------------"
                                  
