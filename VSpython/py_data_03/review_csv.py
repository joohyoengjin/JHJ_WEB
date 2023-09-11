# scores.csv 파일을 읽어서 점수들의 목록을 출력 (중복제거)
import os # 표준모듈 - 파일, 디렉토리 정보를 확인
import csv # 표준모듈 - 확장자 csv 파일 읽는데 활용

if os.path.exists('data/scores.csv'):
    fc = open('data/scores.csv', 'r', encoding='utf-8')
    scores = csv.reader(fc)
    next(scores)
    result = []
    for s in scores:
        temp = s[2].strip().split('|')
        print(temp)
        temp2 = [int(num) for num in temp]
        # print(sum(temp2))
        result.append(sum(temp2))
        #각 점수들의 합계를 출력하기
else: 
    print('없음')

print(result)