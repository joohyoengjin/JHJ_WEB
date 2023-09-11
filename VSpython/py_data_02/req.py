# pip install requests 설치후 모듈 로딩
import requests

# 버커깅 웹사이트의 이벤트 페이지
URL = 'https://www.burgerking.co.kr/#/event/0/1' # 버거킹 이벤트
URL2 = 'https://serieson.naver.com/v3/movie' # 네이버 영황

response = requests.get(URL2) # 웹사이트 주소에 요청

# print('응답코드:',response.status_code)
if response.status_code == 200:
    print(response.text)
else:
    print('오류 발생')