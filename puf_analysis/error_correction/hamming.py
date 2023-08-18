def encode(data):
    if(len(data))>4:
        return 0
    
    syndrome = [0] * 3

    p0 = data[0] ^ data[1] ^ data[3]
    p1 = data[0] ^ data[2] ^ data[3]
    p2 = data[1] ^ data[2] ^ data[3]

    syndrome[0] = 1^p0
    syndrome[1] = 1^p1
    syndrome[2] = 1^p2


    return syndrome


def decode(data,syndrome):

    p0 = data[0] ^ data[1] ^ data[3] ^ syndrome[0] ^ 1
    p1 = data[0] ^ data[2] ^ data[3] ^ syndrome[1] ^ 1
    p2 = data[1] ^ data[2] ^ data[3] ^ syndrome[2] ^ 1

    return [p0,p1,p2]


def correct(data,parity):
    if(parity == [1,1,0]):
        data[0] = 1 ^ data[0]
    elif(parity == [1,0,1]):
        data[1] = 1 ^ data[1]
    elif(parity == [0,1,1]):
        data[2] = 1 ^ data[2]
    elif(parity == [1,1,1]):
        data[3] = 1 ^ data[3]  
    elif(parity == [0,0,0]):
        data = data
    else:
        print("Can't correct")
    
    return data

# data = [0,0,0,0]
# syndrome = encode(data)
# data = [0,0,0,1]
# dec = decode(data,syndrome)
# print(correct(data,dec))