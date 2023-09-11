#1단계
import requests
import re

URL = 'https://serieson.naver.com/v3/movie'
response = requests.get(URL)
html_data = ''
if response.status_code == 200:
    # print('접속성공')
    html_data = response.text
# print(html_data)

# 2단계

# 3단계
start = html_data.find('<div class="HomeAside_ranking')
end = html_data.find('<ul class="TopRanking_top')
print(start, '~', end)
html_movie100 = html_data[start:end]
print(html_movie100)

pattern1 = '<h2.*/h2>'
mat = re.search(pattern1, html_movie100)
h2_subject = mat.group()
print(h2_subject)
pattern2 = '<.+?>'
subject_temp =re.sub(pattern2, '', h2_subject)
print(subject_temp)
subject = subject_temp[0:subject_temp.find('더보기')]
print(subject)