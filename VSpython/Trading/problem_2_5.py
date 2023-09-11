
# 문제 5 다음 html 코드에서 <option>안에 텍스트만 추출하여 출력하시오
from bs4 import BeautifulSoup

html = '''
<label for="dog-names">Choose a dog name:</label>
<select name="dog-names" id="dog-names">
<option value="rigatoni">Rigatoni</option>
<option value="dave">Dave</option>
<option value="pumpernickel">Pumpernickel</option>
<option value="reeses">Reeses</option>
</select>
'''


soup = BeautifulSoup(html, 'html.parser')


option_tags = soup.select('select#dog-names option')


for option_tag in option_tags:
    print(option_tag.text)