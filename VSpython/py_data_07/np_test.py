import numpy as np

narr = np.array([1,2,3,4,5,6])

# print(type([1,2,3,4,5,6]))
# print(type(narr))

a = [ 10, 20, 30]
b = [ 100, 200, 300]
# 매트릭스 행렬의 합을 구하시오
# c = [0, 0, 0]
# for i in range(3):
#     c[i] = a[i] + b[i]
# print(c)
print( np.array(a) + np.array(b) )

# 나머지?
print( np.array(a) % 2)