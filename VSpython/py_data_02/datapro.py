text = '<div><h2>오늘의 요리를 소개합니다</h2></div>'
print(text[3:10]) # 시작위치:끝나는위치+1
# print(text[9:15])
# print(text[9:])
# print(text[:10])

# print(text.index('오'))
rst = text.find('오리') # 단어를 못찾으면 -1 값을 반환함 (멈추지않음)
if rst == -1:
    print('단어 위치를 찾지 못함')

# 오늘의 요리를 소개를 찾아서 출력하기
# start = text.index('오')
# end = text.index('합')
# print(text[start:end])

# start = text.find('요리')
# end= text.find('합니다')
# print(text[start:end])
