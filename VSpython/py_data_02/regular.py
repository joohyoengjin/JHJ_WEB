# 1 파이썬에서 정규표현식을 활용: re 모듈
import re

# 단순비교
# text = 'python is good for data'
text2 = '<div><h2>caaat</h2></div>'

# 패턴비교
# mat = re.search('python', text)
mat2 = re.search('ca*t', text2) # 시작문자열(패턴)끝문자열

result = mat2.group()

print(result)