# 함수 만들기 

# 거리계산
# math.sqrt( (x1-x2)**2 + (y1-y2)**2 )
import math

def add(x, y):
    return x+y

def distance( x1, y1, x2, y2 ): # 좌표
    dist = math.sqrt( (x1-x2)**2 + (y1-y2)**2 )
    return dist

print( distance( 4,4, 2,2) )