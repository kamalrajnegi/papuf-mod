import matplotlib.pyplot as plt
import numpy as np
import plot_x



N = 16
M = 128
bit_position = 8

# #------------------------------------- arbiter PUF --------------------------
# resp1 = []
# with open("./responses/binary_counter/arbiter_16_16_16_zybo.txt", "r") as f:
#         line = f.readline()
#         while line:
#             resp1.append(line)
#             line = f.readline()
# hd_data = []
# count = 0
# for x in range(0,65536,8):
#     count = count + 1
#     dat = plot_x.int2bin(x)
#     # print("666666")
#     # print("Golden Data: ",dat)
#     golden = resp1[x][bit_position]
#     for y in range(0,N):
#         # dat[(N-1) - y] = dat[(N-1) - y] ^ 1
#         dat[y] = dat[y] ^ 1
#         # print("Golden + 1 ", dat)
#         comp = plot_x.bin2int(dat)
#         # print("Final challenge ", comp)
#         golden1 = resp1[comp][bit_position]
#         h = plot_x.hd(golden,golden1)
#         hd_data.append(h)
#         dat = plot_x.int2bin(x)

# xaxis = range(0,N)
# yaxis = [0] * N
# for x in range(0,N):
#     hdcount = 0
#     for y in range(x,len(hd_data),N):
#         temp = hd_data[y]
#         if(temp == 1):
#             hdcount = hdcount + 1
#     yaxis[x] = hdcount
# print(yaxis)
# for x in range(0,N):
#     yaxis[x] = yaxis[x]/count
# print(yaxis)
# yb = [0.5] * N
# # plt.ylim(0.34,0.35)
# plt.plot(xaxis,yaxis , label="Arbiter PUF")
# #----------------------------------------- PAPUF -----------------------------------
# resp1 = []
# with open("./responses/binary_counter/papuf_16_16_16_zybo.txt", "r") as f:
#         line = f.readline()
#         while line:
#             resp1.append(line)
#             line = f.readline()
# hd_data = []
# count = 0
# for x in range(0,65536,8):
#     count = count + 1
#     dat = plot_x.int2bin(x)
#     # print("666666")
#     # print("Golden Data: ",dat)
#     golden = resp1[x][bit_position]
#     for y in range(0,N):
#         # dat[(N-1) - y] = dat[(N-1) - y] ^ 1
#         dat[y] = dat[y] ^ 1
#         # print("Golden + 1 ", dat)
#         comp = plot_x.bin2int(dat)
#         # print("Final challenge ", comp)
#         golden1 = resp1[comp][bit_position]
#         h = plot_x.hd(golden,golden1)
#         hd_data.append(h)
#         dat = plot_x.int2bin(x)

# xaxis = range(0,N)
# yaxis = [0] * N
# for x in range(0,N):
#     hdcount = 0
#     for y in range(x,len(hd_data),N):
#         temp = hd_data[y]
#         if(temp == 1):
#             hdcount = hdcount + 1
#     yaxis[x] = hdcount
# print(yaxis)
# for x in range(0,N):
#     yaxis[x] = yaxis[x]/count
# print(yaxis)
# yb = [0.5] * N
# # plt.ylim(0.34,0.35)
# plt.plot(xaxis,yaxis , label="PA-PUF")

# #------------------------------------- pfpuf with ff -----------------
# resp1 = []
# with open("./responses/binary_counter/papuf_16_ff_16_16_zybo.txt", "r") as f:
#         line = f.readline()
#         while line:
#             resp1.append(line)
#             line = f.readline()
# hd_data = []
# count = 0
# for x in range(0,65536,8):
#     count = count + 1
#     dat = plot_x.int2bin(x)
#     # print("666666")
#     # print("Golden Data: ",dat)
#     golden = resp1[x][bit_position]
#     for y in range(0,N):
#         # dat[(N-1) - y] = dat[(N-1) - y] ^ 1
#         dat[y] = dat[y] ^ 1
#         # print("Golden + 1 ", dat)
#         comp = plot_x.bin2int(dat)
#         # print("Final challenge ", comp)
#         golden1 = resp1[comp][bit_position]
#         h = plot_x.hd(golden,golden1)
#         hd_data.append(h)
#         dat = plot_x.int2bin(x)

# xaxis = range(0,N)
# yaxis = [0] * N
# for x in range(0,N):
#     hdcount = 0
#     for y in range(x,len(hd_data),N):
#         temp = hd_data[y]
#         if(temp == 1):
#             hdcount = hdcount + 1
#     yaxis[x] = hdcount
# print(yaxis)
# for x in range(0,N):
#     yaxis[x] = yaxis[x]/count
# print(yaxis)
# yb = [0.5] * N
# # plt.ylim(0.34,0.35)
# plt.plot(xaxis,yaxis , label="PA-PUF with Feed-Forward")
#----------------------- spapuf --------------
resp1 = []
with open("./responses/binary_counter/spapuf_16_16_16_zybo.txt", "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()
hd_data = []
count = 0
for x in range(0,65536,8):
    count = count + 1
    dat = plot_x.int2bin(x)
    # print("666666")
    # print("Golden Data: ",dat)
    golden = resp1[x][bit_position]
    for y in range(0,N):
        # dat[(N-1) - y] = dat[(N-1) - y] ^ 1
        dat[y] = dat[y] ^ 1
        # print("Golden + 1 ", dat)
        comp = plot_x.bin2int(dat)
        # print("Final challenge ", comp)
        golden1 = resp1[comp][bit_position]
        h = plot_x.hd(golden,golden1)
        hd_data.append(h)
        dat = plot_x.int2bin(x)

xaxis = range(0,N)
yaxis = [0] * N
for x in range(0,N):
    hdcount = 0
    for y in range(x,len(hd_data),N):
        temp = hd_data[y]
        if(temp == 1):
            hdcount = hdcount + 1
    yaxis[x] = hdcount
print(yaxis)
for x in range(0,N):
    yaxis[x] = yaxis[x]/count
print(yaxis)
yb = [0.5] * N
# plt.ylim(0.34,0.35)
plt.plot(xaxis,yaxis , label="SPA-PUF")




yb = [0.5] * N
plt.plot(xaxis,yb , label="Ideal")
plt.xlabel("Bit Position")
plt.ylabel("SAC")
plt.legend()
plt.ylim([0, 1])
plt.show()