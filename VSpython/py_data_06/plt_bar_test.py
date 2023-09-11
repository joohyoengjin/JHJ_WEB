# 막대 그래프
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

font_path ="C:/Windows/Fonts/NANUMMYEONGJO.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)

x_val = ['서울', '인천','경기','대구','광주'] 
y_val = [500, 320, 490, 200, 340]
star_store = y_val

plt.title('시도별 스타벅스 매장갯수')
plt.bar(x_val, y_val)
plt.xlabel('시도')
plt.ylabel('매장수')
plt.show()