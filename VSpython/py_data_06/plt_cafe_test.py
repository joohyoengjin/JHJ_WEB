import matplotlib.pyplot as plt
from matplotlib import font_manager, rc

font_path = "C:\Windows\Fonts/NGULIM.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)


x_val = ['서울', '인천', '경기' , '대구' , '광주']
y_val = [500, 320, 490, 200, 340 ]

star_store = y_val

# # 제목: 시도별 스타벅스 매장갯수
# plt.title('시도별 스타벅스 매장갯수')
# plt.bar(x_val, y_val)
# plt.show()


x_val = range(-500,501) # 101 포함이 안됨

# 10 * 10 
y_val = [x*x for x in x_val]

plt.title('포물선') 
plt.plot(x_val, y_val)
plt.show()

