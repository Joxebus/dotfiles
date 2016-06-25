#!/bin/bash
if [ $USER != "root"  ]; then
    echo "You need root privileges"
    exit 1
fi

if [ "$1" = "uci" ]; then
   echo "deb http://mint.mes.edu.cu/MINT/mint rosa main import upstream romeo backport" > /etc/apt/sources.list
   echo "deb http://ubuntu.uci.cu/ubuntu trusty main restricted universe multiverse" >> /etc/apt/sources.list
   echo "deb http://ubuntu.uci.cu/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
   echo "deb http://ubuntu.uci.cu/ubuntu trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
   echo "deb http://ubuntu.uci.cu/ubuntu trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
   echo "deb http://ubuntu.uci.cu/ubuntu trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
   export http_proxy="localhost:3128"
   export https_proxy="localhost:3128"
   echo "Using UCi repositories"
elif [ "$1" = "offline" ]; then
   echo "deb [ arch=amd64 ] file:/media/sigfried/Midgard/repo/mirror/ubuntu.uci.cu/ubuntu trusty main restricted universe multiverse" > /etc/apt/sources.list
   echo "deb [ arch=amd64 ] file:/media/sigfried/Midgard/repo/mirror/ubuntu.uci.cu/ubuntu trusty-security main restricted universe multiverse" >> /etc/apt/source.list
   echo "deb [ arch=amd64 ] file:/media/sigfried/Midgard/repo/mirror/ubuntu.uci.cu/ubuntu trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
   echo "deb [ arch=amd64 ] file:/media/sigfried/Midgard/repo/mirror/ubuntu.uci.cu/ubuntu trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
   echo "deb [ arch=amd64 ] file:/media/sigfried/Midgard/repo/mirror/ubuntu.uci.cu/ubuntu trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
   echo "Using local repositories"
elif [ "$1" = "-h" ]; then
	echo "Usage repo-change option"
	echo "options: [uci|offline]"
	echo "-h show this little help :)"
else
	echo "Please, select uci or offline"
fi	
