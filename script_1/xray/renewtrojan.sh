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
NUMBER_OF_CLIENTS=$(grep -c -E "^#&# " "/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
        echo -e "\E[44;1;37m             ⇱ TH-VPN PREMIUM SCRIPT ⇲              \E[0m"
        echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
	    echo ""
        echo -e "\033[0;32mไม่มีข้อมูลในระบบ    \033[0m"
		echo ""
		echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
		exit 1
	fi

	clear
    echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
    echo -e "\E[44;1;37m             ⇱ TH-VPN PREMIUM SCRIPT ⇲              \E[0m"
    echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
	echo ""
	grep -E "^#&# " "/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (Days) : " masaaktif
user=$(grep -E "^#&# " "/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#&# " "/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#&# $user $exp/#&# $user $exp4/g" /etc/xray/config.json
clear
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo -e "\E[44;1;37m             ⇱ TH-VPN PREMIUM SCRIPT ⇲              \E[0m"
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo ""
echo "Username  : $user"
echo "Expired  : $exp4"
echo ""
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"