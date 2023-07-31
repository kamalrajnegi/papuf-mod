import serial


ser = serial.Serial('COM3', 115200,timeout=10)

data = 0

dummy = b'x'

ch = data.to_bytes(2, 'big')
dat = ch + dummy
ser.write(dat)
data = ser.read(16)
#print("length: ",len(data))
print(data.hex())