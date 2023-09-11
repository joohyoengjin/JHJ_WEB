import re

html = '''
<h2>Absolute URLs</h2>
<p><a href="https://www.w3.org/">W3C</a></p>
<p><a href="https://www.google.com/">Google</a></p>

<h2>Relative URLs</h2>
<p><a href="html_images.asp">HTML Images</a></p>
<p><a href="/css/default.asp">CSS Tutorial</a></p>
'''
pattern = '<h2.*/h2>'
tags = re.findall(pattern, html)

pattern2 = '<.+?>'
for tag in tags:
    result = re.sub(pattern2, '', tag)
    print(result)