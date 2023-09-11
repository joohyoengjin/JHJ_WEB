# 문제 3 다음 문자열의 불필요한 문자나 숫자를 제거하는 문제입니다

# text_org = '**[세일]** 치와와 강아지 건식 소프트 5종 10000원 ....'
# #결과와 같이 문자열 처리하시오
# #결과 [치와와,강아지,건식,소프트]




import re

text_org = '**[세일]** 치와와 강아지 건식  소프트 5 종 10,000 원 ....'

clean_text = re.sub(r'[^가-힣]+', ' ', text_org)

desired_words = [word.lower() for word in clean_text.split() if len(word) > 2]

print(desired_words)
