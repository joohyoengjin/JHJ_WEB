# 사용자 함수를 정의하여 리스트 변수에 점수를 저장하고 평균값과 맥스값을 구하는 코드를 작성하시오

#점수리스트배열
# score_list = []

#점수를 입력해서 점수리스트에 저장하는 함수
# read_score()

#평균을 구하는 함수
#맥스값을 구하는 함수


def print_score(score):
    print(sum(score)/len(score))
    
    
    
def print_max(a, b, c) :
    max_val = 0
    if a > max_val :
        max_val = a
    if b > max_val :
        max_val = b
    if c > max_val :
        max_val = c
    print(max_val)