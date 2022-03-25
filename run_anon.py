
try:
    file = open('/dev/shm/location.txt', 'r')
    rel_loc = file.read()
except:
    pass