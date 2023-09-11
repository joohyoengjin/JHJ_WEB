# 문제 1)
n = int(input("일한 날: "))

fare_list = []

for i in range(n):
    fare = float(input(f"손님 수 {i+1}: "))
    fare_list.append(fare)

total_income = sum(fare_list)

print(f"총 수입: ${total_income}")

# 문제 2)
R = 5  
C = 5  

array = [[0 for _ in range(C)] for _ in range(R)]

value = 1
for i in range(R):
    for j in range(C):
        array[i][j] = value
        value += 1

for i in range(R):
    for j in range(C):
        print(array[i][j], end=" ")
    print()