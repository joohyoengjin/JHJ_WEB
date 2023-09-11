#1단계
import requests
import re

URL = 'https://www.nate.com/?f=auto_news'
response = requests.get(URL)
html_data = ''
if response.status_code == 200:
    # print('접속성공')
    html_data = response.text
# print(html_data)

# 2단계 : html 분석

# 3단계 : 코딩
start = html_data.find('<div class="isKeyword">')
end = html_data.find('<ol class="isKeywordList" id="olLiveIssueKeyword">')
print(start)
print(end)

html_subject = html_data[start:end]
print(html_subject)

pattern1 = '<h4.*/h4>'
mat = re.search(pattern1, html_subject)
h4_subject = mat.group()
print(h4_subject)
pattern2 = '<.+?>'
subject =re.sub(pattern2, '', h4_subject)
print(subject)

start_list = html_data.find('<div class="isKeyword">')
end_list = html_data.find('<form id="frmKeyword"')
# print(start_list, '~', end_list)
html_list = html_data[start_list:end_list]
# print(html_list)
html_li_item = html_list.split('<li>')
Length = len(html_li_item)
pattern3 = '<span class="num_rank".*/span>'
pattern4 = '<span class="txt_rank".*/span>'
for i in range(1, Length):
    mat = re.search(pattern3, html_li_item[i])
    mat_txt = re.search(pattern4, html_li_item[i])
    num = mat.group()
    txt = mat_txt.group()
    num = re.sub(pattern2, '', num)
    txt = re.sub(pattern2, '', txt)
    print(num,'위 ', txt)
