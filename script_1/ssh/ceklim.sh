#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo -e "\E[44;1;37m             ⇱ TH-VPN PREMIUM SCRIPT ⇲              \E[0m"
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo "";
if [ -e "/root/log-limit.txt" ]; then
echo -e "\033[0;32mผู้ใช้งานที่ละเมิดกฏ    \033[0m";
echo "Time - Username - Number of Multilogin"
echo "-------------------------------------";
cat /root/log-limit.txt
else
echo " ไม่มีผู้ใช้งานใดที่กระทําการละเมิดกฏ    "
fi
echo " ";
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m";