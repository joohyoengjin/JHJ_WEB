import pandas as pd

score1 = [90, 70, 80, 100]
sr = pd.Series(score1) # 리스트, numpy
# print(sr)
# 기존 데이터플레임에 합치기
score0 = {
    'name' : ['kim', 'lee', 'ha', 'jun'],
}
df = pd.DataFrame(score0)
# print(df)

# df_result = pd.concat([df, sr], axis=1)
# df_result.columns = ['name', 'score1'] # df_result.rename({})
df['score1'] = sr

print(df)
