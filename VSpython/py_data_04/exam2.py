import requests
import re
from bs4 import BeautifulSoup

URL = 'https://autobuff.co.kr/1962/'
response = requests.get(URL)

html_doc = response.text
soup = BeautifulSoup(html_doc, 'html.parser')

title = soup.find('h1', class_='post-title')
print(title.string)
ranks = soup.select('h2.wp-block-heading')
# print(len(ranks))
for i in range(len(ranks)):
    print(ranks[i].string)
    if i==3: 
        st_str = str(ranks[3])
        en_str = str(ranks[4])
        st_pos = html_doc.find(st_str)
        en_pos = html_doc.find(en_str)
        p_doc= html_doc[st_pos:en_pos]
        soup_p = BeautifulSoup(p_doc, 'html.parser')
        ranks2 = soup_p.select('p')
        print(ranks2[1].string)
        print(ranks2[3].string)


