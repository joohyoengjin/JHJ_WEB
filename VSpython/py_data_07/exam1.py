import numpy as np
import pandas as pd

# 1번: csv 파일읽기
csv_file = 'data/movies.csv'
df = pd.read_csv(csv_file, encoding='utf-8')
# movieId, title, genres
# 인덱스번호
# print(df) 
# 제목에서 (연도) 정보를 추출해서 새로운 컬럼을 만드시오
# print(df['title'].str.extract(r'(\d{4})'))
# print(df['title'].str[-5:-1])

years = []
for title in df['title']:
    years.append( title[-5:-1] )

df_years = pd.DataFrame(years, columns=['mov_year'])
df = pd.concat([df, df_years], axis=1)
print(df)