text = '<div><h2>오늘의 요리를 소개합니다</h2></div>'
# print(text[3:10]) # 시작위치:끝나는 위치+1
# print(text[9:15])
# print(text[9:])
# print(text[:10])

start = text.index('오')
print(text[start:])

# 오늘의 요리 소개를 찾아서 출력하기
# start = text.index('오')
# print(text[start:])


rst = text.find('오리') # 단어를 못찾으면 -1 값을 반환함(멈추지 않음)
if rst == -1:
    print('단어 위치를 찾지 못함')
    
    