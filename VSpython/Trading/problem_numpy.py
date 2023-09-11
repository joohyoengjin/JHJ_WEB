# 문제 1
# 정수값 255로 된 10* 10 행렬을 만들어서 출력

# 문제2
# 넘파이 사용해서 구구단 출력하기

# 문제3
# 5*5 행렬에 1부터~ 25까지 차례대로 저장하고 15 값이 있는 위치를 출력하시오

# 문제 1 
import numpy as np

matrix = np.full((10, 10), 255)

print(matrix)

# 문제 2
import numpy as np

values = np.arange(1, 10)

for i in values:
    multiplication_table = np.outer(np.arange(1, 10), i)
 
    print(f"{i}단:")
    print(multiplication_table)
    
# 문제 3
import numpy as np

matrix = np.arange(1, 26).reshape(5, 5)

print("행렬:")
print(matrix)

position = np.argwhere(matrix == 15)

print("행렬에서 15의 위치:", position)


