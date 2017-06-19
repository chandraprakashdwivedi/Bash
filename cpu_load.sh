# Usage  ./cpu_load.sh  PID
#!/bin/bash
loop=6
interval=20

for ((i=1; i <= $loop; i++))
do
  _now=$(date)
  echo "${_now}" >>high-cpu.out
  top -b -n 1 -H -p $1 >>high-cpu.out
  echo "${_now}" >>high-cpu-tdump.out
  jstack -l $1 >>high-cpu-tdump.out
  echo "thread dump #" $i
  if [ $i -lt $loop ]; then
     echo "sleeping..."
     sleep $interval
  fi
done
