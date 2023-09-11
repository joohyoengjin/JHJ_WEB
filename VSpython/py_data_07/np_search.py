import numpy as np

py_data = [
    [11,12,13],
    [21,22,23],
    [31,32,33]
]
for c in range(3):
    print(py_data[0][c])

np_data = np.array(py_data)
print(np_data[0 , :]) # 1번행의 모든 데이터
# 2번째 열의 모든 행데이터
print(np_data[: , 1])