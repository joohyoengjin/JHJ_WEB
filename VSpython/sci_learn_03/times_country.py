import datetime
from datetime import datetime
import pandas as pd

df = pd.read_csv('data/country_timeseries.csv', encoding='utf-8')

# pandas 에 있는 to_datetime() 날짜형식으로 변환
df['date_dt'] = pd.to_datetime(df['Date'], format='%m/%d/%Y') # 컬럼추가

print(df.head())
#print(df.iloc[0: ,:5])
#print(type(df.loc[0, 'date_dt'])) 한개의 데이터를 날짜 타입
print('최초 날짜', df['date_dt'].min())
print('최근 날짜', df['date_dt'].max())

#print(df.columns)

# Date (발생한 날짜) - 최초발생날짜 = 몇일간 진행된 날짜
df['days'] = ( df['date_dt'] - df['date_dt'].min() ).dt.days
print(df[['Date','days']])
