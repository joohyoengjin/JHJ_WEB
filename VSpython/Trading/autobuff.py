# Import requests and BeautifulSoup
import requests
from bs4 import BeautifulSoup

# Define the URL of the website
url = "https://autobuff.co.kr/1962/"

# Get the HTML content of the website
response = requests.get(url)

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(response.text, "html.parser")

# Find all the <img> tags that have the class "wp-block-image size-large"
# images = soup.find_all("img", class_=p)
images = soup.find_all("figure" ,class_='wp-block-image size-large')
# Loop through the first 10 images and print their source attribute

for image in images[:10]:
    print(image.img["src"])