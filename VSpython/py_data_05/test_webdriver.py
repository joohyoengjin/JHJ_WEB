import selenium
from selenium import webdriver
import time

driver_path = 'D:/webchrome/chromedriver.exe'
myBrowser = webdriver.Chrome(driver_path)

# myBrowser.get('https://www.burgerking.co.kr/#/store')
myBrowser.get('https://www.youtube.com/')

time.sleep(60)