#!/usr/bin/python
# -*- coding: utf-8 -*
import getpass
import string
import datetime
import json
import sys

import requests
import requests.packages.urllib3
from lxml import html
from requests.exceptions import HTTPError, ConnectionError, SSLError, Timeout

#TODO: When printing, expect for user to print next days menus
def parse_menu(root_element):
    for element in root_element:
        day = element.xpath('div[@class="thumbnail"]/p/text()')
        print day[0]
        menu = element.xpath('.//div[@class="caption"]/div[@class="checkbox"]')
        for i in range(3):
            print menu[i].xpath('.//label[@class="forevent"]/text()')[0].replace('\t', '')
            print string.join(menu[i].xpath('.//p[@class="p-menu"]/em/text()'), '\n')
        print '\n'


def dates_range(max_range=31):
    base = datetime.datetime.now()
    date_range = [base + datetime.timedelta(days=x) for x in range(1, max_range)]
    return date_range


def make_reservations(session, username):
    
    password = getpass.getpass()

    try:
        res = session.post('http://reserva.uci.cu', auth=(username, password), verify=False)
        res.raise_for_status()

        dates = dates_range()
        json_container = []
        for date in dates:
            json_container.append({'id': 'r_' + date.strftime('%Y-%m-%d'), 'events': [{'event': '0', 'confirmed': 0},
                    {'event': '1', 'confirmed': 0}, {'event': '2', 'confirmed': 0}],
                            'date': date.strftime('%d-%m-%Y')})

        reserve_json = json.JSONEncoder().encode(json_container)
        params = {'data': reserve_json}
        headers = {'content-type': 'application/json'}
        reserve = session.post('http://reserva.uci.cu/reservar', params=params, headers=headers)

        if reserve.json()['success']:
            print 'Reservacion exitosa ;)'
        else:
            print 'Ha ocurrido un error al tratar de reservar, inténtelo de nuevo'
    except (HTTPError, ConnectionError, SSLError, Timeout) as e:
        print e


def consultar_menu(session, username):
    requests.packages.urllib3.disable_warnings()

    password = getpass.getpass()

    try:
        res = session.post('http://reserva.uci.cu', auth=(username, password), verify=False)
        r = session.get('http://reserva.uci.cu/menu/', timeout=0.60)
        tree = html.fromstring(r.content)
        root_element = tree.xpath('//div[@class="span4"]')
        
        if root_element == []:
            print 'No hay menús que mostrar'
        else:
            parse_menu(root_element)
        
        res.raise_for_status()
    except (HTTPError, ConnectionError) as e:
        print 'Debe estar on-line para consultar el menú ;)'
    except (SSLError) as e:
        print 'Usuario o contrasenha inválidos'
    except Timeout as e:
        print 'El servidor está demorando en responder, inténtelo luego'
        

def main():
    s = requests.session()
    opcion = -1
    print 'Qué desea hacer?'
    username = sys.argv[1]
    while opcion != 3:
        menu_app()
        try:
            opcion = int(raw_input('Opcion----> '))
        except ValueError as e:
            print 'Introduzca un valor numérico \n'
            continue
        if opcion == 1:
            consultar_menu(s, username)
        elif opcion == 2:
            make_reservations(s, username)
        elif opcion == 3:
            print 'Au revoir'
            exit(0)
        else:
            print 'Seleccione una opción\n'


def menu_app():
    print '1-Consultar menú'
    print '2-Reservar para la eternidad :D'
    print '3-Sácame de aquí :('


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print 'Usage: reserva username'
        exit(0)
    else: 
        main()
