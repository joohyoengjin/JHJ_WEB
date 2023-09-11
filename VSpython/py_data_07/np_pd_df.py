import pandas as pd
import numpy as np

nums = [
    [1,1,1],
    [2,2,2],
    [3,3,3]
]
narr2 = np.array(nums) # numpy 자료형 변환
df = pd.DataFrame(narr2, columns=['수량','입고','판매'])
print(narr2)
print(df)