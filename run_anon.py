import os
from time import sleep
import requests


def getip():
    ip = requests.get("https://icanhazip.com/").text
    return ip



try:
    file = open('/dev/shm/location.txt', 'r')
    rel = file.read()
    file.close()
   
    c=os.popen('gksudo -S "torctl start" -m "please type your password"').read()   
    if c==None:
        os.system('notify-send "please provide valid password"')
    else:
        after_location = getip()
        if after_location == rel:
            os.system('notify-send "your location is not changed"')
            print("your location is not changed")
        else:
            print("location is changed")
            os.system('notify-send "location is changed"')

except:
    pass
    print("it is already started")
    os.system('notify-send "it is already started"')
