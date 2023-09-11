import numpy as np
py_2dim = [
    [1,2,3,4],
    [2,4,6,8],
    [3,5,7,9]
]
# 리스트의 행렬의 크기를 구하려면?
print('행:', len(py_2dim) )
print('열:', len(py_2dim[0]) )

#print(py_2dim)
narr2 = np.array(py_2dim)
# print(narr2*narr2)

# 행령의 크기는?
print('행렬의 크기:', narr2.shape)