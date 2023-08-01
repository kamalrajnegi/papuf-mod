import numpy as np
import matplotlib.pyplot as plt



def plotthis(x,y,t):
    plt.xlabel(x)
    plt.ylabel(y)
    plt.title(t)
    plt.show()


plot_type = input("Select Plot Type\n1. Intra HD Plot \n2. Inter HD plot \n3. Reliablity Plot \n4. Uniqueness Plot \n")

N = 0 #No of response bits

if(plot_type == '1'):
    xdata = "Intra-chip Hamming Distance Plot"
    ydata = "Amount of similar bit differences"
    title = ""
elif(plot_type == '2'):
    xdata = "Inter-chip Hamming Distance Plot"
    ydata = "Amount of similar bit differences"
    title = ""
elif(plot_type == '3'):
    xdata = "Reliability Hamming Distance Plot"
    ydata = "Amount of similar bit differences"
    title = ""
elif(plot_type == '4'):
    xdata = "Uniqueness Distance Plot"
    ydata = "Amount of similar bit differences"
    title = ""
else:
    xdata = "Hamming Distance Plot"
    ydata = "Amount of similar bit differences"
    title = ""

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

N = len(resp1[0]) - 1


hd_one_bit = [0] * 129


if(len(resp1) == len(resp2)):
    print("Number of responses are equal which is: ",len(resp1))
    if(len(resp1[0]) == len(resp2[0])):
        print("Number of width per response are equal which is: ", N)
        for x in range(0,ll):
            one = resp1[x]
            if(plot_type == '3'):
                two = resp1[0]
            else:
                two = resp2[x]
            ct = 0
            for y in range(0,len(one)-1):
                if(plot_type == '1' or plot_type == '2'):
                    if one[y] != two[y]:
                        ct = ct + 1
                        hd_one_bit[y] = hd_one_bit[y] + 1
                elif(plot_type == '3'):
                    if one[y] != two[y]:
                        ct = ct + 1
                        hd_one_bit[y] = hd_one_bit[y] + 1
                elif(plot_type == '4'):
                    if one[y] == '1':
                        hd_one_bit[y] = hd_one_bit[y] + 1
                else:
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


        if(plot_type == '1'):
            plt.bar(xaxis,yaxis)
            plotthis(xdata,ydata,title)
        elif(plot_type == '2'):
            plt.bar(xaxis,yaxis)
            plotthis(xdata,ydata,title)
        elif(plot_type == '3'):
            xaxis = xaxis[:25]
            yaxis = yaxis[:25]
            plt.bar(xaxis,yaxis)
            plotthis(xdata,ydata,title)
        elif(plot_type == '4'):
            hd_one_bit = hd_one_bit[:128]
            max = [20000] * 128
            avg = [10000] * 128
            ind = np.arange(N)  
            p1 = plt.bar(ind, max,color='yellow')
            p2 = plt.bar(ind, hd_one_bit,color='orange')
            p3 = plt.plot(ind,avg,color='black')
            plt.legend((p1[0], p2[0],p3[0]), ('0', '1', '50%'))
            plotthis(xdata,ydata,title)
        else:
            print("It can't not be Plotted")
    
    else:
        print("Width is not matching")
else:
    print("Depth is not matching")