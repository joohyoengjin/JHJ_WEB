# 제목 :  함수 만들기 예제
# 개요 : 파이썬 문법을 연습 후 -> 주제로 프로그램 만들기 연습
# (예시 : 크롤링, 데이터분석, 시각화, 알고리즘, 간단한게임)

# 주제 : 심플게임 : 숫자맞추기
# 문제1 함수구현 : 1~ 100 까지의 랜덤한 숫자를 발생하는 함수

# 문제2 함수구현 : 랜덤한 숫자를 맞추는 함수
#                 숫자를 입력을 했는데 맞는경우
#                 함수가 끝나면서 결과를 리턴
            #     틀리는 경우
            #     다시 입력을 받아서 확인
            #     랜덤숫자 55 > 40 : 숫자를 더 올려라 (up)
            #     랜덤숫자 55 < 90 : 숫자를 더 내려라 (DOWN)
 
# 결과물 : 입력 횟수 : 5번 정답: 55 출력하고 GAME OVER
            
# 문제3 중복되지 않는 2자리 숫자 만드는 함수 generate_num()
# (예시 ) 34,78 (ok) 77,99(x)           
# 문제4 숫자 판별하는 함수 check_num()
# (예시 ) 34(랜덤숫자) - 입력 18 없음
# (예시 ) 34(랜덤숫자) - 입력 32 스트라이크
# (예시 ) 34(랜덤숫자) - 입력 35 스트라이크
# (예시 ) 34(랜덤숫자) - 입력 43 2볼



import random

def play_guessing_game():
    number = random.randint(1, 100)
    tries = 0
    n = 5  

    print("1~100 사이 업다운 게임.")

    while tries < n:
        guess = int(input("숫자를 입력하세요: "))
        tries += 1
        if number == guess:
            print("정답은? %d 시도." % tries)
            break
        elif number < guess:
            print("DOWN")
        elif number > guess:
            print("UP.")

    if tries >= n:
        print("GAME OVER. 정답은 %d." % number)

    play_again = input("재시작 (OK/55): ")
    if play_again.lower() == "OK":
        play_guessing_game()
    else:
        print("GAME OVER")

play_guessing_game()
