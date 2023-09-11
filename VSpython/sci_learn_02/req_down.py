import requests

img_src_403 = 'https://wallpapercave.com/wp/ryvfi3g.jpg'

response = requests.get(img_src_403)

save_path = 'images/'
save_file = 'bgimg.jpg'

with open(save_path+save_file, 'wb') as f:
    f.write(response.content)