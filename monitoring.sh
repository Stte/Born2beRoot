#!/bin/sh

ROOT_MEM=$(free -m | grep -i 'Mem' | awk '{print $2}')
ROOT_USED=$(free -m | grep -i 'Mem' | awk '{print $2}')
HOME_MEM=$(free -m | grep -i 'Mem' | awk '{print $3}')
HOME_USED=$(free -m | grep -i 'Mem' | awk '{print $3}')

printf "%s - %s\n" $MEM_ALL $MEM_USED


MESSAGE = $(echo "#Architecture: $(uname -a)"
echo "#CPU physical: $(nproc)"
echo "#vCPU: $(cat /proc/cpuinfo | grep processor | wc -l)"
echo "#Memory Usage: $(free -m | grep 'Mem:' | awk '{printf"%d/%dMB (%.2f%%)\n", $3, $2, $3/$2*100}')"
echo "#Disk Usage: "
echo "#CPU load: "
echo "#Last boot: "
echo "#LVM use: "
echo "#Connections TCP: "
echo "#User log: "
echo "#Network: "
echo "#Sudo: "
)


wall "$MESSAGE"
