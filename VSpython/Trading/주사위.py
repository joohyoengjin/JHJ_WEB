# 문제1 

# 주사위를 2번 던졌을 때 랜덤하게 나오는 두 개의 숫자를 더하여 출력하는 코드를 구현하시오

# 결과1

# 주사위1: 5
# 주사위2: 6
# 두수의 합은: 11


import random


dice_1 = random.randint(1, 6)
dice_2 = random.randint(1, 6)


sum_of_dice = dice_1 + dice_2


print("첫번 째 주사위:", dice_1)
print("두번 째 주사위:", dice_2)
print("두 주사위의 합:", sum_of_dice)
