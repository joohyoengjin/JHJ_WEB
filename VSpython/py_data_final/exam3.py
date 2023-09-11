import pandas as pd

df1 = pd.read_csv('datago/201212_201412_주민등록인구및세대현황_연간.csv', encoding='cp949')
df2 = pd.read_csv('datago/201512_201712_주민등록인구및세대현황_연간.csv', encoding='cp949')
df2_mod = df2.drop(['행정구역'], axis=1)
df = pd.concat([df1, df2_mod], axis=1)
print(df2.head())
# print(df.size)

# 컬럼이름 확인 또는 갯수
print('컬럼갯수: ', len(df.columns))
print(df.iloc[1,0]) # 1열
# print(df.iloc[1,1]) # 2열 (2012년 조치원읍 총인구수)
# print(df.iloc[1,1+6]) # 8열 (2013년 조치원읍 총인구수)
#print(df.iloc[1,1+12]) # 14열 (2014년 조치원읍 총인구수) 
#print(df.iloc[1,1+18]) # 14열 (2015년 조치원읍 총인구수) 

print(df.iloc[1,range(1, len(df.columns), 6)])
