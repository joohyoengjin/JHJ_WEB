genres2 = ['Animation', 'Fantasy', 'Thriller', 'Documentary', 'Musical',
           'Comedy', 'Crime', 'Film-Noir', 'Drama', 'Horror', 
           'Adventure', 'Children', 'War', 'IMAX', 'Sci-Fi', 
           '(no genres listed)', 'Romance', 'Western', 'genres', 'Action', 
           'Mystery']

print(genres2)

import os
import csv

filename = 'data/movies.csv'

if os.path.exists(filename):
    fr = open(filename, 'r', encoding='utf-8')
    data = csv.reader(fr)
    
    genres2_dict = {}

    for i in data:
        for g in genres2:
            if i[2].find(g) != -1 :
                if genres2_dict.get(g):
                    genres2_dict[g] += 1
                else:
                    genres2_dict[g] = 1

    print(genres2_dict)
    



