#1단계
import requests
import re

URL = 'https://serieson.naver.com/v3/movie/products/action?sortType=UPDATE_DESC&price=all'

response = requests.get(URL)
html_data = ''
if response.status_code == 200:
    print('접속성공')
    html_data = response.text
# print(html_data)

start = html_data.find('<div class="ListPage_category_wrap')
end = html_data.find('<div class="ListCollectionTitleBar')
html_uls = html_data[start:end]
uls = html_uls.split('<ul')
print(len(uls))

