import requests
from bs4 import BeautifulSoup


URL = 'https://rounz.com/home.php'


response = requests.get(URL)

html_doc = response.text


# print(html_doc)

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())
div_tag = soup.find('div', id='glad_ad_sidebox')
print(div_tag)

li_tag = soup.find('li', class_='cjs_age_item')
print(li_tag)