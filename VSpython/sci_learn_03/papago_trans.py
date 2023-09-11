import pandas as pd
import requests

papa_client_id = ''
papa_client_secret = ''

def get_translate(text, lang): # 문장과 번역언어 입력
    url = 'https://openpi.naver.com/v1/papago/n2mt'
    
    data = {
        'text' : text,
        'source' : 'ko',
        'target' : lang
    }
    
    header = {
        'X-Naver-Client-Id' : papa_client_id,
        'X-Naver-Client-Secret' : papa_client_secret
    }
    
    response = requests.post(url, headers=header, data=data)
    
    # print(response.status_code)
    if response.status_code==200:
            print('접속성공')
            
text = input('한국어: ')
lang = 'en'
get_translate(text, lang)