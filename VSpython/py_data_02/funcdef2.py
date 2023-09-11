# 1~N까지의 합을 구해서 출력하는 함수

def summation(n):
    total=0
    for i in range(1,n+1):
        total = total + i
    # print('합계는: ', total)
    return total

N=100
# summation(N)
result = summation(N)
print(result)