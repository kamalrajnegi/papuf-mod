import serial
import time

ser = serial.Serial("COM4", 115200, timeout=1)

dummy = b'\x00'
dum = b'\x00\x00'

# data = 0

# ch = data.to_bytes(4, 'big')
# dat = ch + dummy
# ser.write(dat)
# data = ser.read(4)
# #print("length: ",len(data))
# print(data.hex())

write_response_file = 0

def writedummy():
    ser.write(dum)
    ddd = ser.read(4)
    print("length of ddd ",len(ddd))
    return ddd

flag = 0            #0 -> nothing ; 1: error; 2: write challenge again

f = open("data.txt", "w")
for data in range(1000000,2000000):
    ch = data.to_bytes(4, 'big')
    dat = ch + dummy
    ser.write(dat)
    data = ser.read(4)

    if(len(data) < 4):
        print("Flag generated")
        flag = 1
    else:
        flag = 0
    
    while(flag == 1):
        print("currupted data")
        time.sleep(2)
        data = writedummy()
        print(len(data))
        if(len(data) == 4):
            flag = 0
            print("Flag unclear")
            ser.write(dat)
            data = ser.read(4)
            if(len(data) < 4):
                flag = 1
                print("again currpted data")
            else:
                print("Data = ", data.hex())
        else:
            print("Received data length: ",len(data))
            print("Data = ", data.hex())
        if(flag == 0):
            print("breaking loop")
            break

    #print("length: ",len(data))
    print("We are here: ", data.hex())
    data = int.from_bytes(data)
    res = format(data, '032b')
    if(len(data == 4)):
        f.write(res)
        f.write("\n")
f.close()

ser.close()