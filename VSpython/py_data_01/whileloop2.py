# 임의의 숫자를 넣고 그 숫자까지 합을 구하거나
# 0을 입력하면 프로그램을 종료하도록 구현
total = 0
num = int(input('숫자를 입력하시오: '))
# print(num)
while( num!=0 ) :
    total = total + num
    num = int(input('숫자를 입력하시오: '))
    
print('입력한 값의 합은: ', total)