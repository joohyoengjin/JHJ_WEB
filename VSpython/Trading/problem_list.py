# 2차원 R행(5) C열(5) 로 이루어진 리스트 배열을 선언하고 1~25까지 값을 대입한 후 저장된 값을 출력하시오
rows = 5  
cols = 5  


array = [[0 for _ in range(cols)] for _ in range(rows)]


value = 1
for r in range(rows):
    for c in range(cols):
        array[r][c] = value
        value += 1

for row in array:
    print(row)