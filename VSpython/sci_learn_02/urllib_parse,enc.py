import urllib.parse
import urllib.request
import selenium
from selenium.webdriver import webdriver
import time

# search_word = '멜론 차트'
# # 퍼센트 인코딩으로 변환하기
# test = urllib.parse.quoto(search_word)
# print(test)


# 퍼센트 인코딩을 사용하여 변환된 단어로
sample_key = '영화 액션'
percent_key = urllib.parse.quote(sample_key)
# 유튜브 검색하기 단 셀레니엄으로 화면 출력
youtube_site = 'https://www.youtube.com/results?search_query='
search_url = youtube_site + percent_key

driver = webdriver.Chrome()

driver.ger(search_url)

time.sleep(10)