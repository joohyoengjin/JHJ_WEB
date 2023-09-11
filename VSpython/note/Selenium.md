# 개요
    * 웹사이트를 테스트하거나 자동화하는 도구가 목적
    * BeatifulSoup와 같이 활용해서 크롤링에 사용 목적 => 현재 수업의 방향

# 설치
    * pip install selenium (라이브러리 설치)
        - 버전 : 4.10
    * webdirver 다운로드 (브라우저별로 버전이 맞는 파일 확인)
    * 브라우저 호출방법
        - Webdriver.Chrome(브라우저 경로나 매니저) # 4.8 이전의 사용방법
        - Webdriver.Chrome() # 4.10 이후의 사용밥법 => 수업에 사용
# 라이브러리 함수들
    * 기본적으로 자바스크립트의 방식과 유사( 브라우저 호출하고 해당 요소를 찾음 )
    * Driver = webdriver.Chrome()
    * Driver.find_element(By.ID, '아이디 명)
    * Driver.find_element(By.CLASS_NAME, '클래스명')
    * Driver.find_element(By.CSS_SELECT, '선택자')
    * Driver.find_element(By.TAG_NAME, '태그명')
    * 값을 찾는 경우(.tag_name, .text)
    * 원래 url에서 다른 url로 변경되는 경우가 있음
        new_url = driver.current_url
    * 이벤트 관련 함수 : html 요소를 선택하고 액션을 제어할 수 있음
        click(), send_key()
        Keys.Enter(엔터, 스페이스)
    * 제어를 모두 완료하게 되면 해당 페이지의 소스를 가져올 수 있음
# Selenium 과 BeautifulSoup 를 연동해서 크롤링