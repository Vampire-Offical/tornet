import os
from time import sleep
import requests


def getip():
    sleep(1)
    rel_loc_req = requests.get('https://json.geoiplookup.io/').json()
    rel_loc = rel_loc_req['country_name']
    return rel_loc 



try:
    file = open('/dev/shm/location.txt', 'r')
    rel = file.read()
    file.close()
   
    c=os.popen('gksudo -S "torctl restart" -m "please type your password"').read()   
    if c==None:
        os.system('notify-send "please provide valid password"')
    else:
        after_location = getip()
        if after_location == rel:
            os.system('notify-send "your location is not changed"')
            print(0)
        else:
            print(1)
            os.system('notify-send "location is changed"')

except:
    pass
    os.system('notify-send "please check your network connection"')
