# 1번째로 sample_dept.xlsx파일을 읽기
import numpy as np
import pandas as pd

excel_data = 'data/sample_dept2.xlsx'
df = pd.read_excel(excel_data)

print(df)
# group_df = df.groupby('부서번호')
# group_avg = group_df['급여'].mean()
# print(group_avg)

group_gender_sal = df.groupby('성별')['급여'].mean()
group_gender_age = df.groupby('성별')['나이'].mean()
# print(group_gender_sal)

# 그룹핑 결과를 다시 데이터플레임
df_grp_gender = pd.DataFrame({
    '평균급여': group_gender_sal,
    '평균나이': group_gender_age
})
print(df_grp_gender)