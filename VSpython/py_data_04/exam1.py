# 네이트 실시간 이슈 키워드
import requests
import re
from bs4 import BeautifulSoup

URL = 'https://www.nate.com/'
response = requests.get(URL)

html_doc = response.text
# print(html_doc)

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())

div_isKeyword = soup.find('div', class_='isKeyword')
h4 = div_isKeyword.select_one('h4')
print(h4.string)

lies = div_isKeyword.find_all('li')
for li in lies:
    rank = li.select_one('span.num_rank')
    print(rank.string,'위', end=' ')
    txt = li.select_one('span.txt_rank')
    print(txt.string)