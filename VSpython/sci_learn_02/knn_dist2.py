import numpy as np

x1, y1 = 10, 7
x2, y2 = 2, 3

x3, y3 = 13, 1
# p1-p3 거리 (비교) p2-p3 거리

def distance(a1, b1, a2, b2) :
    temp = (a1-a2)**2 + (b1-b2)**2
    result = np.sqrt(temp)
    return result

p1_p3 = distance(x1, y1, x3, y3)
print('p1-p3의 거리: ', p1_p3)
p2_p3 = distance(x2, y2, x3, y3)
print('p2-p3의 거리: ', p2_p3)