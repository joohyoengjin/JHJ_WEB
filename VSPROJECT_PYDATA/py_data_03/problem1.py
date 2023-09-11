import requests
import re

URL = 'https://serieson.naver.com/v3/movie'
response = requests.get(URL)
html_data = ''
if response.status_code == 200:
    # print('접속성공')
    html_data = response.text
    
    