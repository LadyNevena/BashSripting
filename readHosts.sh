#!/bin/bash

filename="$1"
usePing="$2"

if [ $usePing -eq 0 ]
then
	while read -r line
	do
		echo $line: >>$filename 
		sudo  nmap -sT -Pn -O  $line | grep open >> $filename	
		echo "NEXT..."	
	done < hosts.txt
else
	while read -r line
        do
                echo $line: >>$filename 
                sudo  nmap -sT  -O  $line | grep open >> $filename   
                echo "NEXT..."  
        done < hosts.txt

fi

tar -cvf openedHosts.tar $filename
