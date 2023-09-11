import requests

URL = 'https://serieson.naver.com/v3/search'
# URL = 'https://www.google.co.kr/search'


params = {'query':'미션임파서블'}
response = requests.get(URL, params=params)

if response.status_code==200:
    print(response.text)
else:
    print('실패')