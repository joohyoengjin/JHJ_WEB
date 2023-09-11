import re

text = '''
    <body>
    <a href="index.html">
        <h1>HTML 홈페이지 만들기</h1>
    </a>

    <h2>목차</h2>
    <ul>
        <li>HTML의 탄생</li>
        <li>HTML 특징</li>
        <li>HTML 페이지 구조</li>
        <li>HTML 홈페이지 만들기</li>
    </ul>

    <h3>HTML의 탄생</h3>
    <p>HTML은 <strong>Hyper Text Markup Language</strong>라는 용어의 약자로서 물리학자 <strong>팀 버너스리</strong>가 1990년에 HTTP, URL,
        브라우저와 함께 개발했습니다. 팀 버너스리는 인터넷의 기반을 닦은 여러 공로로 웹의 아버지라고 불리는 인물 중 하나입니다.</p>

    </body>
'''

# pattern = '<h3.*/h3>'
pattern = '<li.*/li>'

# 한개
# m = re.search(pattern, text)
# tag = m.group()
# print(tag)

# 멀티개
tags = re.findall(pattern, text)

for tag in tags:
    print(tag)

