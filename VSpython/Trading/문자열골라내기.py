# 문제6
# 숫자와 문자가 섞인 문자열을 입력받아서 숫자가 아닌 문자의 개수를 구하시오


input_string = "A1B1C1D1A2B2C2D2"


non_digit_count = 0

for char in input_string:
    if not char.isdigit():
        non_digit_count += 1


print("Number of non-digit characters:", non_digit_count)
