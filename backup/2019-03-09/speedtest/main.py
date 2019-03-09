import asyncio
import csv
import os.path
from pprint import pprint

import speedtest

servers = []
# If you want to test against a specific server
# servers = [1234]


def do_the_speedtest():
    s = speedtest.Speedtest()
    print('[*] Finding best server to perform the test...')
    server = s.get_best_server()
    print('[!] Done, server chosen : {}\n'.format(server['name']))

    print('[*] Download test...')
    dl = s.download()
    print('[!] Download test finished : {:.3f} Mbps\n'.format(dl/(1024**2)))
    print('[*] Upload test...')
    up = s.upload()
    print('[!] Upload test finished : {:.3f} Mbps\n'.format(up/(1024**2)))
    print('[*] Generating image...')
    s.results.share()
    res = s.results.dict()
    print('[!] Done. `{}`\n'.format(res['share']))

    download = res['download']
    upload = res['upload']
    ping = res['ping']
    share = res['share']
    timestamp = res['timestamp']
    client_ip = res['client']['ip']
    client_isp = res['client']['isp']
    return {
        'download': download,
        'upload': upload,
        'ping': ping,
        'share': share,
        'timestamp': timestamp,
        'client_ip': client_ip,
        'client_isp': client_isp
    }


def save_to_csv(useful_informations):
    exists = os.path.isfile('stats_speedtest.csv')
    with open('stats_speedtest.csv',
              'a', newline="") as csv_file:
        writer = csv.writer(csv_file, delimiter=',')
        writer = csv.DictWriter(csv_file, useful_informations.keys())
        if not exists:
          writer.writeheader()
        writer.writerow(useful_informations)


useful_informations = do_the_speedtest()

print('[*] Writing stats to `stats_speedtest.csv`')
save_to_csv(useful_informations)
print('[!] Done.')
