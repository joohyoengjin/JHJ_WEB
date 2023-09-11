# URL = 'https://datalab.naver.com/;'

# 슬라이드 안에 인기분야 순위들 - 맨마지막 날짜 영역
# 그안에 날짜, 순위목록 출력


import requests
from bs4 import BeautifulSoup

URL = 'https://datalab.naver.com/'


response = requests.get(URL)

if response.status_code == 200:
    print('접속 성공') 
    html_doc = response.text

    soup = BeautifulSoup(html_doc, 'html.parser')
    section_popular_ranking = soup.find('div', class_='rank_list v2')

    last_date = section_popular_ranking.find('strong', class_='title_cell').text.strip()
    print('Last Date:', last_date)

    rankings = section_popular_ranking.find_all('li')
    for rank in rankings:
        category = rank.find('span', class_='item_title').text.strip()
        value = rank.find('span', class_='item_num').text.strip()
        print(f'{category}: {value}')

