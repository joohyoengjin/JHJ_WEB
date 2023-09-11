import selenium
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

URL = 'https://shoemuf.com/member/join.html'

webdriver = webdriver.Chrome()

webdriver.get(URL)

ele_btn = webdriver.find_element(By.ID, 'postBtn')
# print(ele_btn.tag_name)
# print(ele_btn.text)
ele_menus = webdriver.find_elements(By.CLASS_NAME, 'xans-record-')
for el_menu in ele_menus:
    print(el_menu.text)


time.sleep(10)