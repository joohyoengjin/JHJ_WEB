# pip install pandas
# import pandas as pd (pd: 일반적으로 편리를 위해 많이씀)
# 대용량 데이터와 연관이 깊다 ( BD , 빅데이터, 파일 등등 가져와서 처리)
- Series 자료형
# 인덱스만 있는 1차원 배열
# Pd.Series([리스트] 또는 Numpy 자료형): 기본적으로 인덱스가 숫자임
# Pd.Series({ 딕셔너리 }): 키값을 인덱스로 사용
- DataFrame 자료형
# 인덱스와 컬럼이 있는 2차원 테이블
# Pd.DataFrame({딕셔너리키값:[리스트]}): 인덱스명 - 숫자,  딕셔너리키값 - 컬럼명
# 컬럼명이나 인덱스명을 바꿀수 있음
# (예시) df.rename(indexs={딕셔너리}, columns={ 딕셔너리 })
# (예시) df.index = [리스트], df.columns=[리스트]

- DataFrame 요소 접근 및 변경 (열이름)
# Df['새컬럼명'] = [리스트]
# Df['새컬럼명'] = df['컬럼명'] > 10000 (비교식 : 논리값)
# Df = df.drop ('컬럼명'  , axis =1 ) # 삭제, 수정경우

- DataFrame 요소 접근 및 변경 (행이름)
# Df.iloc(인덱스 번호) : 행을 접근
# Df.loc(인덱스 명) : 행을 접근
# 행값을 추가하려면
    (예시1) df.loc[인덱스, :] = [리스트값]
    (예시2) df.append(다른 데이터프레임 , ignore_index=True)
    (참고)2.0 이하에서만 가능
    (예시3) pd.concat([df1, df2, df3])
# 행값으로 선택
    (예시) df[0:3, 생략] 처음행 ~ 3번행까지 데이터 모두
    (예시2) df.loc[0:2] 위와 동일함

# DataFrame 관련함수
- 통계관련 계산 sum, mean, median, argmax(최대값 위치), argmin, unique(중복제거)
  std(표준편차),var count( 갯수 세기)
- 통계 계산산시 계산 방향 2가지
 i. 기본적으로 열방향 sum(axis=0)
 ii. 행방향 sum(axis=1)

# 그룹함수
  i. 리스트값 = Df.groupby('집합컬럼명')['계산컬럼명'].mean()
  ii. 활용

# pandas 모듈의 특징
* DataFrame 의 다양한 함수
* index와 columns 를 변경할 수 있음
 - iloc : 행 인덱스로 값을 가져올 수 있음
 - loc : 행 이름으로로 값을 가져올 수 있음


