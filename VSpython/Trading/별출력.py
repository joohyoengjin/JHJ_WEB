# 문제3
# 파이썬 반복문을 이용하여 사각형을 출력하시오
# * * * * *
# * * * * *
# * * * * *
# * * * * *
# * * * * *

rows = 5
columns = 5

for i in range(rows):
    for j in range(columns):
        print("*", end=" ")
    print()
