# 파이썬 pandas 체크문제

# 문제1 기업의 주가 데이터로 데이터 프레임을 만들고 인덱스와 컬럼명을 변경하기


import pandas as pd

data = [
    ['3R', 1510, 7.36],
    ['3SOFT', 179, 1.65],
    ['ACTS', 1185, 1.28]
]


index_names = ['037730', '036360', '005760']
column_names = ['종목명','현재가','등락률']

df = pd.DataFrame(data, index=index_names, columns=column_names)

print(df)

current_price_rate_df = df[['현재가', '등락률']]
print(current_price_rate_df)



# Print the updated DataFrame
print(df)


# 인덱스명(종목코드) '037730', '036360', '005760'
# 컬럼명 ['종목명', '현재가', '등락률']

# 문제2
# 위의 데이터프레임에서 "현재가"와 "등락률" 컬럼을 인덱싱하기

# 문제3
# 위의 데이터프레임에 데이터를 추가하시오
# 종목코드 종목명 현재가 등락률
# 066570   LG전자 60000   3.84