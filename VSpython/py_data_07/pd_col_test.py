import pandas as pd
import numpy as np

emp = {
    'emp_id': [1000,1100,1200,1300,1400],
    'name': ['김창섭', '박영권','이수민','조민희','최종철'],
    'salary': [25000, 30000, 40000, 30000, 30000],
    'dept_id': [2,1,2,2,3],
}

df = pd.DataFrame(emp)

# mng_id 추가 1:박영권id, 2:조민희id, 3:최종철id
df['mng_id'] = [1300,1100,1300,1300,1400]

# df['mng_id'] = pd.np.where(df['dept_id']==2, 1300, 
#                            pd.np.where(df['dept_id']==1, 1100, 1400))

# position : True(시니어), False(쥬니어) 
# 급여가 40000이상: True
df['position'] = df['salary'] >= 40000

# drop() 함수
df= df.drop('mng_id', axis=1)
print(df)
