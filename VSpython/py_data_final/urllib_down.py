import urllib.request # http 요청 객체
import requests # 외부모듈

#  크롤링을 통해 웹상에 이미지경로를 얻게 되면 
img_src = 'https://www.top50glasses.com/upload/files/shop_main/Artboard%2077%20copy-100.jpg'
save_path = 'images/'
save_file = 'bgimg.jpg'

# headers = {"User-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36"}

urllib.request.urlretrieve(img_src, save_path+save_file)
