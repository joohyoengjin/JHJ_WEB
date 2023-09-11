# 1부터 100 까지 숫자 중에 짝수만 출력
for i in range(100, 0 , -2):
     print(i)
        
for i in range(100,0,-1):
     if i%2==0:
         print(i)
        
for i in range(1, 101):
     if i % 2 == 0:
         print(i)
        
for i in range(1,101):
    if i%2==0:
        print(i)
        
 
input = list(range(1,101))

for i in input:
    if i%2 ==0:
        print(i, end=' ')