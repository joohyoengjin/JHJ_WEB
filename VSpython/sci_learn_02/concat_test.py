# 두 개 이상의 데이터프레임을 합치기

data1 = {
    '번호'   : [10,20,30],
    '제목'   : ['공지글1','자료글2','자유글3'],
    '작성자' :['관리자','손님','개발자'] 
}

data2 = {
    '순서'   : [40,50,60],
    '주제'   : ['공지글4','자료글5','자유글6'],
    '글쓴이' : ['관리자','손님','개발자']
}
import pandas as pd
# 데이터프레임으로 변환
df1 = pd.DataFrame(data1)
df1.columns = ['NO', 'TITLE', 'WRITER']
df2 = pd.DataFrame(data2)
df2.columns = ['NO', 'TITLE', 'WRITER']

# 새로운 컬럼 NO, TITLE, WRITER
print(pd.concat([df1, df2], ignore_index=True))