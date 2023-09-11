import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

URL = 'https://www.wikipedia.org/'

# selenium 사용하여
# 한국어메뉴를 클릭해서 이동하시오
driver = webdriver.Chrome()
# time.sleep(초) 강제적인 코드보다 암목적인 wait 코드 변경
driver.implicitly_wait(10)
driver.get(URL)

en_click = driver.find_element(By.ID, 'js-link-box-en')
# time.sleep(2)
en_click.click()

time.sleep(10)