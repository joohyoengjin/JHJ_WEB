html_doc = '''
    <div class="clock wall">
        <h2>벽시계1</h2>
        <h2>벽시계1</h2>
    </div>

    <div class="clock hand">
        <h2>손목시계1</h2>
        <h2>손목시계1</h2>
    </div>
'''

from bs4 import BeautifulSoup

soup = BeautifulSoup(html_doc, 'html.parser')

print(soup.prettify())

clock = soup.find_all('div', class_='clock')

clock_hand = soup.find_all('div', class_='clock hand')

print(clock)

print(clock_hand)

