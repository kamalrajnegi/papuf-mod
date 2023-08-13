import matplotlib.pyplot as plt

def bin2g(num):
    # num = num[::-1]
    dat = [0] * len(num)
    dat[0] = num[0]
    for x in range(1,len(num)):
        dat[x] = num[x-1] ^ num[x]
    return dat

def hd(number1,number2):
    dat = 0
    for x in range(0,len(number1)):
        if(number1[x] != number2[x]):
            dat = dat + 1
    return dat

def bin2int(seed):
    # seed = seed[::-1]
    num = 0
    for x in range(0,len(seed)):
        temp = seed[x]
        y = pow(2,x)
        num = num + (temp * y)
    num = int(num)
    return num


def int2bin(num):
    dat = [0] * 16

    for x in range(0,len(dat)):
        div = int(num/2)
        rem = int(num%2)
        dat[x] = rem
        num = div
    # dat = dat[::-1]
    return dat
        
#-----------------------------------------------------------

# N = 16
# M = 128

# resp1 = []

# with open("./response.txt", "r") as f:
#         line = f.readline()
#         while line:
#             resp1.append(line)
#             line = f.readline()


# hd_data = []
# count = 0

# for x in range(20000,50000):
#     count = count + 1
#     dat = int2bin(x)
#     # print("666666")
#     # print("Golden Data: ",dat)
#     golden = resp1[x][:M]

#     for y in range(0,N):
        
#         dat[y] = dat[y] ^ 1
#         # print("Golden + 1 ", dat)
#         comp = bin2int(dat)
#         # print(comp)
#         golden1 = resp1[comp][:M]
#         h = hd(golden,golden1)
#         hd_data.append(h)
#         dat = int2bin(x)
#     #     print("*****")
#     # print("----------")
#     # print(x)

# # print(count)
# # print(hd_data)
# # print(hd_data[:16])
# # print(hd_data[16:])

# xaxis = range(0,N)


# yaxis = [0] * N


# for x in range(0,N):
#     hdcount = 0
#     for y in range(x,len(hd_data),N):
#         temp = hd_data[y]
#         if(temp >= (M/2)):
#             hdcount = hdcount + 1
#     yaxis[x] = hdcount
#     print(hdcount)


# for x in range(0,N):
#     yaxis[x] = yaxis[x]/count

# print(yaxis)

# # plt.ylim(0.34,0.35)
# plt.plot(xaxis,yaxis)
# plt.scatter(xaxis,yaxis,color="red")
# plt.xlabel("Bit Position")
# plt.ylabel("SAC")

# plt.show()



# # print(bin2int(int2bin(6655)))