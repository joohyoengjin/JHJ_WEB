import numpy as np

carp_fish_length = [25.4, 26.3, 29] 
carp_fish_weight = [242.0, 290.0, 340.0] 
killi_fish_length = [9.8, 10.3, 10.7]
killi_fish_weight = [6.8, 7.0, 7.8]

new_fish = [20.0, 150] #new_length, new_weight
# 여러개를 동시에 계산하기 위해 np.array 변경
np_carp_length = np.array(carp_fish_length)
np_carp_weight = np.array(carp_fish_weight)

np_killi_length = np.array(killi_fish_length)
np_killi_weight = np.array(killi_fish_weight)

# 새로운 물고기와 잉어(3), 송사리(3) 와 거리비교
# print( (np_carp_length - new_fish[0])**2 )
# print( (np_carp_weight - new_fish[1])**2 )
result_carp = (np_carp_length - new_fish[0])**2 + (np_carp_weight - new_fish[1])**2
result_kili = (np_killi_length - new_fish[0])**2 + (np_killi_weight - new_fish[1])**2
print('잉어와 새로운물고기 비교: ', np.sqrt(result_carp))
print('송사리와 새로운물고기 비교: ', np.sqrt(result_kili))