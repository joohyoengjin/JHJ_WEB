import requests 

#img_src_403 = 'https://wallpapercave.com/wp/ryvfi3g.jpg'
img_src_403 = 'https://i0.wp.com/autobuff.co.kr/wp-content/uploads/2022/11/%EB%B4%89%EA%B3%A0_3_ev.jpg'

response = requests.get(img_src_403)

save_path = 'images/'
save_file = 'bgimg3.jpg'

with open(save_path+save_file, 'wb') as f:
    f.write(response.content)