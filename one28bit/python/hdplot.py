"""
This is the python script for plotting different plots for the PUF
"""

import matplotlib.pyplot as plt
import intraplot
import interplot
import relplot
import unqplot

plot_type = input("Select Plot Type\n1. Intra HD Plot \n2. Inter HD plot \n3. Reliablity Plot \n4. Uniqueness Plot \n")

if(plot_type == '1'):
    intraplot.plot()
    plt.title("Intra-chip Hamming Distance Plot")
    plt.show()
elif(plot_type == '2'):
    interplot.plot()
    plt.title("Inter-chip Hamming Distance Plot")
    plt.show()
elif(plot_type == '3'):
    relplot.plot()
    plt.title("Inter-chip Hamming Distance Plot")
    plt.show()
elif(plot_type == '4'):
    unqplot.plot()
    plt.title("Inter-chip Hamming Distance Plot")
    plt.show()
else:
    print("Cant Be plotted")