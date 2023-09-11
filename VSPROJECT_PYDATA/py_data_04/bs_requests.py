# request
import requests
from bs4 import BeautifulSoup



URL = 'https://news.naver.com/'

response = requests.get(URL) # get, post, delete, update

if response.status_code==200:
   # print('페이지 접속 완료')
    html_doc = response.text
else:
    print('페이지 접속 실패')
    
# print(html_doc)

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())
atag = soup.find_all('a')
print(len(atag))