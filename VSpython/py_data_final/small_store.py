import pandas as pd

df1 = pd.read_csv('datago/소상공인시장진흥공단_상가(상권)정보_서울_202306.csv', 
                 encoding='utf-8')
df2 = pd.read_csv('datago/소상공인시장진흥공단_상가(상권)정보_경기_202306.csv', 
                 encoding='utf-8')
df3 = pd.read_csv('datago/소상공인시장진흥공단_상가(상권)정보_충북_202306.csv', 
                 encoding='utf-8')
df_tot = pd.concat([df1, df2, df3])
print('상점수:', len(df_tot))
# print(df_tot.columns)
# 컬럼 일부만 가져오기 
df_view = df_tot[['상호명', '상권업종대분류명',
              '상권업종중분류명','상권업종소분류명','시도명', '시군구명', '행정동명']]
# print(df_view)
# df_view.info()

# 상점의 종류를 파악하기
#print(set(df_view['상권업종소분류명'])) # 카페
df_coffee=df_view[df_view['상권업종소분류명']=='카페'] # 커피점 모두
print('커피점 총수:', len(df_coffee))

df_ed = df_coffee[df_coffee['상호명'].str.contains('이디야')] # 스타만

# 도시명 - 서울, 경기, 충북
print('이디야 총수:', len(df_ed))
city = list(set(df_coffee['시도명']))
print(city)
ed_cnt = []
for c in city:
    ed_cnt.append(len(df_ed[df_ed['시도명']==c]))
print(ed_cnt)

# (서울, 경기, 부산, 대전, 광주) 도시에
# 이디야, 메가커피(MGC), 투썸플레이스 커피점이 각각 몇개나 있는가?

# 빵집-제과점-과제 exam1.py
# 파리바게뜨, 뚜레주르 (서울, 경기, 인천, 부산, 광주), 명랑시대쌀핫도그(참고)