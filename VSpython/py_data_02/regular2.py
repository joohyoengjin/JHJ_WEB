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
    </html>
'''
# <p>태그 s로 시작하는 단어가 있으면 찾아서 출력 (1개만)

# m = re.search('<p>.*[s].*</p>', text)
all = re.findall('<p>.*[s].*</p>', text)

print(len(all))