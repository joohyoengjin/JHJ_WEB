import os
import csv

filename = 'data/movies.csv'
genres = []
genres2 = [] # 중복제거된 데이터
if os.path.exists(filename):
    # print('영화샘플데이터 존재함')
    fr = open(filename, 'r', encoding='utf-8')
    data = csv.reader(fr)

    for i in data:
        genres.extend(i[2].split('|'))

    print(genres)
    genres2 = list(set(genres))
    print(genres2)
    print(len(genres2))

    # 2번쩨 분석 : 장르별 영화 갯수


        