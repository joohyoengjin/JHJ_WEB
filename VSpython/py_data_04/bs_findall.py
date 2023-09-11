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
                
                <ul id="menu">

                    <li class="subject">HOME</li>
                    <li class="subject">INTRO</li>
                    <li class="subject">SERVICE</li>
                    <li class="subject">NOTICE</li>
                    <li class="subject">CONTACT</li>

                </ul>
            </header>
        </div>
    </div>
</body>
</html>
'''

from bs4 import BeautifulSoup

soup = BeautifulSoup(html_doc, 'html.parser')
print(soup.prettify())

ul_tag = soup.find('ul', id='menu')
li_tags = ul_tag.find_all('li', class_='subject')
print(li_tags)