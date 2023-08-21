"""
This is the python script for plotting different plots for the PUF
"""

import matplotlib.pyplot as plt
from plot_module import intraplot
from plot_module import interplot
from plot_module import relplot
from plot_module import uniplot
from plot_module import intrahd_multi_puf

plot_type = input("Select Plot Type\n1. Intra HD Plot \n2. Inter HD plot \n3. Reliablity Plot \n4. Uniqueness Plot \n5. Multiple Plot")

first_response_file = "./responses/binary_counter/data.txt"
second_response_file = "./responses/gray_counter/spapuf_16_128_16_edge.txt"
same_response_file = "./responses/reliability.txt"
uniformity_file = "./responses/binary_counter/arbiter_16_16_16_zybo.txt"

if(plot_type == '1'):
    intraplot.plot(first_response_file)
    plt.xlabel("Hamming Distance")
    plt.ylabel("Similar Bit Differences")
    plt.title("Intra-chip Hamming Distance Plot")
    plt.legend()
    plt.show()
elif(plot_type == '2'):
    interplot.plot(first_response_file,second_response_file)
    plt.xlabel("Inter-chip Hamming Distance")
    plt.ylabel("Similar Bit differences")
    plt.show()
elif(plot_type == '3'):
    relplot.plot(same_response_file)
    plt.xlabel("Hamming Distance of single CRP 128-bit SPA-PUF")
    plt.ylabel("Similar Bit differences")
    plt.show()
elif(plot_type == '4'):
    uniplot.plot(uniformity_file)
    plt.xlabel("Response bit position")
    plt.ylabel("No. of responses")
    #plt.title("Inter-chip Hamming Distance Plot")
    plt.show()
elif(plot_type == '5'):
    intrahd_multi_puf.plot()
else:
    print("Cant be plotted")
