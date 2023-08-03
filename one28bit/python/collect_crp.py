import serial

ser = serial.Serial("COM3", 115200, timeout=10)

dummy = b'\x00'

data = 400

# ch = data.to_bytes(2, 'big')
# dat = ch + dummy
# ser.write(dat)
# data = ser.read(2)
# #print("length: ",len(data))
# print(data.hex())

write_response_file = 0

f = open("data.txt", "w")



for data in range(20000,40000):
    ch = data.to_bytes(2, 'big')
    dat = ch + dummy
    ser.write(dat)
    data = ser.read(16)
    #print("length: ",len(data))
    print(data.hex())
    data = int.from_bytes(data)
    res = format(data, '0128b')
    f.write(res)
    f.write("\n")

f.close()

ser.close()