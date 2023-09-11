# 문제7
# 문자열 str과 정수 n이
# 주어집니다.

# str이 n번 반복된 문자열을
# 만들어 출력하는 코드를 작성해 보세요.


str_input = input("문자를 입력하세요: ")
n = int(input("반복 횟수를 입력하세요.: "))

repeated_string = str_input * n

print("출력:", repeated_string)
