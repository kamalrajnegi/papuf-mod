import serial
import time


challenge_width = 16
response_width = 16

response_width_byte = int(response_width/8)
challenge_width_byte = int(challenge_width/8)

initial_challenge = 0
final_challenge = 65536

com_port = "COM6"
baud_rate = 115200

ser = serial.Serial(com_port, baud_rate, timeout=10)
dummy = b'\x00'

#-------------------- Code block to check UART Connection ----------------------


f = open("random.txt","w")

for data in range(10000,20000):
    # data = 300
    ch = data.to_bytes(challenge_width_byte, 'big')
    dat = ch + dummy
    ser.write(dat)
    uart_read_data = ser.read(response_width_byte)
    #print("length: ",len(data))
    print(uart_read_data.hex())


    for x in range(0,8):

        dat = uart_read_data + dummy
        ser.write(dat)
        uart_read_data = ser.read(response_width_byte)
        #print("length: ",len(data))
        # print(uart_read_data.hex())
        data = int.from_bytes(uart_read_data)
        format_type = '0'+str(response_width)+'b'
        res = format(data, format_type)
        f.write(res)
    f.write("\n")
    # print("---------------------------")

f.close()

