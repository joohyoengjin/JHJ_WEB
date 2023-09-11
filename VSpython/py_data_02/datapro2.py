text = '<div><h2> 오늘의 요리 를 소개합니다</h2></div>'

start = text.find('오늘')
text_temp = text[start:start+7]
text_strip = text_temp.strip()
print(text_temp)

if text_strip == '오늘의 요리':
    print('같은 문자열')
else: 
    print('다른 문자열')