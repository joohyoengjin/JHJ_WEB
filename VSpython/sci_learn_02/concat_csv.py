# concat1.csv, 2.csv, 3.csv
# 파일데이터를 모두 읽어서
# 데이터를 합쳐서 출력하시오

import pandas as pd

df_all = pd.DataFrame()
for num in range(1,4):
    path = 'data/concat_%d.csv' %num #  파일명이 일정한 패턴이 있는 경우
    df = pd.read_csv(path)
    df_all = pd.concat([df_all, df], ignore_index=True)

print(df_all)