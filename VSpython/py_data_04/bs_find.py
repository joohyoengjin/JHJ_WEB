# requests 모듈을 통해 html 가져와서 bs4로 출력
import requests
from bs4 import BeautifulSoup

URL = 'https://news.naver.com/'

response = requests.get(URL) # get, post, delete, update
html_doc = ''
if response.status_code==200:
    # print('페이지 접속 완료')
    html_doc = response.text
else:
    print('페이지 접속 실패')

# print(html_doc)

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())
div_tag = soup.find('div', id='glad_ad_sidebox')
print(div_tag)

li_tag = soup.find('li', class_='cjs_age_item')
print(li_tag)