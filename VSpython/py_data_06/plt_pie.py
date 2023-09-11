import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
font_path ="C:/Windows/Fonts/NANUMMYEONGJO.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)
plt.rcParams['axes.unicode_minus'] = False

radio = [50, 25, 15, 10] #x_val 
labels = ['사과', '오징어', '오이', '블루베리']
colors = ['red', 'orange', 'green', 'violet']

plt.pie(radio, labels=labels, startangle=90, counterclock=False,
        colors=colors, autopct='%.1f%%')
plt.show()
