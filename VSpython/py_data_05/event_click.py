import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

URL = 'https://dict.naver.com/'

driver = webdriver.Chrome()

driver.get(URL)

time.sleep(2)
ele_kr_menu = driver.find_element(By.ID, '_id_krdic_href')

# print(ele_kr_menu.tag_name)
time.sleep(2)
ele_kr_menu.click()

time.sleep(10)