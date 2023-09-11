# 막대 그래프
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

font_path ="C:/Windows/Fonts/NANUMMYEONGJO.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)

x = [2020, 2021, 2022, 2023, 2024]
y = [10, 20, 50, 70, 100]

# plt.plot : 라인그래프
plt.title('연도별 사용자수')
plt.bar(x, y, label='A-쇼핑몰')
plt.xlabel('연도')
plt.ylabel('사용자수')
plt.legend()
plt.show()
