# 1부터 100 까지 숫자 중에 짝수만 출력

input = list(range(1,101))
# print(input)
for i in input:
    if i%2 ==0:
        print(i, end=' ')