import serial
import hamming

synd = []
resp = []

with open("./syndrome.txt", "r") as f:
    line = f.readline()
    while line:
        synd.append(line)
        line = f.readline()

with open("./resp.txt", "r") as f:
    line = f.readline()
    while line:
        resp.append(line)
        line = f.readline()

syn = []
res = []

for x in range(0,len(synd[0])):
    if(synd[0][x] == '1'):
        syn.append(1)
    else:
        syn.append(0)

# for x in range(0,len(resp[0])):
#     if(resp[0][x] == '1'):
#         res.append(1)
#     else:
#         res.append(0)

#---------------------------------------- Read CRP ----------------------------
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


count = 0

corrected = []

for x in range(0,len(dat),4):
    
    ss = hamming.decode([dat[x],dat[x+1],dat[x+2],dat[x+3]],[syn[count],syn[count + 1],syn[count + 2]])
    # print(ss)
    cc = hamming.correct([dat[x],dat[x+1],dat[x+2],dat[x+3]],ss)
    
    corrected.append(cc[0])
    corrected.append(cc[1])
    corrected.append(cc[2])
    corrected.append(cc[3])
    count = count + 3



txtdata = ""
for x in range(0,len(corrected)):
    if(corrected[x] == 0):
        txtdata = txtdata + "0"
    else:
        txtdata = txtdata + "1"

if(txtdata == resp[0]):
    print("respone is matching")
else:
    print("Not matching")

print("Golden Response ", resp[0])
print("Corrected respn ", txtdata)