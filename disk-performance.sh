PARTITIONS=`df -h | grep ^/dev | grep -v boot | awk '{print $6}'`
#echo "$PARTITIONS"
for y in $(echo $PARTITIONS); do echo "## Running dd bs=8K count=5000 5 times on partition $y ##"; for x in `cd $y; seq 1 1 5`; do dd bs=8K count=5000 if=/dev/zero of=test conv=fdatasync; sleep 1; rm test; done; done
