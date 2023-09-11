N = int(input("받을 손님 수: "))
fare = []

for i in range(N):
    fare.append(int(input("요금 {}: ".format(i + 1))))

total_income = sum(fare)
print("총 수입:", total_income)