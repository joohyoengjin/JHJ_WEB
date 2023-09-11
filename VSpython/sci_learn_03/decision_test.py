import pandas as pd

df = pd.read_csv('data/weather.csv', encoding='utf-8')

print(df)

# 온도로 선택한다면
# hot - sunny 개수, mild- sunny 갯수, cool-sunny 갯수
df_group_temp = df[df['outlook']=='sunny'].groupby('temperature')['outlook'].count()
print(df_group_temp)

# 날씨(outlook) 에 대한 지니계수를 계산
total_outlook = df['outlook'].size
# sunny순도 = [sunny총갯수/전체갯수]**2 
total_sunny = df[df['outlook']=='sunny']['outlook'].size
# rainy순도 = [rainy총갯수/전체갯수]**2 
total_rainy = total_outlook - total_sunny
# 날씨에 대한 불순도 = 1 -[sunny순도+rainy순도]
result_temp = 1 - ( (total_sunny/total_outlook)**2 + (total_rainy/total_outlook)**2 )
print('outlook 노드에서 불순도: ', result_temp)

# 온도(temperature) 가 hot 일때 날씨의 지니계수 계산
total_outlook_hot = df[df['temperature']=='hot']['outlook'].size

total_temp_hot = df[df['temperature']=='hot'] #4
total_sunny_hot = total_temp_hot[total_temp_hot['outlook']=='sunny']['outlook'].size #4
total_rainy_hot = total_outlook_hot - total_sunny_hot #0

result_temp_hot = 1 - ( (total_sunny_hot/total_outlook_hot)**2 + (total_rainy_hot/total_outlook_hot)**2 )
print('outlook_hot 노드에서 불순도: ', result_temp_hot)

# 습도(humidity) 가 high 일때 날씨의 지니계수 계산


