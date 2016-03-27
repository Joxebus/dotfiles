#!/bin/bash

if [ "$1" = "work" ]; then
	export https_proxy="localhost:1080"
	export http_proxy="localhost:1080"
	npm config set proxy=http://localhost:1080
	npm config set https-proxy=http://localhost:1080
elif [ "$1" = "office" ]; then
	export https_proxy="proxy.enet.cu:1080"
	export http_proxy="proxy.enet.cu:1080"
	npm config set proxy=http://proxy.enet.cu:1080
	npm config set https-proxy=http://proxy.enet.cu:1080
elif [ "$1" = "default" ]; then
	export https_proxy="localhost:4128"
	export http_proxy="localhost:4128"
	npm config set proxy=http://localhost:4128
	npm config set https-proxy=http://localhost:4128
elif [ "$1" = "home" ]; then
	export https_proxy="localhost:1080"
	export http_proxy="localhost:1080"
	npm config set proxy=http://localhost:1080
	npm config set https-proxy=http://localhost:1080
	npm config set registry "http://localhost:4873"
elif [ "$1" = "-h" ]; then
	echo 'Usage proxy-change option'
	echo 'option: [work|office|default|home]'
	echo '-h show this little help :)'
else
	echo 'Please, select work or office or default'
fi	
		

