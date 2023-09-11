# matplotlib 인스톨 후
import matplotlib.pyplot as plt

x_val = [1,2,3,4,5]
y_val = [2*x+2 for x in x_val]

plt.title('One dimension Equation')
plt.plot(x_val, y_val)
plt.show()