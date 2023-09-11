import requests

JSON_URL = 'https://python.bakyeono.net/data/movies.json'

response = requests.get(JSON_URL)

if response.status_code == 200:
    #print('다운로드 성공')
    # print(response.text)
    result = response.json()
    print(result)