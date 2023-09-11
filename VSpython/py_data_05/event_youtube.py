import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By # ver3 -> 4 update
from selenium.webdriver.common.keys import Keys
import time
import random 

sleep_time = random.uniform(0.5, 1.1)
driver = webdriver.Chrome() # 앞으로 이렇게만 기억함

URL = 'https://www.youtube.com/'
driver.implicitly_wait(10) # 암묵적으로 계속 10초 지연

driver.get(URL)

time.sleep(2)
input_search = driver.find_element(By.NAME, 'search_query')

input_search.click()
input_search.send_keys('피아노')

time.sleep(2)
btn_search = driver.find_element(By.ID, 'search-icon-legacy')
btn_search.click()

time.sleep(5)