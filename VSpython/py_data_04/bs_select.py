import requests

from bs4 import BeautifulSoup

URL = 'https://www.cos.com/ko-kr/index.html'
# response = requests.get(URL)
headers = {"User-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"}
response = requests.get(URL, headers=headers)
html_doc = response.text

soup = BeautifulSoup(html_doc, 'html.parser')
# print(soup.prettify())
subject = soup.select_one('div>h1')
a_tags = soup.select('div.departments>a')

# print(subject)
print(a_tags)