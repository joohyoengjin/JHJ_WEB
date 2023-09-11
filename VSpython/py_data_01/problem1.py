# 택시기사가 오늘 받을 손님수를 입력하고 N
# N번 만큼 손님의 요금을 input 받아서
# 오늘의 총수입을 출력하시오
N = int(input('오늘의 손님수: '))
# print(N)
i = 1
total = 0

while(True):
    fare = int(input(str(i)+'번째 손님요금: '))
    total += fare
    i += 1
    if i > N:
        break
    

print('총수입은: ', total)