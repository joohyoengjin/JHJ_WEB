import pandas as pd

df = pd.read_csv('data/weather.csv', encoding='utf-8')

# 데이터를 셔플해서 80:20 데이터를 분리해서 출력