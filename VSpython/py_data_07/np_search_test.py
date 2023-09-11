import numpy as np

py_2d = [
    [1,0,1,0],
    [0,1,0,1],
    [1,0,1,0],
    [0,1,0,1]
]
# py_2d[r][c]
# print(py_2d)
np_arr2 = np.array(py_2d)
print('red:', np_arr2[:,3])
print('ora:', np_arr2[2,0:3])
print('yel:', np_arr2[0:2,1])
print('green:', np_arr2[3,2])
