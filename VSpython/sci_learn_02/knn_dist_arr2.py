import numpy as np

fish_length = [25.4, 26.3, 29, 9.8, 10.3, 10.7] # 훈련데이터
fish_weight = [242.0, 290.0, 340.0, 6.8, 7.0, 7.8] 
fish_answer = [0, 0, 0, 1, 1, 1]
new_fish = [20.0, 150] #new_length, new_weight # 샘플데이터

# 거리를 비교해서 0이면 잉어예측, 1이면 송사리예측로 예측하시오
# 훈련데이터를 np자료형 변환
np_f_length = np.array(fish_length)
np_f_weight = np.array(fish_weight)
temp = (np_f_length - new_fish[0])**2 + (np_f_weight - new_fish[1])**2
result = np.sqrt(temp)
print(result)