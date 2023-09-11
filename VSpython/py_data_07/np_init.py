import numpy as np

# 매트릭스행렬 모든값 0
py_zero = [0 for i in range(5)]
np_zero = np.zeros(5)
np_zero2 = np.zeros(5, dtype=int)
# print(np_zero)
# print(np_zero2)

a = [1,2,3,4,5]
b = [6,7,8,9,10]
# c 행렬을 0으로 초기화 한 후 
# a + b의 값을 저장하고 출력
c = np.zeros(5)
c = np.array(a) + np.array(b)
# print(c)

np_zero_2d = np.zeros((3, 3)) # 2차원 형태 자주 나옴
np_zero_2d_2 = np.zeros((3, 3), dtype=int)
# print(np_zero_2d)
# print(np_zero_2d_2)

np_zero_3d = np.zeros((3, 3, 3)) # 2차원 형태 자주 나옴
print(np_zero_3d)
