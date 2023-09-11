import pandas as pd # pandas 모듈 가져오기 = 엑셀 = 대용량데이터와 연관

# 시리즈
L = [10,20,30,40,50]
a = pd.Series(L) # np.array(L) 유사
b = pd.Series(L, index=['aa','bb','cc','dd','ee'])
# print(a)
# print(type(a))
print(b) # 딕셔너리 경우 값
print(b.index) # 키값 확인

# 파이썬 - numpy - pandas 데이터를 서로 변환해서 사용가능
import numpy as np
narr1 = np.arange(10) # numpy 자료형
sr1 = pd.Series(narr1)
print(narr1)
print(sr1)

