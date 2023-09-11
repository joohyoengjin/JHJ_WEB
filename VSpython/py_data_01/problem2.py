rows = 5
cols = 5
arr = [[0 for c in range(cols)] for r in range(rows)]

count = 1
for r in range(rows) :
    for c in range(cols) :
        arr[r][c] = count
        count += 1
        print(arr[r][c], end=' ')
    print()
