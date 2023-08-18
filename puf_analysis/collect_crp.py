"""
This Python script is for collecting CRP form PUF using UART connection
"""
import serial

challenge_width = 16
response_width = 128

response_width_byte = int(response_width/8)
challenge_width_byte = int(challenge_width/8)

initial_challenge = 0
final_challenge = 65536


filename = "./responses/gray_counter/data.txt"

# com_port = "COM18"
# com_port = "COM6"
com_port = "COM3"

baud_rate = 115200

ser = serial.Serial(com_port, baud_rate, timeout=2)
dummy = b'\x00'

# #-------------------- Code block to check UART Connection ----------------------
# data = 400
# ch = data.to_bytes(challenge_width_byte, 'big')
# dat = ch + dummy
# ser.write(dat)
# data = ser.read(response_width_byte)
# #print("length: ",len(data))
# print(data.hex())
# #-------------------------------------------------------------------------------

f = open(filename, "w")

for data in range(initial_challenge,final_challenge):
    challenge = data.to_bytes(challenge_width_byte, 'big')
    uart_write_data = challenge + dummy
    ser.write(uart_write_data)
    uart_read_data = ser.read(response_width_byte)
    print(uart_read_data.hex())
    # if(len(uart_read_data) != response_width):
    #     print("Desired response not received")
    #     break
    data = int.from_bytes(uart_read_data)
    format_type = '0'+str(response_width)+'b'
    res = format(data, format_type)
    f.write(res)
    if(data != final_challenge):
        f.write("\n")
f.close()

ser.close()