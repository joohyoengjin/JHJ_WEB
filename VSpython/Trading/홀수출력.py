# 문제4
# 1~1000 사이의 정수 중에
# 홀수인 값만 모두 더하여 출력하시오

# 

odd_sum = 0


for num in range(1, 1001):
    if num % 2 != 0:  
        odd_sum += num


print("The sum of all odd numbers between 1 and 1000 is:", odd_sum)
