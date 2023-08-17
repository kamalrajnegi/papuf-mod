import numpy as np
import matplotlib.pyplot as plt




def plot():
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

    ll = len(resp1)
    N = len(resp1[0]) -1



    hdfile = open("hdoutput.txt","w")

    hd_one_bit = [0] * (N+1)

    for x in range(0,ll):
        one = resp1[x]
        two = resp2[x]
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

    xaxis = np.linspace(0,N,N+1)
    print("This is x acis ", xaxis)
    plt.bar(xaxis,yaxis)
    #plt.bar(xaxis[40:88],yaxis[40:88])
    