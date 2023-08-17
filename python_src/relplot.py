import numpy as np
import matplotlib.pyplot as plt


def plot():
    resp1 = []

    with open("./reliability.txt", "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()


    ll = len(resp1)
    N = len(resp1[0]) -1



    hdfile = open("hdoutput.txt","w")

    hd_one_bit = [0] * 129

    for x in range(0,ll):
        one = resp1[x]
        two = resp1[0]
        ct = 0
        for y in range(0,len(one)):
                if one[y] != two[y]:
                    ct = ct + 1
                    hd_one_bit[y] = hd_one_bit[y] + 1
        hdfile.write(str(ct))
        hdfile.write("\n")
    hdfile.close()
    b = np.loadtxt("hdoutput.txt",dtype=int)
    #yaxis = np.zeros(16, dtype=int)
    yaxis = [0] * (N+1)

    for x in range(0,len(b)):
        #print(x)
        onedata = b[x]
        if(onedata > 127):
            onedata = 128
        yaxis[onedata] = yaxis[onedata] + 1

    xaxis = np.linspace(0,N-1,N+1)

    xaxis = xaxis[0:20]
    yaxis = yaxis[0:20]
    yax = [ll, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    plt.bar(xaxis,yaxis,color="red", label="Error in PUF response")
    plt.plot(xaxis,yaxis,color="blue", linestyle='dashed')
    # plt.bar(xaxis,yax, label="Response with ECC", alpha=0.8,color="green")
    plt.legend()