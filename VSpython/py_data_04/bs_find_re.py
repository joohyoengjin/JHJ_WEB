html_doc = '''
    <p class="today">오늘</p>
    <p class="tommorow">내일</p>
    <p class="1234">날짜숫자</p>
'''

from bs4 import BeautifulSoup
import re

soup = BeautifulSoup(html_doc, 'html.parser')

class_tag = soup.find(class_=re.compile('[0-9]'))

print(class_tag)