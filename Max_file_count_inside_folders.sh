#By the way, if you're looking for the directories that contain lots of files, this script may help:

#!/bin/bash
# count_em - count files in all subdirectories under current directory.
echo 'echo $(ls -a "$1" | wc -l) $1' >/tmp/count_em_$$
chmod 700 /tmp/count_em_$$
find . -mount -type d -print0 | xargs -0 -n1 /tmp/count_em_$$ | sort -n
rm -f /tmp/count_em_$$


#If you are very unlucky you have used about 100% of all inodes and can't create the scipt. You can check this with df -ih.
#Then this bash command may help you:

#sudo find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n
