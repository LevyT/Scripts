#!/bin/bash

echo "[*]Ports:"
nmap -Pn -p 25,110,143,443,80,465,587,993,995 $1 | grep tcp
ping -c 1 $1 > /dev/null
	if [ $? -eq 0 ]; then
	echo "$1 is up"
	else
	echo "$1 is down"
	fi
echo "[*]Mail Records:"
dig -t MX $1 +noall +answer | grep MX | cut -d "X" -f2
echo "[*]Main Domain:"
host $1 | grep "has address"
echo "[*]Relevant Sub-Domains:"
for sub in $(echo -e "mail\nimap\nsmtp\nwebmail\npop\npop3")
do
	host $sub.$1 | grep " has address"
done
