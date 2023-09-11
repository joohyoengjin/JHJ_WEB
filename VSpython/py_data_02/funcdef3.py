# 수학 영어 국어 3 개의 값을 평균을 구하는 함수
# 소수점 반올림 소수 2째자리에서
# 60.4567 -> 60.5

def school_avg(sc1, sc2, sc3):
    avg = 0
    avg = (sc1+sc2+sc3)/3
    #추가로 반올림 처리
    avg = round(avg, 1)
    return avg

result = school_avg(93,85,78)
print('평균은: ', result)