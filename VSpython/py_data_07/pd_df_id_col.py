# 데이터프레임을 만들거나 가져오면 
# 다루서 처리하려면 index, columns
import pandas as pd
df = pd.DataFrame(
    {'AAA': ['김김김', '박박박', '길길길'],
     'BBB': [1, 2, 3],
     'CCC': [100, 200, 300], }
)
# print(df)
# print(df.columns)
# print(df.index)

#가져오기
b_col = df['BBB']
df['BBB'] = [2,4,6]
df['BBB'] = [[1,2],[2,4],[3,6]]
print(df)