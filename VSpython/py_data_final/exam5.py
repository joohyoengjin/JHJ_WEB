import pandas as pd

df = pd.read_csv('data/201212_201412_연령별인구현황_연간.csv', encoding='cp949')

print(df.iloc[1,0])
# print(df.iloc[1,6])
# print(df.iloc[1,34])

for r in range(1, len(df)):
    print(df.iloc[r,0])
    for c in range(len(df.columns)):
        if df.columns[c].endswith('년_거주자_30~39세'):
            print(df.iloc[r,c])
            
            
# 2017년에 인구수가 제일 많은 행정구역은 어디인가요?import pandas as pd

df = pd.read_csv('data/201712_201712_연령별인구현황_연간.csv', encoding='cp949')

print(df.iloc[1,0])
# print(df.iloc[1,6])
# print(df.iloc[1,34])

for r in range(1, len(df)):
    print(df.iloc[r,0])
    for c in range(len(df.columns)):
        if df.columns[c].endswith('년_계_총인구수'):
            print(df.iloc[r,c])