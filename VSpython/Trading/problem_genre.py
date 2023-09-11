
import requests
from bs4 import BeautifulSoup

URL = 'https://serieson.naver.com/v3/movie/products/action?sortType=UPDATE_DESC&price=all'

response = requests.get(URL)

if response.status_code == 200:
    print('접속 성공')  
    html_doc = response.text


    soup = BeautifulSoup(html_doc, 'html.parser')

    genre_list = soup.find('ul', class_='filter_list genre_list')


    if genre_list:

        genres = genre_list.find_all('li')
        for genre in genres:
            genre_name = genre.find('span', class_='txt').text.strip()
            print(genre_name)

