import numpy as np
import matplotlib.pyplot as plt


def plot():
    resp1 = []

    with open("./response.txt", "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()

    ll = len(resp1)
    N = len(resp1[0]) -1

    hd_one_bit = [0] * 129

    for x in range(0,ll):
        one = resp1[x]
        ct = 0
        for y in range(0,len(one)):
                if one[y] != '1':
                    ct = ct + 1
                    hd_one_bit[y] = hd_one_bit[y] + 1

    xaxis = np.linspace(0,N-1,N+1)

    hd_one_bit = hd_one_bit[:128]
    max = [65536] * 128
    avg = [32768] * 128
    ind = np.arange(N)  
    p1 = plt.bar(ind, max,color='yellow')
    p2 = plt.bar(ind, hd_one_bit,color='orange')
    p3 = plt.plot(ind,avg,color='black')
    plt.legend((p1[0], p2[0],p3[0]), ('0', '1', '50%'))