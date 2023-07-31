import numpy as np
import matplotlib.pyplot as plt


resp1 = []
resp2 = []

with open("./response.txt", "r") as f:
    line = f.readline()
    while line:
        resp1.append(line)
        line = f.readline()
with open("./response1.txt", "r") as f:
    line = f.readline()
    while line:
        resp2.append(line)
        line = f.readline()

hdfile = open("./hdoutput.txt","w")

ll = len(open("./response1.txt","r").readlines())

hd_one_bit = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

for x in range(0,ll-1):
    one = resp1[x]
    two = resp2[x]
    ct = 0
    for x in range(0,len(one)):
        if one[x] != two[x]:
            ct = ct + 1
            hd_one_bit[x] = hd_one_bit[x] + 1

    hdfile.write(str(ct))
    hdfile.write("\n")


hdfile.close()

print("One bit HD", hd_one_bit)

b = np.loadtxt("hdoutput.txt",dtype=int)

#yaxis = np.zeros(16, dtype=int)
yaxis = [0] * 16

for x in range(0,len(b)):
    #print(x)
    onedata = b[x]
    yaxis[onedata] = yaxis[onedata] + 1



xaxis = np.linspace(0,15,16)

print("Similar bit difference", yaxis)
#print(xaxis)

plt.bar(xaxis,yaxis)
plt.xlabel("Intra-chip HD Plot")
plt.ylabel("Amount of similar bit differences")
plt.show()