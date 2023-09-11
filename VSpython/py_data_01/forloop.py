# 택시기사가 매일 10명의 손님을 받아서 영업
fare = [30000, 5000, 20000, 10000, 4500,
        6000, 9000, 10000, 22000, 6000]
total = 0 # ?

for i in range(10):
    # print(fare[i])
    total = total + fare[i]

print(total)