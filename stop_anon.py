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
   
    c=os.popen('gksudo -S "torctl stop" -m "please type your password"').read()   
    if c==None:
        os.system('notify-send "please provide valid password"')
    else:
        after_location = getip()
        if after_location != rel:
            print(getip())
            os.system('notify-send "your location is not changed"')
            print("your location is not changed")
        else:
            # print(1)
            print(getip())
            os.system('notify-send "location is changed"')

except :
    print(getip())
    # os.system('notify-send "I think your not already started the anon"')
    # print(e)
    pass

