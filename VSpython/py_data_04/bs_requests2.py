import requests
from bs4 import BeautifulSoup

URL = 'https://rounz.com/home.php'

# div 태그 몇개나 되나요?
response = requests.get(URL)

html_doc = response.text

soup = BeautifulSoup(html_doc, 'html.parser')

div_tags = soup.find_all('div')

print(div_tags)