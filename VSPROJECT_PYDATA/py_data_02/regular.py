# 1 파이썬에서 정규 표현식을 활용: re 모듈
import re

text = 'python is good for data'
# text2 = '<div><h2>aaabbcd</h2></div>'

mat = re.search('python', text)
# mat2 = re.search('<h2./*h2>',text)

result = mat.group()

print(result)