import urllib.request # http 요청 객체
import requests
# 크롤링을 통해 웹상에 이미지 경로를 얻게되면

img_src = 'https://wallpapercave.com/wp/ryvfi3g.jpg'
save_path ='images/'
save_file = 'bgimg.jpg'

# response = reqursts.get(img_src)

urllib.request.urlretrieve(img_src, save_path+save_file)