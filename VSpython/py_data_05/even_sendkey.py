import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By # ver3 -> 4 update
from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup

driver = webdriver.Chrome() # 앞으로 이렇게만 기억함

URL = 'https://en.wikipedia.org/wiki/Main_Page'
driver.implicitly_wait(10) # 암묵적으로 계속 10초 지연

driver.get(URL)

time.sleep(2)
#cdx-text-input__input
#input_search = driver.find_element(By.NAME, 'search')
input_search = driver.find_element(By.CLASS_NAME, 'cdx-text-input__input')
#input_search = driver.find_element(By.CSS_SELECTOR, '.cdx-text-input__input')


time.sleep(2)
input_search.click()
input_search.send_keys('Hiddink')

# time.sleep(2)
#cdx-search-input__end-button
#btn_search = driver.find_element(By.CLASS_NAME, 'cdx-search-input__end-button')
# time.sleep(2)
#btn_search.click()

input_search.send_keys(Keys.ENTER)

html_doc = driver.page_source # 이동된 페이지의 html 소스를 볼 수 있음

soup = BeautifulSoup(html_doc, 'html.parser')

print(soup.prettify())

time.sleep(10)
