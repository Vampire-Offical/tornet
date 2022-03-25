import requests
import os
from time import sleep
c=0
os.system('rm -rf /dev/shm/location.txt')
while True:
    try:
        rel_loc_req = requests.get('https://json.geoiplookup.io/').json()
        rel_loc = rel_loc_req['country_name']
        file = open('/dev/shm/location.txt', 'w')
        file.write(rel_loc)
        file.close()
        print( rel_loc)
        os.system('rm -rf tes')
        break
    except:
        sleep(1)
        c+=1
        print(0)
        pass

