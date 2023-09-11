# 타이타익 데이터를 이용한 apply 메소드 예제
# 누락데이터가 있음
import pandas as pd
import numpy as np

# 데이터의 누락갯수를 파악하는 함수
def count_miss(vec) :
    null_vec = pd.isnull(vec)
    null_cnt = np.sum(null_vec)
    return null_cnt
# 누락의 비율을 계산
def prop_miss(vec):
    cnt = count_miss(vec) # 누락갯수
    total = vec.size # pd의 총갯수
    return cnt / total

# 누락되지 않는 데이터 비율을 계산
def percent_complete(vec):
    return 1- prop_miss(vec)
    # cnt = vec.count() # 컬럼별로 갯수
    # total = vec.size
    # return cnt / total
    

df = pd.read_csv('data/titanic.csv')
#print(df.info())
#print(df['Parch']) # parents & child 수
total_miss = df.apply(count_miss)
row_miss = df.apply(count_miss, axis=1)
# print(total_miss)
print(row_miss)

percent_miss = df.apply(prop_miss)
percent_row = df.apply(prop_miss, axis=1)
#print(percent_miss)
#print(percent_row)

percent_comp = df.apply(percent_complete)
percent_comp_row= df.apply(percent_complete, axis=1)
# print(percent_comp)
print(percent_comp_row)

