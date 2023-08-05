import serial

ser = serial.Serial("COM4", 115200, timeout=10)

dummy = b'\x00'

# data = 0

# ch = data.to_bytes(4, 'big')
# dat = ch + dummy
# ser.write(dat)
# data = ser.read(4)
# #print("length: ",len(data))
# print(data.hex())

write_response_file = 0

f = open("data.txt", "w")
for data in range(10000,30000):
    ch = data.to_bytes(4, 'big')
    dat = ch + dummy
    ser.write(dat)
    data = ser.read(4)
    #print("length: ",len(data))
    print(data.hex())
    data = int.from_bytes(data)
    res = format(data, '032b')
    f.write(res)
    f.write("\n")
f.close()

ser.close()