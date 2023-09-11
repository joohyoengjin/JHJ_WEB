# 패턴: 날짜,이름,메세지
text = ' 2021-12-25,김 건우,지금  업무중..  '

# print(text)
# text_strip = text.strip()
# print(text_strip)
# text_strip2 = text_strip.replace(' ', '')
# print(text_strip2)
# print(text_strip2.replace('.',''))

# 샘플 연습
text2 = '    happy.new-year, myfriend  '
# happy new year,myfriend
# temp = text2.strip()
# temp2 = temp.replace(' ', '')
# temp3 = temp2.replace('.',' ')
# temp4 = temp3.replace('-',' ')
# print(temp4)

import re

text3 = '     today, weather     '

result = re.sub(r'\s+', '', text3)

print(result)
