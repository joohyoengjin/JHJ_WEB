# 컬럼명
# rank [1,2,3,4,5]
# title ['제목1',....]
# album, 
# link_url 
# 멜론차트에서 5개의 정보를 df 자료형으로 정의
import pandas as pd
data = {
    'rank': [1,2,3,4,5],
    'title': ['슈퍼사이','세븐','eta','퀀카','말해요'],
    'album': ['뉴진','세븐7','뉴진','필','얼론'],
    'link_url': ['youtube.com?s=s','youtube.com?s=s','youtube.com?s=s','youtube.com?s=s','youtube.com?s=s'],
}
df = pd.DataFrame(data)
df = df.rename(columns = 
          {'rank':'순위', 'title':'제목', 
            'album':'앨범', 'link_url':'링크'})
print(df)