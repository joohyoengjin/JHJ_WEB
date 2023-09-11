import pandas as pd
import numpy as np

df = pd.DataFrame(
    {
        'aaaa': [10,20],
        'bbbb': [10,30],
        'cccc': [10,50]
    }
)
# 컬럼명변경 rename
#df.index = ['A', 'B']
df.columns = ['한국','중국','일본']
df2 = pd.DataFrame({
    '한국': [30,30], '중국':[50,50], '일본': [100,100]
})
# print(df)
# print(df2)
print(df.append(df2, ignore_index=True))

