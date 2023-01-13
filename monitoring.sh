#!/bin/sh

MESSAGE=$(
echo "#Architecture: $(uname -a)"
echo "#CPU physical: $(lscpu -a -p=Core,Socket | grep -v '#' | sort -u | wc -l)"
echo "#vCPU: $(nproc --all)"
echo "#Memory Usage: $(free -m | awk '/Mem:/{printf"%d/%dMB (%.2f%%)\n", $3, $2, $3/$2*100}')"
echo "#Disk Usage: $(df -h --total | awk '/total/ {printf"%d/%dGB (%.2f%%)\n", $3, $2, $5}')"
echo "#CPU load: $(mpstat | awk '/all/ {printf "%.1f%%\n", 100-$13}')"
echo "#Last boot: $(who -b | awk '{printf "%s %s", $3, $4}')"
echo "#LVM use: $(lsblk | awk '/lvm/ {if ($1) {printf "yes\n";exit;} else {printf "no"}}')"
echo "#Connections TCP: $(netstat -t | grep "ESTABLISHED" | wc -l) ESTABLISHED"
echo "#User log: $(who | wc -l)"
echo -n "#Network: $(hostname -I) "
echo "($(cat /sys/class/net/*/address | head -n 1))"
echo "#Sudo: $(journalctl _COMM=sudo | grep "COMMAND" | wc -l) cmd"
)
wall "$MESSAGE"
