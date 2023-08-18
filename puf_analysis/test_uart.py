import serial


ser = serial.Serial("COM3", 115200, timeout=2)

ser.write(b'\x00')

data = ser.read(16)

print(data)
