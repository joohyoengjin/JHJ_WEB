def addition(a, b):
    return a + b

def subtraction(a, b):
    return a - b

def multiplication(a, b):
    return a * b

def division(a, b):
    if b != 0:
        return a / b
    else:
        return "0으로 나눌 수 없음"

def calculator():
    while True:
        print("원하는 연산을 선택하세요:")
        print("+. 덧셈")
        print("-. 뺄셈")
        print("x. 곱셈")
        print("/. 나눗셈")
        print("0. 종료")

        choice = input("선택하세요 (+ . - . x . / . 0): ")

        if choice == '0':
            print("계산기를 종료합니다.")
            break

        if choice in ('+', '-', 'x', '/'):
            try:
                a = float(input("첫 번째 숫자를 입력하세요.: "))
                b = float(input("두 번째 숫자를 입력하세요.: "))

                if choice == '+':
                    result = addition(a, b)
                    operator = '+'
                elif choice == '-':
                    result = subtraction(a, b)
                    operator = '-'
                elif choice == 'x':
                    result = multiplication(a, b)
                    operator = '*'
                elif choice == '/':
                    result = division(a, b)
                    operator = '/'

                print(f"{a} {operator} {b} = {result}")

            except ValueError:
                print("잘못된 입력. 유효한 숫자를 입력하세요..")
        else:
            print("잘못된 선택입니다. 유효한 작업을 선택하세요..")

if __name__ == "__main__":
    calculator()
