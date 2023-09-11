# for문으로 배열 초기화
rows = 5
arr = [0 for r in range(rows)]
print(arr)

cols = 4
arr2 = [[0 for c in range(cols)] for r in range(rows)]

for r in range(rows):
    for c in range(cols):
        print(arr2[r][c], end=' ')
    print()