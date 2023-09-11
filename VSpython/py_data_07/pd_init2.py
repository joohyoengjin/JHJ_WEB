import pandas as pd

dict = {'A':10, 'B':20, 'C': 15, 'D': 8, 'F':3}
sr = pd.Series(dict)
print(sr)

# 장르별 영화 갯수
# comedy, drama, sf, action
# 0, 0, 0, 0
# 시리즈를 만드시오
dict2 = {'comedy':0, 'drama':0, 'sf': 0, 'action': 0}
sr2 = pd.Series(dict2)
print(sr2)

# 시리즈나 데이터프레임 자료형 --> dict형으로 
sr2.to_dict()