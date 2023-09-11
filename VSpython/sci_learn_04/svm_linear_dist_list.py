# x점들과 직선의 거리 -> 최소
# w점들과 직선의 거리 -> 최소
import numpy as np
import math

x = [[2,3], [4,5]] # 0번째 , 1번째
w = [[7,1], [10,2]] # W까지 계산해서 최소값은 얼마냐?
nx = np.array(x)
print(nx)

a1 = 1
b1 = 2
c1 = 1
nx[:, 0] *= a1
nx[:, 1] *= b1
print(nx)

sum_abs = np.abs( np.sum(nx, axis=1) + c1 )
print(sum_abs)

dis = sum_abs / math.sqrt(a1**2+b1**2)

print(dis)

# 거리 리스트에서 최소값?
min_dis = np.min(dis)
print(min_dis)