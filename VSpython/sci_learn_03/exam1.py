# 문제1
# 대여하면 취소를 했을 때 환불 규정

import datetime
from datetime import datetime, timedelta
import pandas as pd

df_return = pd.read_excel('data/return_rule.xlsx')
df_cancel = pd.read_excel('data/cancle_data.xlsx')

df_cancel['temp'] =pd.to_datetime(df_cancel['reserve_date'])-pd.to_datetime(df_cancel['cancel_date'])
df_cancel['day_diff'] = df_cancel['temp'].dt.days
df_cancel['result'] = (10-df_cancel['day_diff']) * df_cancel['fare'] / 10
# print(df_cancel)

def replace_zero(vec):
    if vec < 0:
        return 0
    else :
        return vec

df_cancel['result'] = df_cancel['result'].apply(replace_zero)
print(df_cancel)


