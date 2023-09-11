import pandas as pd
import numpy as np

def null_cnt(vec):
    null_vec = pd.isnull(vec)
    null_cnt = np.sum(null_vec)
    return null_cnt

data = [
    [1, None, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [None, 1, 1, 1, None]
]
col_name = ['AA','BB','CC']
# 데이터 프레임 만들고 누락된 값의 갯수 출력하시오

df = pd.DataFrame(data, col_name)
total = df.apply(null_cnt)
print(total)

