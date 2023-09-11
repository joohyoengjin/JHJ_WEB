import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
font_path ="C:/Windows/Fonts/NANUMMYEONGJO.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)
plt.rcParams['axes.unicode_minus'] = False

list_x = [1, 2, 3, 4, 5]
list_y = [10, 30, 15, 20, 5]

plt.scatter(list_x, list_y, marker='o', c='green', edgecolors='black')
plt.xlabel('날짜')
plt.ylabel('수량')
plt.show()