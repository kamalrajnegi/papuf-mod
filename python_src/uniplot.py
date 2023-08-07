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

    hd_one_bit = [0] * N

    for x in range(0,ll):
        one = resp1[x]
        ct = 0
        
        for y in range(0,len(one)-1):
                if one[y] != '1':
                    ct = ct + 1
                    hd_one_bit[y] = hd_one_bit[y] + 1
                    
    hd_one_bit = hd_one_bit[:N]
    max = [ll] * N
    avg = [int(ll/2)] * N
    ind = np.arange(N)  
    p1 = plt.bar(ind, max,color='yellow')
    p2 = plt.bar(ind, hd_one_bit,color='orange')
    p3 = plt.plot(ind,avg,color='black')
    plt.legend((p1[0], p2[0],p3[0]), ('0', '1', '50%'))