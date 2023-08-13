"""
This Python script is for collecting CRP form PUF using UART connection
"""
import serial
import hamming

challenge_width = 16
response_width = 128

response_width_byte = int(response_width/8)
challenge_width_byte = int(challenge_width/8)

initial_challenge = 0
final_challenge = 65536

com_port = "COM6"
baud_rate = 115200

ser = serial.Serial(com_port, baud_rate, timeout=10)
dummy = b'\x00'

#-------------------- Code block to check UART Connection ----------------------
data = 400
ch = data.to_bytes(challenge_width_byte, 'big')
dat = ch + dummy
ser.write(dat)
uart_read_data = ser.read(response_width_byte)
#print("length: ",len(data))
print(uart_read_data.hex())
data = int.from_bytes(uart_read_data)
format_type = '0'+str(response_width)+'b'
res = format(data, format_type)

dat = []

for x in range(0,len(res)):
    if(res[x] == '1'):
        dat.append(1)
    else:
        dat.append(0)

syndrome = []

for x in range(0,len(dat),4):
    temp = hamming.encode([dat[x],dat[x+1],dat[x+2],dat[x+3]])
    syndrome.append(temp[0])
    syndrome.append(temp[1])
    syndrome.append(temp[2])

txtdata = ""
for x in range(0,len(syndrome)):
    if(syndrome[x] == 0):
        txtdata = txtdata + "0"
    else:
        txtdata = txtdata + "1"


f = open("syndrome.txt","w")
f1 = open("resp.txt", "w")
f.write(txtdata)
f1.write(res)

f1.close()

f.close()

#-------------------------------------------------------------------------------