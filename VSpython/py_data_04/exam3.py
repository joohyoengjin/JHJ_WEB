import requests
import re
from bs4 import BeautifulSoup

URL = "https://www.melon.com/chart/week/index.htm"
headers = {"User-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"}
response = requests.get(URL, headers=headers)
if response.status_code==200:
    print('접속 성공')
    html_doc = response.text

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())
div_genres = soup.find('div', class_='wrap_tabmenu_sub')
dd_genres = div_genres.find_all('dd')
urls = {}
for dd_genre in dd_genres:
    lies = dd_genre.select('li')
    for li in lies:
        gname = li.get_text().strip()
        key = gname
        URL = 'https://www.melon.com' + li.find('a').get('href').strip()
        value = URL
        urls[key] = value     
           
print(urls)
        