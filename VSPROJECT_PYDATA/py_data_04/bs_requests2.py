import requests
from bs4 import BeautifulSoup


URL = 'https://rounz.com/home.php'


response = requests.get(URL)

html_doc = response.text

soup = BeautifulSoup(html_doc, 'html.parser')

div_tag = soup.find_all('div')

print(div_tag)


# div 태그 몇개나?