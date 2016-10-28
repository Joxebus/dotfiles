#!/bin/bash
if [ "$1" = "internet" ]; then
	export https_proxy="localhost:3128"
	export http_proxy="localhost:3128"
	npm config set proxy=http://localhost:3128
	npm config set https-proxy=http://localhost:3128
	npm config set registry "http://npmjs.com"
elif [ "$1" = "home" ]; then
	npm config set proxy=http://localhost:3128
	npm config set https-proxy=http://localhost:3128
	npm config set registry "http://localhost:8085/repository/localnpm"
elif [ "$1" = "university" ]; then
	npm config set proxy=http://localhost:3128
	npm config set https-proxy=http://localhost:3128
	npm config set registry "http://npm.prod.uci.cu/repository/npm-proxy"
elif [ "$1" = "-h" ]; then
	echo 'Usage proxy-change option'
	echo 'options: [internet|home|university]'
	echo '-h show this little help :)'
else
	echo 'Please, select home,internet or university'
fi	
