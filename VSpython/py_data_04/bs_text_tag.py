text = '''
    <li class="item">
        <a class="item_link" href="www.naver.com">
            <span>네이버</span>
        </a
    </li>
'''

from bs4 import BeautifulSoup
soup = BeautifulSoup(text, 'html.parser')
# print( soup.prettify() )
print('텍스트내용1: ', soup.get_text().strip() )
result = soup.find('span')
print(result)
print('텍스트내용2: ', result.string )

