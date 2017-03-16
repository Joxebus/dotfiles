#!/bin/bash
if [ "$1" = "internet" ]; then
	export https_proxy="localhost:3131"
	export http_proxy="localhost:3131"
	npm config set proxy=http://localhost:3131
	npm config set https-proxy=http://localhost:3131
	npm config set registry "http://npmjs.com"
elif [ "$1" = "local" ]; then
	npm config set proxy=http://localhost:3131
	npm config set https-proxy=http://localhost:3131
	npm config set registry "http://localhost:8085/repository/localnpm"
    sed -i  -e "s/nexus.prod.uci.cu\/repository\/bower-proxy/localhost:8085\/repository\/bowerlocal/g" $HOME/.bowerrc 
elif [ "$1" = "university" ]; then
	npm config set proxy=http://localhost:3131
	npm config set https-proxy=http://localhost:3131
	npm config set registry "http://nexus.prod.uci.cu/repository/npm-proxy"
    sed -i -e "s/localhost:8085\/repository\/bowerlocal/nexus.prod.uci.cu\/repository\/bower-proxy/g" $HOME/.bowerrc
elif [ "$1" = "-h" ]; then
	echo 'Usage proxy-change option'
	echo 'options: [internet|local|university]'
	echo '-h show this little help :)'
else
	echo 'Please, select local, internet or university'
fi	
