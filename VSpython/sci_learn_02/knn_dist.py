# knn - 분류를 위한 거리 계산 모델식

import numpy as np

x1, y1 = 10, 7
x2, y2 = 2, 3
xd = x1 - x2
yd = y1 - y2
temp = xd**2 + yd**2
dis_p1p2 = np.sqrt(temp)
print(dis_p1p2)