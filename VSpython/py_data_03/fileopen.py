import os

filename = 'data/log4j.txt'

if os.path.exists(filename):
    # print('파일이 존재함')
    fr = open(filename, 'r')
    # print(fr)
    lines = fr.readlines()
    print(len(lines))
    fr.close()
else: 
    print('파일이 없습니다')