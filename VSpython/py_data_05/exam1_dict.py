import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By # 태그정보
from selenium.webdriver.common.keys import Keys
import time # 디버깅 -> 실제는 wait 함수
import random # 일시정지시간을 랜덤하게 변경
from bs4 import BeautifulSoup
sleep_time = random.uniform(0.5, 2.0) # 0.5 ~ 2.0 사이에 랜덤값 (예)0,5555445

driver = webdriver.Chrome() # 크롬브라우저를 호출위한 객체
driver.implicitly_wait(5)   # 기본적으로 5초 지연하되 찾게 되면 무시하고 다음 스텝
URL = 'https://dict.naver.com/'
driver.get(URL)

# name="dicQuery" 으로 요소를 찾기
# time.sleep(2) # 디버깅용
input_dict = driver.find_element(By.NAME, 'dicQuery')
input_dict.click() # INPUT TEXT 선택
input_dict.send_keys('여름음식')  #INPUT TEXT 검색어 입력
input_dict.send_keys(Keys.ENTER) # 엔터 입력

# 이벤트 처리 등이 완료 페이지의 정보를 가져오기
html_doc = driver.page_source
# selenium + BeautifulSoup를 같이 활용
soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())

# 크롤링 시작
ul_lst_krdic = soup.find('ul', class_='lst_krdic') # 한개만 존재함 : find()

lies = ul_lst_krdic.select('li')

for li in lies:
    print(li.get_text().strip())

time.sleep(10)
