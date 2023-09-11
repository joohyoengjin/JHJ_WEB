import numpy as np
import pandas as pd

import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
font_path ="C:/Windows/Fonts/NANUMMYEONGJO.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)

# 1번: 서울에 있는 치킨집 xlsx 데이터를 읽어서 출력
xlsx_filename = 'data/치킨집_가공.xlsx'
df = pd.read_excel(xlsx_filename)

# print(df)
print(len(df))
print(df.columns) # 소재지전체주소 사업장명

# 2번: 구정보 동정보 
goo = []
dong = []
for addr in df['소재지전체주소']:
    goo.append(addr.split()[1]) # 인자값이 없음: 공백구분
    dong.append(addr.split()[2])

# print(dong)
# 구의 갯수(중복제거), 동의 갯수(중복제거)
# print(pd.unique(goo))
# print(pd.unique(dong))
uni_dong = pd.unique(dong)

# 3번: 각 동에서 치킨집 몇개씩 있나요?
dong_count = np.zeros(len(uni_dong))
result = pd.DataFrame(dong_count, columns=['chk_cnt'], index=uni_dong)

# 4번: 동별로 치킨집 갯수 세기
# for dong in uni_dong:
#     for address in df['소재지전체주소']:
#         if address.find(dong) != -1:

# for d in dong:
#     result.loc[d] += 1
# print(result)

df2 = pd.DataFrame(dong, columns=['dong'])
df = pd.concat([df, df2], axis=1)
df_group_dong = df.groupby('dong')['소재지전체주소'].count()
dong_sorted = list(df_group_dong.index)

#print(df_group_dong) # 시리즈

# 동별로 치킨집의 갯수를 bar 그래프와
# 비율을 pie 그래프로 나타내시오
x_pos = np.arange(len(uni_dong))
y_count = df_group_dong.to_list()

# 2개의 서브 plt
fig = plt.figure()
sub_plt1 = fig.add_subplot(2,1,1) # 행2 열1 수1
sub_plt1.set_xticklabels(dong_sorted, fontsize=8)
sub_plt2 = fig.add_subplot(2,1,2) # 행2 열1 수1


plt.subplot(2,1,1)
plt.bar(x_pos, y_count)
plt.xticks(x_pos, dong_sorted)

plt.subplot(2,1,2)
plt.pie(y_count, labels=dong_sorted, autopct='%.1f%%', textprops={'fontsize':6})

plt.show()


