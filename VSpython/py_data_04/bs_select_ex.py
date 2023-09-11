import requests
from bs4 import BeautifulSoup

URL = 'https://nhj12311.tistory.com/520'
URL2 = 'https://m.blog.naver.com/main6406/222989115231'
response = requests.get(URL2)
html_doc = response.text

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())
#subject = soup.select_one('h4>b')
#print(subject)

hp_ranking = soup.select('span.se-fs-fs19>b')
print(hp_ranking[15:25])