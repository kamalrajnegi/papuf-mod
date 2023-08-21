import matplotlib.pyplot as plt
import numpy as np

resp1 = []

with open("../responses/binary_counter/spapuf_16_128_16_zybo.txt", "r") as f:
        line = f.readline()
        while line:
            resp1.append(line)
            line = f.readline()


total_challenges = 200
length_of_response = 128


data = []


for x in range(0,length_of_response):
      for y in range(0,total_challenges):
            temp = resp1[y]
            if(temp[x] == '0'):
                  data.append(0)
            else:
                  data.append(1)


data = np.reshape(data,(-1,total_challenges))
            
print(len(data))


plt.imshow(data,cmap="gray")
plt.xlabel("Challenge(n)")
plt.ylabel("Response Bit Position")
plt.colorbar(ticks = [0,1])
plt.show()