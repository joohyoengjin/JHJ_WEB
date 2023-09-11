# 텍스트 파일 인코딩 방식 확인
# 데이터 분석 직접 아닌데

import chardet

file_name = 'data/zipdoro.csv'
csvdata = open(file_name, 'rb').read()
result = chardet.detect(csvdata)
enc = result['encoding']
print(enc) # cp949