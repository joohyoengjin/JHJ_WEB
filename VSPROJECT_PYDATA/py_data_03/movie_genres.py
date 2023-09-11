import os
import csv

filename = 'data/movies.csv'
genres = []
genres2 = [] # 중복제거된 데이터
if os.path.exists(filename):
        # print('영화샘플데이터 존재함')
        fr = open(filename, 'r' , encoding='utf-8')
        data = csv.reader(fr)
        print(next(data))
        
        for i in data:
            genres.extend(i[2].split('|'))
            
        genres2 = set(genres)
        genres2 = list(genres2)
        # print(genres2)
        print(len(genres2))
        
        # 2번째 분석 : 장르별 영화 갯수
        fr2 = open(filename, 'r' , encoding='utf-8')
        data2 = csv.reader(fr2)
        
        gr2_dict = { key : None for key in genres2}
        for key in gr2_dict:
            for i in data2:
                print(key)