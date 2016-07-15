#!/usr/bin/python
# -*- coding: utf-8 -*
#TODO : When password or user are wrong raises a nasty exception
from lxml import html
from requests.exceptions import HTTPError, ConnectionError, SSLError, Timeout
import urllib, urllib2, string
import getpass, requests, requests.packages.urllib3

def parse_menu(root_element):
    for element in root_element:
        day = element.xpath('div[@class="thumbnail"]/p/text()')
	print day[0]
	menu = element.xpath('.//div[@class="caption"]/div[@class="checkbox"]')
	for i in range(3):
	    print menu[i].xpath('.//label[@class="forevent"]/text()')[0].replace('\t','')
	    print string.join(menu[i].xpath('.//p[@class="p-menu"]/em/text()'), '\n')
	print '\n'


def main():
    requests.packages.urllib3.disable_warnings()
 
    username = raw_input('User name: ')
    password = getpass.getpass()
    
    s = requests.session()
    try:
	res = s.post('http://reserva.uci.cu', auth=(username,password), verify=False)
    	r = s.get('http://reserva.uci.cu/menu/', timeout=0.10)
    	tree = html.fromstring(r.content) 
	root_element = tree.xpath('//div[@class="span4"]')
	parse_menu(root_element)
	
	res.raise_for_status()
    except (HTTPError, ConnectionError, SSLError, Timeout) as e:
	print e
	

if __name__ == '__main__':
    main()
