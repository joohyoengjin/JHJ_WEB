import pandas as pd

# data 리스트 생성
data = [
    ['3R', 1510, 7.36],
    ['3SOFT', 1790, 1.65],
    ['ACTS',1185,1.28]
]

# data 리스트 내의 종목명 변경
data[0][0] = '037730'
data[1][0] = '036360'
data[2][0] = '005760'

# data 리스트를 데이터프레임으로 변환
df = pd.DataFrame(data)

# 컬럼명 지정
df.columns = ['종목명', '현재가', '등락율']

# 데이터프레임에 새로운 라인 추가
df.loc[3] = ['066570', 'LG전자', 60000, 3.84]



# 데이터프레임 출력
print(df)


