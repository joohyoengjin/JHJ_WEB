import os
import csv

if os.path.exists('data/scores2.csv'):
    fr = open('data/scores2.csv', 'r', encoding='utf-8')
    data = csv.reader(fr)
    
    for i in data:
        print(i)
else:
    print('없음')