import requests
from bs4 import BeautifulSoup

URL = 'https://search.shopping.naver.com/best/home?categoryCategoryId=ALL&categoryDemo=A00&categoryRootCategoryId=ALL&chartDemo=A00&chartRank=1&period=P1D&windowCategoryId=20000056&windowDemo=A00&windowRootCategoryId=20000056'
response = requests.get(URL)
html_doc = response.text
# print(html_doc)

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())

# trend = soup.find_all(class_='home_title__4lcuB')
trend = soup.select('h2.home_title__4lcuB')
print(trend[0])