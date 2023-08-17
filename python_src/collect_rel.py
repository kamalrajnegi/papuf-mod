import serial
import os
import time

check_file = os.path.isfile('./reliability.txt')

if(check_file):
    f = open("reliability.txt", "a")
else:
    f = open("reliability.txt", "w")
    f.close()

ser = serial.Serial("COM3", 115200, timeout=2)
dummy = b'\x00'

data = 43690
ch = data.to_bytes(2, 'big')
dat = ch + dummy

for data in range(0,10000):
    ser.write(dat)
    data = ser.read(16)
    print(data.hex())
    data = int.from_bytes(data)
    res = format(data, '0128b')
    f.write(res)
    f.write("\n")
    time.sleep(0.1)

f.close()