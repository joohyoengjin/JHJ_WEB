from bs4 import BeautifulSoup

html_doc = '''
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    </head>
    <body>
    <div class="wrapper">
    <div id="header">
        <header>
        <h2>My Blog</h2>
        </header>
    </div>
    </div>
    </body>
    </html>
'''

soup = BeautifulSoup(html_doc, 'html.parser')
print(soup.prettify())