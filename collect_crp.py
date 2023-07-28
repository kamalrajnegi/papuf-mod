import serial

ser = serial.Serial("COM18", 115200, timeout=10)

dummy = b'\x00'

data = 400

# ch = data.to_bytes(2, 'big')
# dat = ch + dummy
# ser.write(dat)
# data = ser.read(2)
# #print("length: ",len(data))
# print(data.hex())

f = open("data.txt", "w")

for data in range(20000,30000):
    ch = data.to_bytes(2, 'big')
    dat = ch + dummy
    ser.write(dat)
    data = ser.read(2)
    #print("length: ",len(data))
    print(data.hex())
    data = int.from_bytes(data)
    res = format(data, '016b')
    f.write(res)
    f.write("\n")

f.close()

ser.close()