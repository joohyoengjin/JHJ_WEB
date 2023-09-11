# 1단계
import requests
import re

URL = 'https://www.nate.com/?f=auto_news'
response = requests.get(URL)
html_data = ''
if response.status_code == 200:
    # print('접속성공')
    html_data = response.text
    
# 3단계 : 코딩
start = html_data.find('<div class="isKeyword">')
end = html_data.find('<ol class="isKeywordList" id="olLiveIssueKeyword"')
print(start)
print(end)

html_subject = html_data[start:end]
print(html_subject)

pattern1 = '<h4.*/h4>'
mat = re.search(pattern1, html_subject)
h4_subject = mat.group()
print(h4_subject)

pattern2 = '<.+?>'
subject = re.sub(pattern2, '', h4_subject)
print(subject)

