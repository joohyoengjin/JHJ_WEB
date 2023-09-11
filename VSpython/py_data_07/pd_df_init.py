import pandas as pd

dict = {
    'A' : [1,2,3],
    'B' : [4,5,6],
    'C' : [7,8,9],
}
df = pd.DataFrame(dict) # 행(숫자), 열(키), [리스트]
# print(df)

sr = pd.Series([1,2,3,4,5])
print(sr)
# 데이터 프레임으로 
df2 = sr.to_frame()
print(df2)