import numpy as np


def relaiability(filename):
    print("-----------------------\nRelaibility calculation")
    resp1 = []
    with open(filename, "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()

    ll = len(resp1)
    N = len(resp1[0]) -1

    print("Length of response: ", N)
    print("Depth of responses: ", ll)

    hdfile = []
    hd_one_bit = [0] * (N+1)
    for x in range(1,ll):
        one = resp1[0]
        two = resp1[x]
        ct = 0
        for y in range(0,N):
            if one[y] != two[y]:
                ct = ct + 1
                hd_one_bit[y] = hd_one_bit[y] + 1
        hdfile.append(ct)

    sum = 0

    for x in range(0,len(hdfile)):
        dat = hdfile[x]
        per = (dat/N)*100
        sum = sum + per

    rel = sum/ll

    rel = 100 - rel

    return rel


def uniformity(filename):
    print("---------------\nuniformity calculation")
    resp1 = []

    with open(filename, "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()

    ll = len(resp1)
    N = len(resp1[0]) -1

    print("length of response ", N)
    print("Depth of respone ", ll)

    hd_one_bit = [0] * N

    for x in range(0,ll):
        one = resp1[x]
        ct = 0
        
        for y in range(0,N):
                if one[y] != '1':
                    ct = ct + 1
                    hd_one_bit[y] = hd_one_bit[y] + 1
                    
    uni = 0
    for x in range(0,len(hd_one_bit)):
        dat = hd_one_bit[x]
        dat = (dat/ll)*100
        uni = uni + dat
    
    uni = uni/N

    return uni


def uniqueness(file1,file2):
    print("====================\nUniqueness calculation")
    resp1 = []
    resp2 = []

    with open(file1, "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()

    with open(file2, "r") as f:
        line = f.readline()
        while line:
            resp2.append(line)
            line = f.readline()

    ll = len(resp1)
    N = len(resp1[0]) -1

    hdfile = []
    hd_one_bit = [0] * (N+1)
    for x in range(0,ll-1):
        one = resp1[x]
        two = resp2[x+1]
        ct = 0
        for y in range(0,N):
            if one[y] != two[y]:
                ct = ct + 1
                hd_one_bit[y] = hd_one_bit[y] + 1
        hdfile.append(ct)

        sum = 0

    for x in range(0,len(hdfile)):
        dat = hdfile[x]
        per = (dat/N)*100
        sum = sum + per

    rel = sum/ll

    rel = 100 - rel

    return rel



def bitaliasing(file1,file2):
    print("====================\nBit Aliasing calculation")
    resp1 = []
    resp2 = []

    with open(file1, "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()

    with open(file2, "r") as f:
        line = f.readline()
        while line:
            resp2.append(line)
            line = f.readline()

    ll = len(resp1)
    N = len(resp1[0]) -1


    hd_one_bit = [0] * N

    for x in range(0,ll):
        one = resp1[x]
        two = resp2[x]

        ct = 0
        
        for y in range(0,N):
                if one[y] != two[y]:
                    ct = ct + 1
                    hd_one_bit[y] = hd_one_bit[y] + 1
                    
    uni = 0
    for x in range(0,len(hd_one_bit)):
        dat = hd_one_bit[x]
        dat = (dat/ll)*100
        uni = uni + dat
    
    uni = uni/N

    return uni




    


same_response_filename = "./responses/reliability.txt"
response_filename = "./responses/gray_counter/spapuf_16_128_16_zybo.txt"
response_filename2 = "./responses/gray_counter/spapuf_16_128_16_edge.txt"


print("Relaibility = ", relaiability(same_response_filename))
print("Uniformity = ", uniformity(response_filename))
print("Uniqueness = ", uniqueness(response_filename,response_filename2))
print("Bit Aliasing = ", bitaliasing(response_filename,response_filename2))