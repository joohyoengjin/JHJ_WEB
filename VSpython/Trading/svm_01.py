import os
import numpy as np
import matplotlib.pyplot as plt

# 일관된 출력을 위해 유사난수 초기화
np.random.seed(42)


import matplotlib
import matplotlib.pyplot as plt
import seaborn as sn

sn.set()
plt.rcParams['axes.labelsize'] = 14
plt.rcParams['xtick.labelsize'] = 12
plt.rcParams['ytick.labelsize'] = 12


matplotlib.rc('font', family='Malgun Gothic')  # Windows
plt.rcParams['axes.unicode_minus'] = False