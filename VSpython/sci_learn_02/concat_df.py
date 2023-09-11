# 예제에서는 데이터프레임을 서로 합치는 방법 소개
import pandas as pd

data1 = {
    'no' : [100,101,102,103],
    'name' : ['Micheal', 'Park', 'Jeremy', 'Zidane'],
    'salary' : [10000, 20000, 25000, 30000]
}
data2 = {
    '번호' : [104],
    '이름' : ['Kara'],
    '급여' : [15000]
}

df1 = pd.DataFrame(data1)
df2 = pd.DataFrame(data2)

# print(df1)
# print(df2)

#df3 = pd.concat([df1, df2]) # 같은 열끼리 합치는데 컬럼명이 다르므로
# 컬럼별로 개별적으로 합쳐진다
# 3  103.0   Zidane  30000.0    NaN   NaN      NaN
# 0    NaN      NaN      NaN  104.0  Kara  15000.0

# 컬럼명 동일하게 해서 합치면
df2.columns = ['no', 'name', 'salary']
df3 = pd.concat([df1, df2], ignore_index=True, axis=1) # 같은 열끼리 합치는데 컬럼명이 다르므로
print(df3)