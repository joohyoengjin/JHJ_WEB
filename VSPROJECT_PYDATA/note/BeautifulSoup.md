ㄱ. 개요:HTML 기반의 텍스트를 파싱해서 검색해주는 외부모듈
ㄴ. 사용법
    A. 설치 : pip install BeautifulSoup4
    B. 호출 : from bs4 import BeautifulSoup
    C. 생성 : soup = BeautifulSoup(html_doc, 'html.parser')
ㄷ. 모듈이므로 함수 사용법을 익힘
    A. Tag = find('태그명','속성=속성값') # 첫번째만 찾음
    B. Tag = find_all('태그명','속성=속성값') # 첫번째만 찾음