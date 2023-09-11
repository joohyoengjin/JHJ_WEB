import numpy as np

a = [
    [2,4,6],
    [3,6,9],
    [4,8,12],
]
# sqrt 제곱근
np_a = np.array(a)
result = np.sqrt(np_a)
print(result)

# 제곱은? 
result2 = np.power(np_a, 2) # np_a * np_a
print(np.square(np_a))
print(result2)

# 맥스값?
a = [
    [2,4,6],
    [3,6,9],
    [4,8,12],
]
result3 = np.max(np_a)
result4 = np.average(np_a)
print(result4)