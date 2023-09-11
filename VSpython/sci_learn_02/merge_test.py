# 직원 정보, 부서정보
# 공통된 컬럼(dept_id)으로 교집합을 구하시오
import pandas as pd

df_emp = pd.read_csv('data/emp_data2.csv')
# print(df_emp)


df_dep = pd.read_csv('data/dept_data2.csv')
df_dep['dept_id'] = df_dep['dept_id'].astype(float)
# print(df_dep)

df_result = pd.merge(df_emp, df_dep, on='dept_id', how='left')
print(df_result)


# 공통된 컬럼(emp_id, mng_id)
# 부서정보 총무 1400 으로 변경하고 교집합을 구하시오