import os
import csv

if os.path.exists('data/scores2.csv'):
    fr = open('data/scores2.csv', 'r', encoding='utf-8')
    data = csv.reader(fr)

    grade = ['A','B','C','D','F']
    grade_dict = {}
    # 첫번째 라인 건너뛰기
    next(data)
    for i in data:        
        for g in grade:
            if i[2].strip() == g:
                if grade_dict.get(g):
                    grade_dict[g] += 1
                else:
                    grade_dict[g] = 1
                    
    print(grade_dict)
else: 
    print('없음')