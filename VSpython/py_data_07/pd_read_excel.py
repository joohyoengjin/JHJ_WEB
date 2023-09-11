import pandas as pd

# pip install openpyxl
# pip install xlrd

file_path = 'data/products.xlsx'

df = pd.read_excel(file_path)

# print(df)
total_sale = df['판매가'].sum()
# print(total_sale)

# 행데이터 합을 구하기 전에 분류번호, 판매가, 원가 : 3컬럼만 선택
df2 = df[ ['분류번호', '판매가', '원가'] ] # 여러컬럼은 대괄호 2개
# print(df2)
total_sale2 = df2['판매가'].sum()
total_sale2m = df2['판매가'].mean()
total_sale2max = df2['판매가'].max()
total_sale2amax = df2['판매가'].argmax()
print('제품판매가의 총합:', total_sale2)
print('제품판매가의 평균:', total_sale2m)
print('제품판매가의 맥스:', total_sale2max)
print('제품판매가의 맥스위치:', total_sale2amax)
# 판매가-원가 계산해서 마진가 컬럼에 추가
df['마진가'] = df['판매가']-df['원가']
id_magin_max = df['마진가'].argmax()
# print(df.loc[index])
# 원가 제일 min 인 제품명, 마진가를 출력
id_first_min = df['원가'].argmin()
# print(id_first_min)
# print(df.loc[id_first_min, ['이름', '마진가']])

# 분류번호 20번이 제품중 판매가가 
# 제일 비싼 제품의 분류번호, 이름, 판매가
print( df.loc[df[df['분류번호']==20]['판매가'].argmax(), 
              ['분류번호','이름','판매가']] )

# 분류번호 중복제거
narr_code = df['분류번호'].unique()
# print(df_code) # numpy 행렬값
# print(type(df_code))
df_code = pd.DataFrame(narr_code, columns=['분류코드'])
print(df_code)


# 분류번호 30번이 제품중 판매가가 
# 제일 비싼 제품의 분류번호, 이름, 판매가

# total_sale3 = df2.loc[0:1].sum(axis=1) # 1 행으로 합
# print('행별로 총합:', total_sale3)

