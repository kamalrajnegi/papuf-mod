import numpy as np
import matplotlib.pyplot as plt


plot_type = input("1. Intra HD Plot \n2. Inter HD plot \n3. Reliablity Plot \n4. Uniqueness Plot \n")

if(plot_type == '1'):
    xdata = "Intra-chip Hamming Distance Plot"
elif(plot_type == '2'):
    xdata = "Inter-chip Hamming Distance Plot"
elif(plot_type == '3'):
    xdata = "Reliability Hamming Distance Plot"
elif(plot_type == '4'):
    xdata = "Uniqueness Distance Plot"
else:
    xdata = "Hamming Distance Plot"

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

hd_one_bit = [0] * 128

if(len(resp1) == len(resp2)):
    print("Number of responses are equal which is: ",len(resp1))
    if(len(resp1[0]) == len(resp2[0])):
        print("Number of width per response are equal which is: ",len(resp1[0]) -1)
        for x in range(0,ll):
            one = resp1[x]
            two = resp2[x]
            ct = 0
            for y in range(0,len(one)-1):
                if(plot_type == '4'):
                    if one[y] == '1':
                        hd_one_bit[y] = hd_one_bit[y] + 1
                else:
                    if one[y] != two[y]:
                        ct = ct + 1
                        hd_one_bit[y] = hd_one_bit[y] + 1

            hdfile.write(str(ct))
            hdfile.write("\n")


        hdfile.close()

        print("One bit HD", hd_one_bit)

        b = np.loadtxt("hdoutput.txt",dtype=int)

        #yaxis = np.zeros(16, dtype=int)
        yaxis = [0] * 128

        for x in range(0,len(b)):
            #print(x)
            onedata = b[x]
            if(onedata > 127):
                onedata = 128
            yaxis[onedata] = yaxis[onedata] + 1



        xaxis = np.linspace(0,127,128)

        print("Similar bit difference", yaxis)
        #print(xaxis)

        if(plot_type == '3'):
            xaxis = xaxis[:25]
            yaxis = yaxis[:25]

        if(plot_type == '4'):
            N = 128
            max = [20000] * 128
            avg = [10000] * 128
            ind = np.arange(N)  
            p1 = plt.bar(ind, max,color='yellow')
            p2 = plt.bar(ind, hd_one_bit,color='orange')
            p3 = plt.plot(ind,avg,color='black')
            plt.ylabel('No. of Responses')
            plt.xlabel('Response bit position')
            plt.title('Uniqueness Plot')
            #plt.xticks(ind, ('T1', 'T2', 'T3', 'T4', 'T5'))
            #plt.yticks(np.arange(0, 81, 10))
            plt.legend((p1[0], p2[0],p3[0]), ('0', '1', '50%'))

        plt.bar(xaxis,yaxis)
        plt.xlabel(xdata)
        plt.ylabel("Amount of similar bit differences")
        plt.show()
    else:
        print("Width is not matching")
else:
    print("Depth is not matching")

