"""
run hdplot.py for complete plot
"""
import matplotlib.pyplot as plt
import numpy as np



def plot(filename):

    resp1 = []
    with open(filename, "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()

    ll = len(resp1)
    print(ll)
    N = len(resp1[0]) -1

    hdfile = []
    hd_one_bit = [0] * (N+1)
    for x in range(0,ll-1):
        one = resp1[x]
        two = resp1[x+1]
        ct = 0
        for y in range(0,N):
            if one[y] != two[y]:
                ct = ct + 1
                hd_one_bit[y] = hd_one_bit[y] + 1
        hdfile.append(ct)
    yaxis = [0] * (N+1)
    for x in range(0,len(hdfile)):
            #print(x)
        onedata = hdfile[x]
        if(onedata > 127):
            onedata = 128
        yaxis[onedata] = yaxis[onedata] + 1
    xaxis = np.linspace(0,N,N+1)
    for x in range(0,len(xaxis)):
        xaxis[x] = int(xaxis[x])
    # print("xaxis ", xaxis)
    # print("yaxis ", yaxis)
    # xaxis = xaxis[10:118]
    # yaxis = yaxis[10:118]
    # plt.plot(xaxis,yaxis, linestyle="dashed" , color="black", label="Arbiter PUF")
    plt.bar(xaxis,yaxis, color="blue", alpha = 1)

    
