import math
# x1, y1 점과 직선의 거리
# x2, y2 점과 직선의 거리

def dist(a, b, c, x, y):
    d =abs(a*x+b*y+c) / math.sqrt(a**2 + b**2)
    return d

# 직선의 계수
a1 = 1
b1 = 2
c1 = 1
# 첫번째 좌표
x1, y1 = 2, 3
x2, y2 = 4, 5

# 거리계산
d1 = dist(a1, b1, c1, x1, y1)
print(d1)
d2 = dist(a1, b1, c1, x2, y2)
print(d2)