"""
This is the python script for plotting different plots for the PUF
"""

import matplotlib.pyplot as plt
import intraplot
import interplot
import relplot
import uniplot
import probplot

plot_type = input("Select Plot Type\n1. Intra HD Plot \n2. Inter HD plot \n3. Reliablity Plot \n4. Uniqueness Plot \n5. Probability Response")

if(plot_type == '1'):
    intraplot.plot()
    plt.xlabel("Intra-chip Hamming Distance")
    plt.ylabel("Similar Bit differences")
    plt.show()
elif(plot_type == '2'):
    interplot.plot()
    plt.xlabel("Inter-chip Hamming Distance")
    plt.ylabel("Similar Bit differences")
    plt.show()
elif(plot_type == '3'):
    relplot.plot()
    plt.xlabel("Hamming Distance of single CRP 128-bit SPA-PUF")
    plt.ylabel("Similar Bit differences")
    plt.show()
elif(plot_type == '4'):
    uniplot.plot()
    plt.xlabel("Response bit position")
    plt.ylabel("No. of responses")
    #plt.title("Inter-chip Hamming Distance Plot")
    plt.show()
elif(plot_type == '5'):
    probplot.plot()
    plt.xlabel("Response bit position")
    plt.ylabel("Probability of Getting 1 in PUF Response")
    #plt.title("Inter-chip Hamming Distance Plot")
    plt.show()
else:
    print("Cant Be plotted")
