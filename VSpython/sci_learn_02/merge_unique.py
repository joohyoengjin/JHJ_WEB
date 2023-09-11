import pandas as pd

df_price = pd.read_excel('data/stock price.xlsx')
df_value = pd.read_excel('data/stock valuation.xlsx')
print(df_price['id'])
print(df_value['id'])

# 아이디 정보를 모두 합하시오 10 + 10
pd_result = pd.concat([df_price['id'], df_value['id']], ignore_index=True)
print(pd_result.unique())