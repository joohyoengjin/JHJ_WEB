import re

text = '''For other uses, see East Sea (Chinese literature).
See also: Sea of Japan and Sea of Japan naming dispute'''

m = re.search('s.*', text)

result = m.group()

print(result)

# s로 시작하는 단어가 있으면 찾아서 출력 (1개만)

import re

text = '''
<html>
<body>
<p>for other uses, see East Sea (Chinese literature)</p>
<p>See also: Sea of Japan and Sea of Japan naming dispute</p>
<p>Countries with borders on the sea (clockwise from north) include</p>
<p>From Nomo Saki (32°35' N) in Kyusyu to the South point of Hukae Sima </p>
<p>Main article: List of islands in the East China Sea</p>
</body>
</html>'''

# <p> 태그 s 로 시작하는 단어가 있으면 찾아서 출력 (1개만)

m = re.search('<p>.*[s].*,</p>', text)

result = m.group()

print(result)
'''
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

</body>'''

pattern = '<body>'

m = re.search([pattern, text])

tag = m.group()

print(tag)