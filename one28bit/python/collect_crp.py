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


if write_response_file:
    data = []
    with open("./data.txt", "r") as f:
        line = f.readline()
        while line:
            data.append(line)
            line = f.readline()
    r1 = open("response.txt","w")
    r2 = open("response1.txt", "w")

    for x in range(0,len(data)-1):
        r1.write(data[x])
        r2.write(data[x+1])
    
    r1.close()
    r2.close()

ser.close()