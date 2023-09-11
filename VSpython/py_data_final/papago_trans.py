import requests # http 통신

papa_client_id = 'SW8wVM0KoMctaa9jLpYj' # 네이버 파파고에서 생성된 클라이언트ID
papa_client_secret = 'Q81srgL7sI'





def get_translate(text, lang): # 문장과 번역언어 입력
    url = 'https://openapi.naver.com/v1/papago/n2mt'

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

    if response.status_code==200 :
        #print('접속성공')
        transText = response.json()
        print(transText['message']['result']['translatedText'])
    else:
        print('접속실패')

text = input('한국어: ')
lang = 'en'
get_translate(text, lang)