#!/bin/bash
if [ "$1" = "internet" ]; then
	export https_proxy="localhost:3128"
	export http_proxy="localhost:3128"
	npm config set proxy=http://localhost:3128
	npm config set https-proxy=http://localhost:3128
	npm config set registry "http://npmjs.com"
elif [ "$1" = "home" ]; then
	export https_proxy="localhost:3128"
	export http_proxy="localhost:3128"
	npm config set proxy=http://localhost:3128
	npm config set https-proxy=http://localhost:3128
	npm config set registry "http://npm.prod.uci.cu/nexus/content/groups/npm/"
elif [ "$1" = "-h" ]; then
	echo 'Usage proxy-change option'
	echo 'options: [internet|home]'
	echo '-h show this little help :)'
else
	echo 'Please, select home or internet'
fi	
		

