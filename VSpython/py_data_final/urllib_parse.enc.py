import urllib.parse
import urllib.request
import selenium
from selenium import webdriver
import time

#search_word = '멜론 차트'
# 퍼센트 인코딩으로 변환하기
# test = urllib.parse.quote(search_word)

# 퍼센트 인코딩을 사용하여 변환된 단어로
sample_key = '영화 액션'
percent_key =  urllib.parse.quote(sample_key)

# 유뷰브 검색 하기 단 셀러니엄으로 화면 출력
# youtube.com/results?search_query=%EB%93%9C%EB%9D%BC%EB%A7%88+%EC%9D%B8%EA%B8%B0
# %EC%9D%B8%EA%B8%B0%EB%85%B8%EB%9E%98+%EB%A9%9C%EB%A1%A0
youtube_site = 'https://www.youtube.com/results?search_query='
search_url = youtube_site + percent_key

driver_path = 'D:/webchrome/chromedriver.exe'
driver = webdriver.Chrome(driver_path)

driver.get(search_url)

time.sleep(20)



