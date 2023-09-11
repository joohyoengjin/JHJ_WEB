import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By # 4버전 이후 태그정보
#from selenium.webdriver.common.keys import Keys
import time # 디버깅 -> 실제는 wait 함수
import random # 일시정지시간을 랜덤하게 변경
from bs4 import BeautifulSoup
sleep_time = random.uniform(0.5, 2.0) # 0.5 ~ 2.0 사이에 랜덤값 (예)0,5555445

driver = webdriver.Chrome()
URL = 'https://www.starbucks.co.kr/index.do'
driver.get(URL)

time.sleep(2)
gnb_store = driver.find_element(By.CSS_SELECTOR, '.gnb_nav03 a')
gnb_store.click()

time.sleep(2)
store_btn = driver.find_element(By.CSS_SELECTOR, 'div.store_bn1_btn>a')
store_btn.click()

#페이지 이동됨
URL2 = driver.current_url
driver.quit()
driver2 = webdriver.Chrome()
driver2.get(URL2)

local_taB = driver2.find_element(By.CSS_SELECTOR, 'header.loca_search a')
local_taB.click() #지역검색
time.sleep(2)

sidoes = driver2.find_element(By.CLASS_NAME, 'sido_arae_box')
seoul_li = sidoes.find_elements(By.TAG_NAME, 'li')
seoul_li[0].click() # 시도 (서울)
time.sleep(2)

gugun = driver2.find_element(By.CLASS_NAME, 'gugun_arae_box')
yongdungpo_li = gugun.find_elements(By.TAG_NAME, 'li')
yongdungpo_li[20].click() # 데이터를 가져오는데 시간이 걸림
time.sleep(2) # 비동기로 데이터를 가져오기 때문에 명시적인 일시정지가 필요함

#크롤링 시작
html_doc = driver2.page_source
soup = BeautifulSoup(html_doc, 'html.parser')
quickresult = soup.find('ul', class_='quickSearchResultBoxSidoGugun')
starbuck_stores = quickresult.find_all('li')
print('영등포 매장갯수:', len(starbuck_stores))
for store in starbuck_stores:
    print('매장명:', store.find('strong').text)
    print('매장주소:', store.find('p').text)
    print()

time.sleep(10)