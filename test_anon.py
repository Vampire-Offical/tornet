import requests
import os
from time import sleep
c=0
os.system('rm -rf /dev/shm/location.txt')


def getloc():
    ip = requests.get("https://icanhazip.com/").text
    print(ip)
    file = open('/dev/shm/location.txt', 'w')
    file.write(ip)
    file.close()



while True:
    try:
        getloc()
        break
    except:
        sleep(1)
        c+=1
        print(0)
        pass

