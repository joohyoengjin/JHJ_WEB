# 사전형자료를 notice 정의해서
# 게시판 한개의 정보를 저장하기
# 쇼핑몰 공지사항 
# 게시물번호 속성명 bno
# 게시물제목 속성명 bname
# 게시물작성 속성명 bwrite
# 게시물조회 속성명 bhit
notice = {'bno': 1, 
          'bname': '쇼핑몰 온픈했어요',
          'bwrite': '관리자',
          'bhit': 100}
# print(notice)

# 키값만 출력
for key in notice.keys():
    print(key, end=' ')
print()
# 값만 출력
for value in notice.values():
    print(value, end=' ')
print()

# 키, 값하고 모두 출력
for key, value in notice.items():
    print(key, value)